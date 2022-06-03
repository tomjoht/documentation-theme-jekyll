# Istio Ingress Gateway

## Overview

The [istio-ingressgateway](https://istio.io/latest/docs/tasks/traffic-management/ingress/ingress-control/) is comprised of one or more istio-proxies fronted by a `LoadBalancer` service that route traffic to internal services based on [Gateway](https://istio.io/latest/docs/reference/config/networking/gateway/) and [Virtual Service](https://istio.io/latest/docs/reference/config/networking/virtual-service/) configurations.

![Istio IGW](../images/istio-igw.png)

There are two concepts that are often conflated/confused:
1. `istio-ingressgateways` - A fleet of istio-proxies that sit behind an Elastic Load Balancer appliance

2. `Gateways` - configurations/custom resources consumed by istiod to describe how to receive traffic after it has been terminated at the `istio-ingressgateway` ELB appliance

## Onboarding

Onboarding to the Istio Ingress Gateway involves:
1. adding a [gatewayConfig](https://github.com/mulesoft/core-paas-istio-config/blob/master/helm/core-paas-istio-config/templates/namespace-gateways.yaml) to your namespace in kilonova-envs-config
1. adding the [inboundSettings](https://github.com/mulesoft/core-paas-base/blob/master/helm/core-paas-base/templates/istio/_inbound_settings.tpl) base template to your helm chart
1. adding the service's DNS name to navi-legacy

Any `VirtualService` created by the `inboundSettings` base template maps directly to the namespace's corresponding `gatewayConfig`. The `Gateway` created by the `gatewayConfig` base template is configured to restrict the set of `Virtual Services` that can bind to a `Gateway` server using the `namespace/hostname` syntax in the [hosts](https://github.com/mulesoft/core-paas-istio-config/blob/52a8f5c2f60f77f87e18bd05e20394f6003e0293/helm/core-paas-istio-config/templates/namespace-gateways.yaml#L30) field.

### Sample Application Onboarding

Here we will onboard a sample application to the default Istio Ingress Gateway deployed in the core-paas namespace.

First, we want to add a [`gatewayConfig`](https://github.com/mulesoft/core-paas-istio-config/blob/52a8f5c2f60f77f87e18bd05e20394f6003e0293/helm/core-paas-istio-config/templates/namespace-gateways.yaml) to kilonova-envs-config:
```yaml
### kilonova-envs-config/<env>/core-paas/core-paas-istio-config/<namespace>.yaml
namespaces:

  sample-ns:
    gatewayConfig:
      servers:
      - hosts:
        - sample-ns/*
        port:
          name: http
          number: 80
          protocol: HTTP
      - hosts:
        - sample-ns/*
        port:
          name: http2
          number: 443
          protocol: HTTP
```

Second, we will create a [`virtualservices.yaml`](https://github.com/mulesoft/core-paas-base#baseistiotrafficinboundsettings) with the following contents:
```yaml
{{- include "base.istio.traffic.inboundSettings" . -}}
```

Then we add the route configurations to our [`values.yaml`](https://github.com/mulesoft/core-paas-base#example-values-6). **NOTE:** these values can overridden in kilonova-envs-config to avoid rebuilding the whole chart for route configuration changes:
```yaml
istio:
  traffic:
    inboundSettings:
      sample-svc.sample-ns.svc.cluster.local:80:
        http:
        - match:
          - uri:
              prefix: "/"
```

Third, we add the external DNS name to core-paas-navi in `kilonova-envs-config`.

```yaml
### kilonova-envs-config/<env>/core-paas/core-paas-navi/values.yaml
# Weights for this clusters domains
weights:
  sample-ns-sample-svc.k<env>.msap.io: "0"

# Weights for legacy sources
legacyWeights:
  sample-ns-sample-svc.k<env>.msap.io: "100"

# Sources used to map to legacy services
sources:
  sample-ns-sample-svc.k<env>.msap.io: "core-paas-istio-ingressgateway-1-10-2.kbuild-dev.msap.io"
```

The `inboundSettings` base template uses the [core-paas-navi](https://github.com/mulesoft/core-paas-navi) URL naming convention (`<namespace>-<service name>.k<env>.msap.io`).  The above example creates an Istio [Virtual Service](https://istio.io/latest/docs/reference/config/networking/virtual-service/) that routes internet traffic to the internal service URL when users try to reach the external endpoint `https://<sample-ns>-<sample-svc>.<env>.msap.io/`


### L7 LoadBalancing with istio.

Istio provides ability to perform a L7 [loadbalancing with istio](https://istio.io/latest/docs/reference/config/networking/destination-rule/#LoadBalancerSettings). Round robin is a default mode, but you can change by using `DestinationRule`

These settings are enabled via `trafficPolicy`, the first step would to add a new template into your helm chart with the following

```
{{- include "base.istio.trafficPolicy" . -}}
```

Now you can set desired LoadBalancer type via values.yaml

```
istio:
  trafficPolicies:
    sample-svc.sample-ns.svc.cluster.local:
      loadBalancer: LEAST_CONN
```

## Known limitations
- Currently the istio-ingressgateway is deployed as a single Classic ELB per istio revision within the cluster.
  - Functionally, the istio-ingressgateway is **not** a dedicated resource to any specific service besides `core-paas-istio`
  - The istio-ingressgateway is shared with one to many resources that live in other namespaces
- The istio-ingressgateway does **not** guarantee long-lived connections
  - The istio-ingressgateway is implemented as a Kubernetes deployment + service, with individual istio-proxy pods brokering connections between the internet and internal services.  These pods are treated the same way as others in the cluster and are subject to any sort of stopping and restarting deemed necessary by the Kubernetes scheduler.
- The istio-ingressgateway uses Envoy proxy, which does **not** natively support caching, or static content serving.  The istio-ingressgateway is currently meant to be a load balancer, as opposed to a web server like `nginx`.
- When handling HTTP/1.1, Envoy (eg: istio-ingressgateway) [will normalize the header keys to be all lowercase](https://www.envoyproxy.io/docs/envoy/latest/configuration/http/http_conn_man/header_casing). While this is compliant with the HTTP/1.1 spec, in practice this can result in issues when migrating existing systems that might rely on specific header casing.

## FAQ

### Infinite HTTP 302 redirect loop/Browser crashes with "Too many redirects"

When using an AWS ELB with AWS Certificate Manager, and the Istio Gateway with `protocol: HTTP` on, it always pushes the header `x-forwarded-proto` as `http`;  This causes a redirect loop because the Gateway continuously tries to update the header to `https`, while the ELB keeps the header as `http` after the request comes in.

This is generally seen for gatewayConfigs that have `tls.httpsRedirect: true`, causing the load balancer to send a 301 redirect for all `http` connections, asking the clients to use `HTTPS`.

#### Solution
To fix this, use an internal svc URLs (`internal-svc.<ns>.svc.cluster.local`) for calls to other services that live in the same cluster and namespace; this allows requests to stay within the cluster, and avoids making unnecessary external calls against the ingress gateway.

#### Workaround
For situations where using the internal svc URL is not possible, but still seeing infinite redirects, you can use header operations within Virtual Services to force the request headers on upstream services.

[`inboundSettings`](https://github.com/mulesoft/core-paas-base/blob/master/helm/core-paas-base/templates/istio/_inbound_settings.tpl) Example:
```
istio:
  traffic:
    inboundSettings:
      example-svc.example-ns.svc.cluster.local:80:
        http:
        - match:
          - uri:
              prefix: "/example"
          headers:
            request:
              set:
                x-forwarded-proto: https
                x-forwarded-port: "443"
```
