# URLs
There are two different url types you can use when in the Kubernetes environments.

* [Internal Urls](#internal-urls)
* [External Urls](#external-urls)

# Internal Urls
Internal URLS are the *recommended* urls to use when your application and target are running inside of Kubernetes.
These URLs are only accessible to applications inside the Kubernetes clusters and they will normally point to the services inside the same cluster.

## Format
All internal urls follow this format:

`<service-name>.<namespace>.svc:<port>`

where:
* `<service-name>`: Name of target application.
* `<namespace>`: Namespace (product) of the target application.
* `<port>`: The service port of target.

## Example

If you have an application running inside the `core-paas` namespace with a `service` named `healthz` configured with `port` `8080` the URL will be `healthz.core-paas.svc:8080`

# External Urls
External URLs are used to access applications from outside of the cluster and are used during migrations.
These URLs can be weighted to point to services inside of Kubernetes or the ELB's in the legacy environments.

## Format
All external urls follow this format:

`<namespace>-<service-name>.<env>.msap.io:<port>`

where:
* `<namespace>`: Namespace (product) of the target application.
* `<service-name>`: Name of target application.
* `<env>`: Kubernetes environment the application is in.
* `<port>`: The service port of target.

## Example

If you have an application in `kdev` running inside the `core-paas` namespace with a `service` named `healthz` configured with `port` `8080` the URL will be `core-paas-healthz.kdev.msap.io:8080`
