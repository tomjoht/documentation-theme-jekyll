# Istio

## What is Istio?

Istio is an open source service mesh platform that is designed to provide a uniform & standardised way to manage
the traffic flow, security and observability of micro-services. To learn more, please go [here](https://istio.io/).

## What you need to know?

Istio works atop the Kubernetes platform. While Istio does not (is not intended to) change how you work with services in
core-paas today, there are certain key changes that you will need to be aware of.

#### Some changes with Istio on core-paas
##### Number of containers per pod

You can expect to see “2/2” containers for a pod as opposed to the usual “1/1” you see when running “kubectl get pods”

Before:
```bash
$ kubectl get pods -n visualizer

NAME                             READY        STATUS    RESTARTS     AGE
experience-api-966d9c7c4-87rbk    1/1         Running    0           33d
```
After:
```bash
$ kubectl get pods -n visualizer

NAME                             READY        STATUS    RESTARTS    AGE
experience-api-966d9c7c4-87rbk    2/2         Running    0          33d
```

##### kubectl logs command

Since Istio injects an additional sidecar container into the pod, we will need to specify the **"-c"** argument
when retrieving the logs of our application.

Before:
```bash
$ kubectl logs experience-api-966d9c7c4-87rbk -n visualizer
```
After:
```bash
$ kubectl logs experience-api-966d9c7c4-87rbk -c application -n visualizer
```

**NOTE**: If you don't provide the `-c` flag, you will receive an error message like this :
```
error: a container name must be specified for pod experience-api-966d9c7c4-87rbk, choose one of: [istio-proxy application] or one of the init containers: [istio-validation]
```

##### kubectl exec command

Similar to `kubectl logs`, we need to specify the exact container name with **"-c"**, when we want to jump inside the application’s terminal.

Before:
```bash
$ kubectl exec -it experience-api-966d9c7c4-87rbk -n visualizer -- /bin/bash
```

After:
```bash
$ kubectl exec -it experience-api-966d9c7c4-87rbk -c application -n visualizer -- /bin/bash
```

##### Check your Service’s port configurations.
Please ensure that you don’t use incorrect port names for your service’s listening ports.

For eg:- please avoid the following in your service YAML
```yaml
apiVersion: v1
Kind: Service
      ...
  ports:
    name: http  # This is an invalid name for an SSL port(443)
    port: 443
```
OR this
```yaml
apiVersion: v1
Kind: Service
      ...
  ports:
    name: https  # This is an invalid name for a port if it serves non-SSL traffic
    port: 3000
```

This causes Istio to configure their proxies incorrectly as it assumes the protocol from the port name.
In this example, it would assume traffic on port 443 as HTTP traffic. The best way to safeguard ourselves from this
issue is to ensure that you use the [core-paas-base service templates](https://github.com/mulesoft/core-paas-base/blob/master/helm/core-paas-base/templates/_service.tpl)

For more details on port names, please refer to [this page](https://istio.io/latest/docs/ops/configuration/traffic-management/protocol-selection/) in the Istio documentation site


##### Check how your application handles HTTP headers

 Istio sidecars work by storing and passing context in HTTP headers, so you will need to ensure that your application
 doesn't edit/override certain HTTP headers. For eg:- You must be careful when setting the `host` header in your API code.
 If you happen to edit/override `host` header and set it to a value different from that of the destination URL,
 the request will not be routable in Istio.

Please note that this may vary and is highly dependent on several factors in your code (like the language, HTTP libraries used)

##### Istio-Proxy running low on CPU/Memory

If you get alerts relating to `cpu_requests_too_low` or `mem_requests_too_low` for your `istio-proxy` sidecar container,
you might need to bump the resources to something different than that of the default resources configured for the containers.
You can do this by using [core-paas-base templates](https://github.com/mulesoft/core-paas-base#baseistioannotationsresources)
to render special annotations to set the resource quota for your `istio-proxies`.

**NOTE**: Before bumping the resource quota for your sidecars, we highly recommend getting an understanding as to why your
sidecar proxies need more resources. As an example, `istio-proxy` is directly affected by the number of open TCP socket
connections. If your service calls an AWS external service like RDS(Postgres), Redis etc, we encourage you to look into
optimising relevant parameters like Idle connection limit, Connection pool size etc.

## How Istio works

Istio employs a sidecar container model to achieve its service mesh functions. For eg:- We can enable mTLS between two services
through sidecar containers inserted in the same pods as the service containers.  In the diagram below, we illustrate how
mTLS is achieved between Service A and B. The Istio proxy sidecars are responsible  for intercepting the inbound and
outbound traffic of the service containers in the pod and providing mTLS authentication between them.

NOTE: Once Istio is enabled in your services, all inbound and outbound requests of your services will go through the istio proxy sidecars (regardless of mTLS being enabled/disabled).

![Istio Sidecars](../images/istio-sidecar.png)
