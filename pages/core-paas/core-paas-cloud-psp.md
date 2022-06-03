# Pod Security

PodSecurityPolicies (PSPs) are one method by which kubernetes authorizes Pods
to perform privilege escalations. This document is a summary of how core-paas
PSPs work, but if you want full details, please see the [upstream
documentation](https://kubernetes.io/docs/concepts/policy/pod-security-policy/).

When a Pod is created in Kubernetes, the PodSpec (specifically, the
`securityContext` field) is compared against each PSP in alphabetical order by
name; if the Pod and PSP match, the PSP is chosen and the Pod is authorized to
start; if no PSPs match, the Pod is denied.

We generate our PSPs from feature flags, each of which represents a type of
escalation above the basic / unprivileged Pod spec.

## Privileges tracked

1. `host`: this allows general host and capability access. This level permits
    container breakouts.
2. `root`: this allows the container to run as root, which may allow container
   breaks.
3. `nfs`: this allows the container to mount NFS volumes.
4. `mutablefs`: this allows the container to have a mutable rootfs.
5. Kubernetes API access (i.e. the Pod itself is allowed to make API calls);
   this is not handled via PSP, but is documented here for completeness.

# How do I request a privilege?

Most authorization is handled via the `securityContext` key in Pods. This can be
confusing, because there are actually two `securityContext` keys, one at the Pod
level and one at the Container level:

```
apiVersion: v1
kind: Pod
spec:
  securityContext:
    podKeyGoesHere: true
  containers:
    - name:  app
      image: myimage
      securityContext:
        containerKeyGoesHere: true
```

`securityContext` is always a yaml map, but the effect (and supported keys)
depends on whether the pod- or container-level `securityContext` used; the
container-level `securityContext` applies to a single container, and the
pod-level one applies to every container in the pod. If a key is provided on
both the Container and the Pod `securityContext`, the container-level one wins.

**NOTE**: If you misspell a `securityContext` key, Kubernetes will not catch it.
Watch those typos!

## core-paas-base chart

If you're using >= 4.0.0 of the core-paas-base chart, there's an easier way,
the `base.security.container` template, documented
[here](https://github.com/mulesoft/core-paas-base#basesecuritycontainer).

## Which securityContext keys do I need for each feature?

1. `host`: Intentionally not documented. Please contact core-paas :D

2. `root`: Root access is supported at both the container and pod level. The
   primary key for this is `runAsUser: <uid>`, as in:

    ```
    apiVersion: v1
    kind: Pod
    spec:
      securityContext:
        runAsUser: 0
    ```

    If you provide `runAsUser`, you will also run as that user's default group, or
    you can provide `runAsGroup` to set this, too. *NOTE*: if you are creating
    files in a persistent volume (as in, a volume that lives longer than the life
    of the Pod). You should read about `fsGroup` in the next section.

3. `nfs`: in general, this is authorized automatically just by virtue of
   declaring that you want to via the `volume` key in a pod. You do _not_ need
   this permission if you are using a `PersistentVolumeClaim` (which you should
   be using instead).  However, if you are creating a persistent volume, you
   should probably also set `fsGroup: <gid>`. `fsGroup` is supported *only at
   the pod level* and it controls the user that owns the _mount itself_, not
   just the newly-created files in the mount.

4. `mutablefs`: if you do not specifically request it, you will be unable to
   write files inside your container. The key for this is
   `readOnlyRootFilesystem: false` and is *only supported at the
   container-level*

5. Kubernetes API access: Intentionally not documented. Please contact core-paas
   :D

# Errors / FAQ

Here are some common error messages you might see, and what they mean:

## Docker image implicitly uses root without the Pod asking for it
```
0s    Warning   Failed   Pod   Error: container has runAsNonRoot and image will run as root
```
The docker container you are using is configured to run as root. In this case,
you have three options:

  1. Modify the docker image to not require root. This is by far the best
     option. Running as root is strongly discouraged due to the attack surface
     it exposes. In the near future we will require filed exceptions for
     services that run as root.

  2. If the docker image must run as root, you can request permission for that;
     see "Which securityContext keys do I need for each feature", above.

  3. If the image is configured as root but doesn't actually need it, you can
     tell Kubernetes to override the docker container and run as a
     different UID. This is the same mechanism as the item above, just use a
     UID other than 0.

##  Docker image uses a named user that Kube can't verify
```
0s    Warning   Failed   Pod   Error: container has runAsNonRoot and image has non-numeric user (app), cannot verify user is non-root
```

This one's tricky. When you write `USER app` in a Dockerfile, you tell docker to
default to starting the container as that user; however, if the `root` user in
the image has been renamed to `app`, docker will actually start the container as
root. Kubernetes knows about docker's behavior here, and as a result,
Kubernetes does not trust named users.

The fix is the same as the previous item, provide a `runAsUser: <uid>`. If you
don't know what `uid` to use, you can ask the image with the `id` command:
```
docker run -it artifacts.msap.io/mulesoft/core-paas-base-image-openjdk-8:v2.0.39 id
uid=2020(app) gid=2020(app) groups=2020(app)
```

This shows that you should use `runAsUser: 2020`. *Note*: the core-paas base
images generally default to `USER 2020`, but older versions of the base images
defaulted to `USER app` and so may trigger this error. (`2020` is the UID/GID we
use for our default user, and we promise not to change that).

## The above item is just a theoretical concern

The user/group names in unix are purely cosmetic; if you are uid 0 you are
root. This is why kube does not trust docker, and why you shouldn't either:

```
cat Dockerfile
FROM alpine:latest
RUN sed -i -e 's/root/app/g' /etc/passwd /etc/group
USER app

docker build -t tmp .
Sending build context to Docker daemon  2.048kB
Step 1/3 : FROM alpine:latest
 ---> caf27325b298
Step 2/3 : RUN sed -i -e 's/root/app/g' /etc/passwd /etc/group
 ---> Using cache
 ---> 039552abc016
Step 3/3 : USER app
 ---> Using cache
 ---> 64000efc6555
Successfully built 64000efc6555
Successfully tagged tmp:latest

docker run tmp id
uid=0(app) gid=0(app) groups=0(app),1(bin),2(daemon),3(sys),4(adm),6(disk),10(wheel),11(floppy),20(dialout),26(tape),27(video)
```

## Container crashes on startup with `Read-only file system`

In these cases, generally, Kubernetes will start the container but then the
container will crash on startup.  If you examine the container logs in these
cases (`kubectl -n <namespace> logs <podname>`) you may see some message
mentioning a read-only filesystem. You have two options here: if the service
is writing files unexpectedly (log files, or something similar) you'll probably
want to disable that; that can cause your container to become unstable in the
long term. However, if writing files is normal behavior (cache files, etc).
You'll need to request `mutablefs`, above.

## Access denied when accessing the Kube API

Something like:
```
Error from server (Forbidden): pods is forbidden: User "system:serviceaccount:core-paas:default" cannot list resource "pods" in API group "" in the namespace "core-paas"
```

This means you made an API call to the Kube API without the permissions to do
so. Please contact core-paas.
