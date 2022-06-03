# Core PaaS Badges

This document outlines the contract that Core PaaS provides teams and the rules that they need to follow run successfully.

All teams that are running applications on Core PaaS need to read and understand this entire document.

<!-- ## Applications deploymentStrategy must be continuous-delivery or continuous-deployment. -->

## Delivery Badge

### How to obtain

The application has set `deploymentStrategy` in `valkyr.yaml` to `continuous-delivery` or `continuous-deployment`.
The application's master branch should always be deployed to kstg, kprod-eu, kprod 3 days.

### Benefits

Teams know what code is deployed to production without looking it up.
Consistency for customers.

### Risks

When CD was not a requirement there were many incidents due to versions not getting deployed to production.
There was also incidents from when we needed the application to be redeployed, but no one knew the correct version to deploy.
Manual deploy needed because master branch was broken.
staging is a not reflection of production.
mean time to recovery (MTTR) is increased.

### Tips

Revert changes in master that break a pre-production environment if they cant be fixed right away.
Write helm test that test the core functionality of the application.
Ensure all migrations are backwards compatible.
Don't forget to click approve if you are in `continuous-delivery`.

<!-- ## Application pod SLA is 2 minutes -->

## Robust Badge

### How to obtain

A fraction of replicas of the application can be killed without breaking the entire application.

### Benefits

Applications will have less downtime when there are server failures or rotations.

### Risks

Cloud servers can unexpectedly die and kill the applications that were running on the node.
If an application does not plan for this it will have downtime.

### Tips

State that needs to be saved should be writing to a database and not the local file system.
All network calls should have be wrapped with retry with exponential backoff logic.

<!-- ## Applications should not rely on cross-cluster connectivity. -->

## Scaling Badge

### How to obtain

Applications should have at least 6 replicas and [Horizontal Pod Autoscaler (HPA)](https://github.com/mulesoft/core-paas-base#baseautoscalerhorizontal) configured correctly.

### Benefits

Applications will have less downtime when there are many replicas.
Applications can scale to meet demand without manual actions from the team.

### Risks

If there are not enough replicas a single node outage can cause downtime.
Application response times can drop or the applications can get overloaded if HPA is not configured correctly.

### Configuring Horizontal Pod Autoscaling [HPA](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) and resources

A good process to figure out how to set resource and HPA correctly:

1. Run a load test with the same amount of traffic you expect to have in production. This can be HTTP request when dealing with a server or database size when dealing with a data migration job.
2. Adjust the resource limits and requests and HPA targets based on that test.
3. Repeat steps 1 & 2 until you are happy with the applications latency and throughput.

An ideal HPA configuration should react in the following ways:

-   The HPA target should be configured to add more replicas when any pod of the application is using more resources then is had requested. Once the new replicas are active resource usage of each replica should drop below the requested amount. This should happen within 5 minutes to avoid getting paged.

-   HPA target should be set between 50 and 80 % usage

-   The HPA will remove replicas when the average usage of the application is **less than** the HPA target.

-   The HPA will add replicas when the average usage of the application is **more than** the HPA target.

-   Each replica of the application should be using around the HPA target on average.

### HPA with sidecars

HPA uses the sum of all used CPU requests for a pod when determining CPU metrics to scale. If a target utilization value is set, the controller calculates that value as a percentage of the total resource request on the containers in each Pod.

### How sidecars affect HPA

By adding an istio-proxy sidecar to a pod, it changes the total amount of CPU & memory requests, thereby shifting the scale-out point.

If HPA is configured to scale at 70%, and your application requests 100m, you are scaling at **70m**. If istio-proxy also requested 100m, now your scale out point is **140m** `((100m + 100m) * 70% )`, which you may never reach.

## ![Istio HPA](../images/istio-hpa.png)

Given a **500m** main app container that scales at **80%**, here's how the scale-out point shifts when a 200m sidecar is introduced to the pod:

![Istio HPA 500](../images/istio-hpa-500.png)

From the above diagram, the total utilization shifts down to **71%** CPU for the whole Pod:

-   If `targetCPUUtilizationPercentage` is shifted down to **70%**, the service will keep the same scaling behavior, as the main app container uses 80% individually, at **400m**.

-   If `targetCPUUtilizationPercentage` stays the same at **80%**, the service will scale when the Pod uses **560m** CPU, which could require the main app container to use 92% individually, at **460m**.

The purpose of the `istio-proxy` sidecar is to intercept and handle requests, and its performance requirements scale with amount of traffic passing through. `Throughput` is the number of successful requests in a given period of time, which should be measured in `requests/second` (`rps`)

According to official Istio documentation, **the Envoy proxy uses 0.5 vCPU and 50 MB memory per 1000 rps going through the proxy.**

### How teams should update their HPAs

Load tests are recommended to figure out how many resources are requested by istio-proxy before the scale-out point, and then adjust its resource quota accordingly.

#### Throughput considerations

The default resource quota for the istio-proxy is

```
Limits:
    cpu:     200m
    memory:  256Mi
Requests:
    cpu:      50m
    memory:   128Mi
```

which handles throughputs up to ~`1000` rps, while maintaining a relatively small footprint compared to overall pod resources.

Using the default resource quota for the sidecar sets the sidecar requests at `50m` (0.05 vCPU) and therefore has a small impact on CPU-based HPA. Teams satisfied with throughput requirements below `1000` rps **should not** have to update their HPAs.

##### High-Traffic Deployments

The base templates provide a way for Services to adjust their sidecar resources for throughputs higher than `1000` rps **per pod**. (The thumb rule is 0.5 vCPU per 1000 rps).

Run more load tests to understand the impact on HPA with larger istio-proxies, as their larger footprint will cause a bigger shift in scaling.

#### Tips

For virtual machine based languages, like Java, set the memory request equal to the memory limit because the VM does not release memory back to the OS.
Minimum CPU requested should be 100m
Minimum Memory requested should be 50Mib
Have a minimum of 6 replicas in prod to spread pods across all AWS availability zones. Scale down requests and limits accordingly. If you are using 3 instances with 200m cpu, use 6 instances with 100m cpu instead.
Use the [base.autoscaler.horizontal](https://github.com/mulesoft/core-paas-base#baseautoscalerhorizontal) template.

## Isolation Badge

### How to obtain

The application should be able to run in many separate clusters at the same time.
The application should not need to talk to replicas of itself between these clusters in order to work.

### Benefits

Cluster updates can be performed without downtime.
New clusters can be spun up and tested in isolation.
Teams will be able to create their own ephemeral clusters.

### Risks

If a new cluster can't be spun up in isolation, then we can not gracefully recover from a cluster failure. The new cluster's applications will still talk to the broken cluster's applications.
Cluster upgrade operations would require downtime if applications can not run in both clusters at the same time.
We don't guarantee communication between clusters in the same region.

### Tips

If any state is shared between pods consider using a database.
If applications consume from a queue, reject the message and put it back on the queue with exponential back-off if it can't be processed.

<!-- ## Applications should not rely on multi-region connectivity. -->

## Regional Badge

### How to obtain

Application does not make calls across regions.

### Benefits

Reduces security boundary to a single region.
Lower AWS network costs.

### Risks

Cross-region traffic can be slow and unreliable.

### Tips

The application should either run in the region it is needed or create a public endpoint secured by mTLS.

<!-- ## Applications helm charts should be constructed from core-paas-base -->

## Base Badge

### How to obtain

Application helm charts are based off [core-paas-base](https://github.com/mulesoft/core-paas-base) templates.

### Benefits

No changes needed for improved or required chart changes.
Examples:

-   The service template configures ELB logging by default.
-   The label template injects the needed labels for logging.
-   The monitoring template injects the required environment variables for New Relic APM.

### Risks

Teams will have to keep up with latest helm changes or they might be have a out-dated helm chart configuration which causes downtime.
Non-Core PaaS base templates are not supported by Core PaaS but the teams that created them.

### Tips

Use [core-paas-base](https://github.com/mulesoft/core-paas-base) templates as much as possible.

<!-- ## Teams should have access to and understand Core PaaS tooling. -->

## Tooling Badge

### How to obtain

All the team members can access to the Docker Registry, Core PaaS Clusters, New Relic, and SumoLogic.
All the team members should have installed the required [Tools](https://github.com/mulesoft/core-paas-getting-started/blob/master/scripts/provision.sh)

### Benefits

Teams will be able to recover from incidents faster.

### Risks

Mean Time to recovery will take longer if team members need to get access or the tools required to debug their application.

### Tips

Before an application enters production, check all team members supporting the application can login to the clusters and view logs.

<!-- ## Teams must read the Core PaaS newsletter. -->

## Communication Badge

### How to obtain

Read the Core PaaS newsletter every month.

### Benefits

Keep track of changes, deprecations, and announcements.

### Risks

Important changes could be missed.

### Tips

Watch the Core PaaS livestreams if reading is not your thing.

<!-- ## Application Alerts -->

## Monitoring Badge

### How to obtain

The application should have alerts for its core functionality.

### Benefits

The team will get notified when the application starts to have issues before customers do.

### Risks

Customers see issues before the team is aware.
If there is no functional monitoring, then there is no way to tell if the application is actually working.
The application process could be running but the its functionality could be broken.

### Tips

Use New Relic APM to send key application metrics and setup alerts based on that.
Use Sumologic to alert on specific log lines.

<!-- ## Helm test -->

## Tester Badge

### How to obtain

The applications should have a helm test that runs in less than 5 minutes to ensure basic functionality is working.

### Benefits

Helm tests ensure breaking changes are rolled back as fast as possible.

### Risks

If there are no Helm test human judgment is required to ensure application deployment is working. The mean time to recovery (MTTR) is increased.

### Tips

Helm test should only test application functionality, not end to end test.
End to end test should be CronJobs.
Do not test external endpoints or other applications.
[e2e-deprecation](https://github.com/mulesoft/core-paas-rfc/blob/master/e2e-deprecation.md)

<!-- - The App should run locally locally. This is to ensure helm chart changes can be tested locally and not in dev environments. -->

## Independent Badge

### How to obtain

The application can be run on any team member's machine.

### Benefits

Helm chart changes can be tested faster locally vs waiting for build and deploy.
Helm chart changes can be rolled out with lower risk.
Teams can test their changes locally without relying on the dev environments.

### Risks

Development environments will break more frequently and causes dependent teams to lose productivity.
The application can not be debugged locally.

### Tips

Core PaaS recommends running locally in [KIND](../running-locally/run-in-kind.md).

## HTTP Hero Badge

### How to obtain

The application must be compliant with the [HTTP RFC](https://tools.ietf.org/html/rfc2616).

#### Set HTTP keep-alive timeout correctly.

Look up how to set the keep-alive timeout for your http server and ensure it is **higher than 1 minute**.
This is required because ELB keep-alive timeout is 1 minute and every service after the ELB needs to be higher.
This avoids a race condition which causes connection resets. More [info here](https://docs.google.com/document/d/1EhSirBdPsAsOOmwDRnknCgFWz9GYmHqn4xms4f5e3tU/edit#heading=h.4toevmlay2pb).

High keep-alive timeouts do not affect resources because the istio sidecar intercepts all traffic.
The sidecar will only keep a few sockets open between itself and the application.

#### Update MuleSoft libraries

Update the following libraries to the following versions to fix some known header issues.

-   [com.mulesoft.authentication](https://github.com/mulesoft/authentication-server-spring-boot-starter): >= 4.1.26 (for v4.x.x) or >= 3.1.31 (for v3.x.x)
-   [com.mulesoft.anypoint.rest](https://github.com/mulesoft/java-platform-rest-client): >= 1.2.6

#### Ensure HTTP header operations are case insensitive.

-   Look up the values of headers in a case insensitive way.
    Most libraries provide functions to get headers in a case insensitive way.
    If your library does not provide this, try lowercasing all header keys into a map and get headers using lower case as well.

-   Set headers in a case insensitive way. For example:
    Two headers with different cases should never be set on a request.
    ```
    content-type: chunked
    Content-Type: chunked
    ```

#### Avoid using `addHeaders` for single value headers

-   Use `setHeader` functions over `addHeaders` for single value headers.
    `addHeader` functions append values if the header already exists which is not compatible with some headers (like `Content-Type`).

#### Take care when forwarding requests

-   Do not forward request headers as-is when forwarding requests. For example:
    Ensure `Host` (or `authority`) header matches the endpoint being called.

### Benefits

All proxies (not just istio) will be able to proxy your request correctly.

### Risks

The application will get invalid HTTP responses or requests. For example if a request gets sent with the following headers:

```
Content-Type: chunked
Content-type: chunked
```

Some proxies (like istio) will convert that to an invalid header:

```
content-type: chunked, chunked
```

### Tips

Ensure the application uses its HTTP lib function vs setting and getting headers directly.

Example fixes:

-   Fixing duplicate headers https://github.com/mulesoft/authentication-server-spring-boot-starter/pull/201/files
-   Fixing case sensitive headers https://github.com/mulesoft/java-platform-rest-client/pull/44
