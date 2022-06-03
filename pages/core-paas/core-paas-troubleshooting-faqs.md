# PagerDuty

## requests_too_low

### alerts: `pod_mem_requests_too_low` `pod_cpu_requests_too_low`

### Why?

This means the application was bursting for more than 5 minutes.
This means that the application is using more cpu|memory then it has requested for at-least 5 minutes.

### Fix

1. If the alert is for `istio-proxy` (`container:istio-proxy` is at the end of the `Target`), increase the `cpu` or `memory` request [using these annotations](https://github.com/mulesoft/core-paas-base#baseistioannotationsresources). If the application does not have the helper templates, it will need to be added.

1. Ensure that the application performance has not regressed.

1. Increase [application cpu request](https://github.com/mulesoft/core-paas-base#baseresourceslimits)

## Hit Quota

### alerts: `hit_memory_limit_quota`, `hit_memory_request_quota`, `hit_cpu_request_quota`, `hit_cpu_limit_quota`

### Why?

This alert means that we have exceeded the `cpu` or `memory` resource quota for that namespace.
The amount of `memory` or `cpu` for `request` or `limit` is larger then what was defined for the namespace in [kilonova-envs-config](https://github.com/mulesoft/kilonova-envs-config#adjusting-quotas).

### Fix

1. Adjust quota using [this method](https://github.com/mulesoft/kilonova-envs-config#adjusting-quotas).
2. Run a `deploy_only` [core-paas-namespaces](https://jenkins.build.msap.io/job/core-paas/job/components/job/core-paas-namespaces/job/master/) job

## Untrusted Network Traffic

### alerts: `untrusted_network_traffic_detected`

### Why?

This application made a network call to a service URL that is not tracked.

Core PaaS [declarative traffic management plan](https://github.com/mulesoft/core-paas-rfc/blob/master/declarative-dependencies.md) requires all network dependencies to be declared via [Istio ServiceEntries](https://istio.io/latest/docs/reference/config/networking/service-entry).


### Fix

To fix this alert, you need to determine if this is an internal service or external service call.

1) For Internal service calls (calls to services deployed in core-paas), you need to update your `sidecarConfig`. Here is an [example](https://github.com/mulesoft/kilonova-envs-config/blob/master/kdev/core-paas/core-paas-istio-config/namespace-amc.yaml#L4)

**OR**

2) For external service calls (services deployed outside core-paas), please follow the [instructions here](https://github.com/mulesoft/core-paas-istio-config#adding-service-entries).


# Kubectl

## Unable to connect to the server: EOF

If you see this error when trying to use kubectl commands

```bash
$ kubectl -n ${PRODUCT} get pods
Unable to connect to the server: EOF
```

You are probably not logged into the right cluster (Might be `stable1` instead of `stable`).
When you do `tele login` make sure to add the correct cluster there.
If you do not know the cluster ask #core-paas in slack.

## Determining container exit status

Within the yaml definition of a pod it contains the last failed status. This includes the exit codes which makes it possible to retrieve with kubectl:

```bash
$ kubectl -n ${PRODUCT} get pod ${POD_NAME} -o go-template='{{range .status.containerStatuses}}{{printf "%s: %s %d\n" .image .lastState.terminated.reason .lastState.terminated.exitCode}}{{end}}'
artifacts.msap.io/mulesoft/core-paas-istio-proxyv2:v0.4.67: Completed 0
artifacts.msap.io/mulesoft/core-paas-newrelic-kube-events:v0.3.206: Error 2
artifacts.msap.io/mulesoft/core-paas-newrelic-kube-events-forwarder:v0.3.206: Completed 0
```

## Determining pods behind a Service resource

To find out what selector a `Service` resource is selecting on first get your
service:

```bash
$ kubectl -n ${PRODUCT} get service {SERVICE_NAME} -o go-template='{{ .spec.selector }}{{"\n"}}'
map[app:my-cool-service]
```

Then get all pods with the above label(s) in the namespace:

```bash
$ kubectl -n {PRODUCT} get pods -l app=my-cool-service
NAME                                                            READY   STATUS      RESTARTS   AGE
my-cool-service-7c45d97fd8-45q5z                                2/2     Running     0          7d13h
my-cool-service-cron-1609718400-hztfx                           0/2     Completed   0          2d14h
my-cool-service-automation-1609761600-rzqw2                     0/2     Completed   0          2d2h
```

# Build Errors

## timed out waiting for the condition

```
failed to deploy at least one service: unable to deploy <application>: failed to apply plan: upsert failed (but rollback successfully started): timed out waiting for the condition
```

This happens if application did not become ready within our 1 hour timeout. Steps to debug:
1. Look at application logs to see why pods did not become ready. `ready` means the application failed to pass it readiness check. Logs can be seen in [sumologic](../logging/sumologic.md) or you can rebuild and follow along live.
1. If you have a deployment: `kubectl -n <namespace> describe deploy <application_name>` and look at the event log for any errors.
1. If you have a service: `kubectl -n <namespace> describe svc <application_name>` and look at the event log for any errors.

## fatal error: An error occurred (404) when calling the HeadObject operation: Key "stable/<YOUR_PRODUCT_NAME>/index.yaml" does not exist

Slack !ask in #core-paas "!ask can someone create index.yaml for <YOUR_PRODUCT_NAME>?".

# Deploy Issues

## Replay requires an approval for all envs.

Use **`Rebuild`** not `Replay`.

`Replay` is not supported in valkyr because anyone can change the deploy code when doing a `Replay`.
**`Rebuild`** is the correct way to run a build again.

example Jenkins log:

```
cannot skip authorization check: valkyr build was a replay.
...
WARNING: valkyr mode was requested but the caller was untrusted; falling back to normal approval mode
```

You will still be prompted to approve the deploy, but you may not have permission to do so. Example error:

```
You need to be kstg to submit this.
```

## Exceeded quota

The deployment has hit the namespace quota. See [this to increase limit](#hit-quota)

example error log:

```
kube event what=FailedCreate obj=ReplicaSet/<namespace>/<podname> message="Error creating: pods \"rest-connect-service-cbd8c94dd-wz2p5\" is forbidden: exceeded quota: compute-resources, requested: requests.memory=4Gi, used: requests.memory=57460Mi, limited: requests.memory=60Gi
limits.memory, limits.memory, requests.cpu, requests.cpu, limits.cpu, limits.cpu
```

## `"my-chart-name" has no deployed releases`

This error is related to how helm does upgrades; when you submit a new chart,
it generates a diff between the last working release and the new release, and then
applies that diff to the live cluster. A "working" release in this context is
one which has status DEPLOYED; releases with status FAILED are skipped.

This error message means _every_ release of `my-chart-name` is marked FAILED,
meaning, there is no working release to generate a diff from.

The solution, generally, is to purge all records of the release and try again:

```
helm delete --purge <my-chart-name>
```

**This will delete all resources associated with the chart, including any load
balancers.** Fortunately, since this problem only happens when every release of
a chart has failed, purging is usually safe (since the service is already
broken).

This error is one of the few errors for which a `--purge` is the correct answer;
in all other cases, a `--purge` is the wrong thing to do.

## `multiple releases in DEPLOYED state ([3 2]); please identify which one is correct and helm rollback to that version.`

Helm has a race condition which can leave multiple versions of one chart in a
`DEPLOYED` state; this can cause a lot of problems, so cpc will notice this
condition and fail. This is what this looks like:

```
$ helm history my-cool-service
REVISION        UPDATED                         STATUS          CHART                   DESCRIPTION
1               Thu May 23 10:09:59 2019        SUPERSEDED      my-cool-service-1.2.0   Install complete
2               Wed May 29 08:16:12 2019        DEPLOYED        my-cool-service-1.2.1   Upgrade complete
3               Wed May 29 13:44:32 2019        DEPLOYED        my-cool-service-1.2.2   Upgrade complete
```

This state must be repaired by hand.

### using helm and kubectl to identify which revision of a chart is actually live

1. Verify that you have a recent enough `kubectl` version (this requires a
   relatively recent version). If the version you're using is greater than or
   equal to the cluster version, that's probably fine.

   ```shell
   $ kubectl version --short
   Client Version: v1.17.3
   Server Version: v1.17.2
   ```

2. Run `helm history my-cool-service` to see the list of revisions for your
   service. (The results should look similar to the above)

3. The error message in the title indicates that revision 3 and 2 are both in
   `DEPLOYED` state; this matches what you see in the sample `helm history`
   above. In the example given, `my-cool-service` is the chart name, and
   `my-cool` is the namespace for the service.

4. Identify which of these `DEPLOYED` revisions matches the cluster's live state

   ```shell
   $ helm get manifest my-cool-service --revision 2 | kubectl diff -n my-cool -f -
   diff -u -N /tmp/LIVE-354425780/apps.v1.DaemonSet.core-paas.docker-gc /tmp/MERGED-381081987/apps.v1.DaemonSet.core-paas.docker-gc
   --- /tmp/LIVE-354425780/apps.v1.DaemonSet.core-paas.docker-gc   2020-03-12 09:25:19.738476508 -0700
   +++ /tmp/MERGED-381081987/apps.v1.DaemonSet.core-paas.docker-gc 2020-03-12 09:25:19.866473283 -0700
   @@ -58,7 +58,7 @@
            - name: GRACE_PERIOD_SECONDS
              value: "3600"
            - name: DOCKER_API_VERSION
   -        image: artifacts.msap.io/mulesoft/my-cool-service:v0.5.66
   +        image: artifacts.msap.io/mulesoft/my-cool-service:v0.5.65
            imagePullPolicy: Always
            name: my-cool-service
            resources:
   $ helm get manifest core-paas-docker-gc --revision 3 | kubectl diff -n my-cool -f -
   $
   ```

   This example shows that revision 2 was different than the cluster state (the
   diff was non-empty) whereas the diff for revision 3 was empty. This shows
   that revision 3 matches the live state.

5. If none of the revisions show a clean diff, !ask for help in #core-paas;
   more steps may be required.

6. Now that we've identified the correct revision, simply roll back to it:
   `helm rollback my-cool-service 3`. Since this state matches the live
   cluster, this should not change anything about the running version of the
   service, it will only correct the helm state.

And that's it!

## `PENDING_DEPLOY` status / `release is busy, waiting ... status=PENDING_UPGRADE`

Sometimes a failed deploy can cause the helm release to stick in the
`PENDING_UPGRADE` state (instead of going to `FAILED`). If you see this condition:

1. Verify that no other deploy is running; normally this state means "something
   else is upgrading this chart already" and is not a cause for concern; if an
   upgrade really is happening and you interrupt it, it can cause weird
   behavior.

2. Identify which revision matches the live state. This process is documented in
   [`using helm and kubectl to identify which revision of a chart is actually live`](#using-helm-and-kubectl-to-identify-which-revision-of-a-chart-is-actually-live).

3. Roll back to the identify revision with `helm rollback my-cool-service <revision>`; this will override the `PENDING` record and create a new, clean
   revision.

## Issues with helm state and cluster state desync

Also: "I'm creating a new object and the deploy is complaining that the object
doesn't exist. Yes! I know! I'm creating it!"

If you don't really care what's happening, skip down to "TL;DR"

First, it is important to remember: Helm is not terraform. `terraform apply`
performs a [3-way
merge](https://en.wikipedia.org/wiki/Merge_%28revision_control%29#Three-way_merge)
between the previous code, the current code, and the live state. Helm instead,
does a simple 2-way diff between the previous (successful) code and the current
code; this diff is then applied to the cluster. This methodology is somewhat
more error-prone.

In addition, it is important to note that only successful deploys are
considered for diff bases; failed deployments are skipped for diff generation.
This has important consequences for the test case that follows!

With that said; I'll illustrate with an (anonymized) example from a cpc deploy:

```
==== Service[my-cool-service] ===================================
======== Diff[my-cool-service] ==================================
my-cool, service-secret, Secret (v1) has been added:
+ Changes suppressed on sensitive content of type Secret
======== Diff Done[my-cool-service] =============================
==== Service Done[my-cool-service] ==============================
cpc: error: failed to deploy all services: unable to deploy my-cool-service:
failed to apply plan: upsert failed: no Secret with the name
"my-cool-service-secret" found
```

Note that the diff shows an added secret, but the error message indicates "no
Secret found." What's happening here? Generally, this problem is caused by a
desync between the helm state and the cluster state itself; this is almost
always caused by a failed deploy. Here is more context:

```
$ kubectl -n my-cool get secrets service-secret
NAME             TYPE     DATA   AGE
service-secret   Opaque   2      6h36m

$ helm history my-cool-service
REVISION        UPDATED                         STATUS          CHART                             DESCRIPTION
1               Thu May 23 10:09:59 2019        SUPERSEDED      my-cool-service-1.2.0             Install complete
2               Wed May 29 07:20:11 2019        FAILED          my-cool-service-1.2.1-add-secret  Upgrade "my-cool-service" failed: timed out waiting...
3               Wed May 29 08:16:12 2019        DEPLOYED        my-cool-service-1.2.1             Upgrade complete
4               Wed May 29 13:44:32 2019        FAILED          my-cool-service-1.2.2-add-secret  Upgrade "my-cool-service" failed: no Secret with the name...

$ helm get manifest my-cool-service --revision 2 | grep 'name.*secret'
  name: service-secret
$ helm get manifest my-cool-service --revision 3 | grep 'name.*secret'
$ helm get manifest my-cool-service --revision 4 | grep 'name.*secret'
  name: service-secret
```

The order of operations that produced the above situation is:

| Rev | Deploy           | Chart Secret | Diff Adds Secret |       Result        | Cluster Secret |
| :-: | :--------------- | :----------: | :--------------: | :-----------------: | :------------: |
|  1  | 1.2.0            |      No      | No (Rev0->Rev1)  | SUCCESS (Active: 1) |       No       |
|  2  | 1.2.1-add-secret |     Yes      | Yes (Rev1->Rev2) | FAILURE (Active: 1) |      Yes       |
|  3  | 1.2.1            |      No      | No (Rev1->Rev3)  | SUCCESS (Active: 3) |      Yes       |
|  4  | 1.2.2-add-secret |     Yes      | Yes (Rev3->Rev4) | FAILURE (Active: 3) | Yes / Already  |

What we see here is Rev 2 added the secret but the deploy failed; as a result,
the secret was created on the cluster, but the active helm revision was still
Rev 1. Rev 3 was deployed, but since it diffed against Rev 1 (which did not
have the secret) the secret was not deleted; instead, it was orphaned, and Rev
3 became active. Finally, Rev 4 was deployed, which tried to create the secret,
but found that the secret already there (in the live cluster state, but not in
the active helm state). This produces the awkward error message `no Secret with the name "my-cool-service-secret" found` which actually means that helm found
the secret in the Cluster State but not in the Active Helm State.

Yes, this error message is terrible. Most of helm's error messages are
terrible, and since CPC wraps helm, it's also exposed to them :/

### TL;DR

When you see a failed deploy, generally, the correct action is to:

1. Identify why the deploy failed.
2. Roll back (with `helm rollback <chart> <revision>`) or deploy a new version,
   depending on what happened in 1.

We do not roll back automatically in order to allow you the chance to debug the
problem, and to identify whether rollback or new deploy is the correct next
action (the deploy cannot identify this without help). For a well-configured
service, the user-visible experience would still be working (running the old
version) so a rollback is not an emergency.

## helm chart lint / kube validation error

Two new checks have been turned on in the deploy job; these checks output log
messages during deploy at the `EROR` log level (and show up in red). These
errors represent conditions that will become fatal in a future helm upgrade,
and need to be fixed before then.

Some examples, and how to fix them (this is not an exhaustive list):

- `[ERROR] Chart.yaml: apiVersion is required`:
  helm promoted the formerly-optional `apiVersion` field to required in
  `Chart.yaml`. The fix is to add `apiVersion: v1` to your `Chart.yaml`. More
  information is [in the helm docs](https://helm.sh/docs/topics/charts/#the-chart-yaml-file).
  Note: we do not support helm v3 yet; `apiVersion: v2` requires helm v3.

- `ValidationError(...): unknown field`:
  Previously, helm did not validate kube manifests against the openapi spec-
  unknown keys would be silently dropped. New versions will throw fatal errors on
  unknown keys. The easiest way to search the openapi spec to try to identify
  your error is to log into a kube cluster and use
  [kubectl explain](https://blog.heptio.com/kubectl-explain-heptioprotip-ee883992a243).
  The two most common causes of an `unknown field` error are:
  - indentation error in the yaml (putting one or more keys under the wrong parent)
  - misspelled key

## `executing "base.lifecycle.hooks" at <(.Values.lifecycle) and (.Values.lifecycle.hooks)>: can't give argument to non-function .Values.lifecycle`

Go 1.14 made a breaking change in template parsing; this change broke all
versions of the core-paas-base chart <4.9.7; we fixed this bug a while ago, but
not every chart has been updated. To fix this issue:

1. Make sure the `requirements.yaml` for your chart matches 4.9.7; currently,
   we recommend you set it to `4.x.x`
2. Rebuild your chart; it will automatically pick up the newest matching
   version.
3. That's it! Not too bad, right?

## `what=FailedGetResourceMetric obj=HorizontalPodAutoscaler`

On the initial release of a service to an environment the following messages will be
displayed as the metrics-server has not yet been able to capture any metrics
from a running pod:

```
EROR[05-06|17:26:04] kube event what=FailedGetResourceMetric obj=HorizontalPodAutoscaler/access-management/anypoint-admin-console message="did not receive metrics for any ready pods"
or
EROR[05-06|17:27:11] kube event what=FailedGetResourceMetric obj=HorizontalPodAutoscaler/access-management/anypoint-admin-console message="unable to get metrics for resource [memory|cpu]: no metrics returned from resource metrics API"
```

If these error messages are displayed in subsequent deploys please check your
replica configuration as there maybe no ready pods during your application
deployment.

## Back-off restarting failed container

```
EROR[08-10|16:44:31] kube event what=BackOff obj=Pod/core-paas/navi-7949fc9fc9-5m8lp message="Back-off restarting failed container
```

This error means the application exited. Kubernetes will try to start the application again with back-off.
To fix this, look at the logs of your application to figure out why it is exiting.
Also ensure the pod was not [OOM Killed](#OOM-Killed).

## Failed Quota

```
18:22:33  EROR[08-08|01:22:32] kube event                               what=FailedCreate obj=Job/core-paas/navi-1596848400 message="Error creating: pods \"navi-1596848400-rw7tn\" is forbidden: failed quota: compute-resources: must specify limits.cpu,limits.memory,requests.cpu,requests.memory"
```

Ensure `resources` are defined in your deployment. [Core PaaS base docs resources](https://github.com/mulesoft/core-paas-base#baseresourceslimits).

## Namespace is not created

Ensure the product namespace is properly defined in [kilonova-envs-config](`https://github.com/mulesoft/kilonova-envs-config) by creating a file `<env>/core-paas/core-paas-namespaces/namespace-<product>.yaml` for each `<env>`. See how to define the namespace in the following example file:

E.g. For the product `api-designer` in the environment `kdev`, the definition file should be like
https://github.com/mulesoft/kilonova-envs-config/blob/master/kdev/core-paas/core-paas-namespaces/namespace-api-designer.yaml

After creating the file, manually trigger the [core-paas-namespaces build in jenkins](https://jenkins.build.msap.io/job/core-paas/job/components/job/core-paas-namespaces/job/master/build?delay=0sec).

**IMPORTANT**: Please ensure to uncheck the `SHOULD_BUILD` option


# Runtime Errors

## OOM Killed

```yaml
lastState:
  terminated:
    containerID: docker://65183c1877aaec2e8427bc95609cc52677a454b56fcb24340dbd22917c23b10f
    exitCode: 137
    finishedAt: 2017-06-20T20:52:19Z
    reason: OOMKilled
    startedAt: null
```

If you see this in the `kubectl -n <namespace> get pod <pod> -o yaml` output it means the application was killed because it requested more memory than its limit.
Steps to fix:

- Ensure your application is not leaking memory.
- Ensure your application is not buffering large files or requests into memory.
- Ensure your resource memory limit is set correctly.

## ErrImagePull

```
17:38:40  EROR[08-08|00:38:40] kube event                               what=Failed obj=Pod/core-paas/navi-54869cfc74-fxvn9 message="Failed to pull image \"artifacts.msap.io/mulesoft/navi:v0.1.0-12.core-pass\": rpc error: code = Unknown desc = Error response from daemon: pull access denied for artifacts.msap.io/mulesoft/navi, repository does not exist or may require 'docker login'"
```

- In cloud envs:

  - Ensure your service is defined in [core-paas-namespaces](https://github.com/mulesoft/kilonova-envs-config/blob/master/kdev/core-paas/core-paas-namespaces/values.yaml) and ask #core-paas to run the job.
  - Ensure `imagePullSecrets` is defined in your charts. [Core PaaS base docs for secrets name](https://github.com/mulesoft/core-paas-base#baseimagepull-secret-name).

- In kind:

  - When developing a Helm chart:

    - Ensure pull policy is `IfNotPresent`
    - Ensure image name and tag match exactly in docker and pod

      ```shell
      kubectl config use-context $(kubectl config get-clusters | grep kind | head -n 1)
      docker exec -it $(kubectl get nodes -o custom-columns=NAME:.metadata.name | tail -n 1) crictl images | grep $PRODUCT/$COMPONENT
      # output name from above should match output name below
      kubectl get pod -o jsonpath='{.spec.containers[*].image}{"\n"}' <POD_NAME>
      ```

  - When importing a private Helm chart developed by others:
    - Ensure that you have [loaded the appropriate pull secret](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/#create-a-secret-by-providing-credentials-on-the-command-line) (eg, your Harbor credentials) into your kind cluster.

## Environment variables do not change

If you just change environment variables without changing anything in the
deployment, you will have to manually delete the running pod to update the
configuration. Helm does not do this for you.
You can also [create a hash of the configmap and secret](https://helm.sh/docs/howto/charts_tips_and_tricks/#automatically-roll-deployments) to ensure pods in a deployment are rolled during a config or secret change.

# Request

## Secrets

[SRE](https://mulesoft.slack.com/archives/CGEN054QP) can encrypt secrets.

Note: The following do **NOT** need to be secrets

- Any account IDs (AWS, New relic, Sumologic, ...etc)
- Any client IDs (authentication, Core Services, GitHub, ...etc)
- Certificates (beside private key)
- Usernames
- Database URLS

Here is the process to send us your secrets.

1. Download and create a [keybase account](https://keybase.io/download)
2. [Link](#link-github-profiles-to-your-keybase) your GitHub profile (which is associated with the MuleSoft GitHub orgs) to your keybase account.
   This helps us verify your identity as a MuleSoft org member.
3. Message in the #core-paas slack channel: `!ask I need to encrypt some secrets.`
4. Someone will respond with their keybase username.
5. Send the following to that username on keybase:
   - Ensure you send this as an exploding message. If you send the secret without this, the secret must be rotated.
   - List of data structures that should be created, and the files they should be put in, for e.g.
     ```
     # kstg/mule-templates/mule-templates-meow-bark/secrets.yaml
     key: value
     otherkey:
         meow: bark
     # kprod-eu/mule-templates/mule-templates-meow-bark/secrets.yaml
     key: value
     otherkey:
         meow: bark
     ===
     ```
   - If you have a pr / branch that already exists, please let us know of that and we'll push to that branch.
6. The SRE team member will encrypt your secrets and push to your requested branch.
7. Create a PR from that branch and get an SRE team member to approve it(If you have this ready from the start, the same SRE team member can approve it).
8. Once approved, you can merge the PR.

## Link GitHub profiles to your Keybase

Linking your GitHub profile is a way to demonstrate proof of identity to your Keybase profile. Please execute the following
steps to add the GitHub proof to your Keybase account:

1. Go to your Keybase profile  page.
2. Click on the GitHub proof label button/icon.
3. Copy the generated proof.
4. Go to GitHub [Gists](https://gist.github.com).
5. Sign into GitHub Gists with your GitHub profile.
6. Click on make a new gist (Ensure that your Gist is public and not secret).
7. Name your new gist `keybase.md`.
8. Paste in the proof that was generated by Keybase.
9. Publish the gist.
13 Once published, you may refresh your Keybase profile.

## Muleteer PR check harbor/integration has failed

Sometimes clair scan would fail and muleteer would block your PR.
Here are some steps you can do unblock.

1. Click on muleteer link to find a failed version
2. Open a second tap and log into [Harbor](https://artifacts.msap.io/harbor/sign-in?redirect_url=%2Fharbor%2Fprojects)

<a href="PR Error"><img src="../images/clair_errors/pr-error.png" align="left" height="576" width="1024" ></a>

<a href="Muleteer error"><img src="../images/clair_errors/muleteer.png" align="left" height="576" width="1024" ></a>

3. Find you repository and use version from muleteer.
4. Click on tag and then click on scan
5. Get back to PR error and click on `here`
Hooray! your PR should be unblocked.
