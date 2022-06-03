# Sumo Logic

The [kubernetes
logs](https://kubernetes.io/docs/concepts/cluster-administration/logging/) are
collected and forward to Sumo Logic automatically in all Core PaaS cloud
clusters.

All pod output to `stdout` and `stderr` is automatically forwarded to
sumologic.

## Stack traces

One line on `stdout` is one log message in Sumo. Stack traces will need to be
encoded as a single line.  Most libraries support this.

* Java [logback example](https://github.com/mulesoft/amc-agent-reg-facade/blob/f3b48b7857e9e895365383532bb7fa73f5fd1070/amc-agent-reg-facade-service/src/main/resources/logback-spring.xml#L12-L24)
* Nodejs [Winston example](https://github.com/mulesoft/audit-log-service/blob/b44ff0b0e8b614789536d9fca2f2079653dd6a0f/config/default.js#L91)

## Viewing logs

### Log in to the correct Sumo Logic account

There are 2 accounts in Sumo Logic:

* `MuleSoft-Prod`: The commercial-cloud prod environments go here: `kprod`,
  `kprod-eu`, `kstg`, `kbuild`
* `MuleSoft-Dev`: All non-prod commercial clusters use this acount.
* `Mulesoft-Gov`: All gov clusters go here

### Common Searches

#### Single Pod Logs

To get logs for a specific pod, paste the full pod name into the sumo search bar.

Example:

```
kubectl --namespace core-paas get pods | grep navi
navi-8586d75b6f-snf7g
```

To get logs for all containers in the `navi-8586d75b6f-snf7g` pod, type
`navi-8586d75b6f-snf7g` and nothing else into sumo search bar.
![Pod Logs](https://user-images.githubusercontent.com/2194285/49746651-a2efe400-fc6f-11e8-9145-bfb3f9962076.png)

#### Application wide logs

To get logs for your service across all your pods for your service you will use
`_sourceCategory` query.

It follows the pattern: `<environment name>/<cluster name>/<product.name>/<component>.<asset>`.
  > NOTE: You have to replace all `-` with `.`. `core-paas` should be changed
  > to `core.paas` when querying

Example:

```
kubectl --namespace core-paas get deployment | grep navi
NAME                 DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
navi                 5         5         5            5           6d
```

To get logs for all the pods for the `navi` deployment in the `core-paas`
namespace running in the `stable5` cluster inside of `kprod` type
`_sourceCategory=kprod/stable5/core.paas/navi` into sumo search bar. Remember
to replace all `-` with `.` in the namespace and service name.

Each of those fields can be replaced with a `*`.

* `_sourceCategory=*/stable5/core.paas/navi`: Gets logs from all environments
  for `core-paas` `navi` in the `stable5` cluster
* `_sourceCategory=kprod/*/core.paas/navi`:  Gets logs from all clusters in
  `kprod` for `navi`
* `_sourceCategory=kprod/stable5/core.paas/*`: Gets logs from all services in
  the `core-paas` namespace in `kprod` `stable5` cluster

![Application Logs](https://user-images.githubusercontent.com/2194285/49768587-c421f600-fcaa-11e8-87c7-d1ab09eba126.png)

### Details

Logs can be filtered by the following metadata keys:

#### `_source`: Environment as in `kdev`, `kqa`, `kstg`, `kprod-eu`, `kprod`

Examples of valid filters are:

```
_source="kprod"
_source="kprod-eu"
```

#### `_sourceName`: This follows the pattern `<pod-name>/<container-name>`

Examples of valid filters are:

```
_sourceName=ui-768cd6df48-78jjs/*
_sourceName=ui-768cd6df48-78jjs/application
```

#### `_collector=core-paas`: all core-paas cluster logs use the same collector

Examples of valid filters are:

```
_collector=core-paas
```

### Monitoring log volume

We push data about core-paas log volume to New Relic. Here are some examples to
illustrate how to query it:

* [daily log volume (in bytes) per namespace, to sumo prod](https://one.nr/0GbRmN5KYjy)
* [daily log volume (in bytes) per app, to sumo prod](https://one.nr/0xZw0DgnDwv)
* [daily log volume (in message count) per namespace, to sumo prod](https://one.nr/04ERPKmyDwW)
* [daily mean message size (in bytes), per app, to sumo prod](https://one.nr/0eqwyJL61Rn)

### Logging overhead

By default, the sumologic log forwarder includes a bunch of metadata which
helps in identifying unusual problems in logs. However, this metadata is quite
verbose, and services with a very high log volume probably want to turn it off,
particularly if the service has a long name.

The reason we leave this metadata on by default is because the extra metadata
allows us to find pods that are configured incorrectly. There are a number of
pod labeling errors that are very easy to make and very difficult to detect;
this metadata permits us to find them anyway.

Full details are available [in the sumologic
docs](https://github.com/SumoLogic/fluentd-kubernetes-sumologic#reducing-kubernetes-metadata)
but the short version is, set this annotation:

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  template:
    metadata:
      annotations:
        sumologic.com/kubernetes_meta_reduce: "true"
```

Note that the annotation goes on the _pod_ (`.spec.template.metadata.annotations`), not the _Deployment_ (`.metadata.annotations`)

## Known Issues

* Logs over 2mb are DROPPED (reduce the size of your logs, log lines over 2mb
  are unsupported).
* Logs are truncated at 16k. If you are logging lines larger then 16k they will
  be split into 16k chunks and you will have to correlate by using
  `_sourceCategory`. (This is a docker limitation).
* Do not use `*` with something that is quoted.
  `_sourceCategory="kprod.eu/stable2/anypoint.mq/*"` will not work. remove
  quotes like so: `_sourceCategory=kprod.eu/stable2/anypoint.mq/*`
