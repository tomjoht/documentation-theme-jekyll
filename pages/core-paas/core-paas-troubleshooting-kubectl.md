# Using Kubectl
kubectl is how we interact with the kubernetes clusters.

# Getting access
Follow instructions [here](../access/clusters.md) to find out how to login to the clusters

# Commands
## get
`kubectl -n <namespace> get <resource>` is the way to list k8s resources. You will mostly care about pods in your namespace.
```bash
kubectl -n core-paas get pods
NAME                                  READY     STATUS    RESTARTS   AGE
cloudhealth-7bd6f7954b-nt9ht          1/1       Running   0          16h
docker-gc-4wpxv                       1/1       Running   0          3d
external-dns-68bcc5b945-p4xqd         1/1       Running   0          7d
healthz-fb8864d67-xf2p7               1/1       Running   0          10d
kube-state-metrics-6d8f669869-pxmf7   1/1       Running   0          10d
newrelic-infra-47wff                  1/1       Running   0          1d
sumologic-75hxj                       1/1       Running   0          10d
```
That is a list of all the pods (aka containers) running for your product. To interact with them you will be using the NAME you see in that list.
If you want info on one specific pod you can do `kubectl -n <namespace> get pod <NAME of pod> -o yaml` or `kubectl -n <namespace> describe pod <NAME of pod>`


## logs
To view logs of a pod all you need is the name.

`kubectl -n <namespace> logs <NAME of pod>`.

Add `-f` flag to follow logs (just like `tail`).
Add `-n <number>` to get last `number` of lines.

## exec
Exec is used to get inside the pod. You should not need to do this unless you need to poke at files on the disk

`kubectl -n <namespace> exec -it <NAME of pod> <shell>`

`<shell>` is any shell available inside the container. This is typically `bash` or `sh`.


## port-forward
Port-forwarding is used to map a port from inside of the container to your
local machine.

You have two options, you can talk to a Service through the internal
load-balancer, or you can talk to a Pod directly. Talking to the service is
better in general, but if you're trying to debug one pod in particular, the
option is there. Note that the port may be different between the pod and the
service.

### Talk to a Service

```bash
# Get the port (the port is 8080 here)
kubectl -n <namespace> get svc <svcname>
NAME      TYPE           CLUSTER-IP    EXTERNAL-IP                          PORT(S)          AGE
<service> LoadBalancer   1.2.3.4       abc123.us-east-1.elb.amazonaws.com   8080:30513/TCP   34d

# And do the forward:
kubectl -n <namespace> port-forward svc/<service> <localport>:8080
```

### Talk to a Pod

```bash
# Get the port (port is 18080 here):
kubectl -n <namespace> describe pod <podname> | grep -i port
    Port:          18080/TCP
    Host Port:     38080/TCP

# And do the forward:
kubectl -n <namespace> port-forward <podname> <localport>:18080
```

### A Real Example

```bash
kubectl -n core-paas port-forward svc/healthz 3000:8080 &
[1] 84428
Forwarding from 127.0.0.1:3000 -> 18080
Forwarding from [::1]:3000 -> 18080

curl http://localhost:3000
Handling connection for 3000
404 page not found
```
Note: you can bind ANY port from the pod to your local machine, it does not have to be exposed.

## describe
Describe shows details of a specific resource or group of resources.

`kubectl -n <namespace> describe <KIND of resource> <NAME of resource>`

`<KIND of resource>` is the type of object you want to describe. This is typically `pod` but if you don't see your pod running you will want to try `deployment`, `job`, `daemonset`, or `cronjob`.
This command will give you an overview of the object. The most important part is the `Events` logs at the bottom. This is typically where you will see kubernetes errors relating to your pod.

### Example Events:
* `Warning Failed 48m (x4 over 49m) kubelet, Failed to pull image "mulesoft/mozart-alexander-preprocessing-service:latest": rpc error: code = Unknown desc = Error response from daemon: pull access denied for mulesoft/core-paas-healthz repository does not exist or may require 'docker login'`
  * This happens when the image does not exist in the repository, or you are not logged into the repository.


# Beyond
Quick [cheat sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/) for other commands
