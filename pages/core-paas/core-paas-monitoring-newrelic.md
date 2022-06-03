# New Relic

## Install the APM agent in your application

In order to get the [New Relic
APM](https://docs.newrelic.com/docs/apm/agents/manage-apm-agents) metrics reported,
you only need to make sure to have the [New Relic APM
agent](https://docs.newrelic.com/docs/using-new-relic/cross-product-functions/install-configure/install-new-relic/)
running for your application.

## Configure the APM agent

All of the New Relic agents can be
[configured](https://docs.newrelic.com/docs/using-new-relic/cross-product-functions/install-configure/configure-new-relic-agents/)
through environment variables. These environment variables are mounted
automatically to all containers when using the
the helper templates in
[core-paas-base](https://github.com/mulesoft/core-paas-base#basemonitoringenvvars).

For a list of helm values that can be configured, check the [monitoring section
in core-paas-base](https://github.com/mulesoft/core-paas-base#basemonitoringenvvars).

## Validate that metrics are reported

Once the application is deployed to the Core PaaS cloud clusters, the metrics
are accessible in [New Relic APM](https://rpm.newrelic.com/).

Check out [this video on how to view metrics for a
pod](https://drive.google.com/file/d/1d6VsDP_TyK1D9cNhF6m6zKE1bXZOgEvx/view?usp=sharing)

## On-Host Integrations

New Relic supports on-host integrations; these dig deeper into various
services. The full list of services supported upstream is
[here](https://docs.newrelic.com/docs/integrations/kubernetes-integration/link-apps-services/monitor-services-running-kubernetes).
We have not enabled all of these integrations, but we're open to doing so.
These are the ones we've enabled, and how to use them:

### NGINX

We run the [nri-nginx](https://github.com/newrelic/nri-nginx) integration in
discovery mode. To use this:

1. You can use any of the three nginx status modules
   (`ngx_http_stub_status_module`, `ngx_http_status_module`, `ngx_http_api_module`)

1. The module must be configured to listen on the endpoint `/server_status`, on
   any port, and must allow all traffic. This config should work:

   ```
   server {
     listen        9831;
     server_name   127.0.0.1;
     location /server_status {
         stub_status on;
         access_log off;
         allow all;
     }
   }
   ```

1. You must have at least one kube port with the name `nginx-metrics` which
   points to the containerPort defined in the above config. The example below
   shows a pod spec with _two_ different nginx instances, with different main
   and metrics ports:

   ```
      containers:
      - name: main
        image: <image>
        ports:
        - containerPort: 8080
          name: default
          protocol: TCP
        - containerPort: 9090
          name: nginx-metrics
          protocol: TCP
      - name: side
        image: <image>
        ports:
        - containerPort: 8181
          name: default
          protocol: TCP
        - containerPort: 9191
          name: nginx-metrics
          protocol: TCP
   ```

   (If you associate a kube Service with this pod, you should probably not
   forward the metrics ports, just the main ports)

1. You should label the pods in your deployment with `newrelic-monitor: nginx`;
   this enables the newrelic pods to find your pods. Note in this example that
   the `newrelic-monitor` label is on the Pods, _not_ the Deployment:

   ```
   apiVersion: apps/v1
   kind: Deployment
   metadata:
     name: nginx
     labels:
       app: nginx
   spec:
     replicas: 1
     selector:
       matchLabels:
         app: nginx
     template:
       metadata:
         labels:
           app: nginx
           newrelic-monitor: nginx
   ```

That's it! You'll know it's working because your pods will show up in two places:

1. [New Relic One](https://one.nr/0YBR60O82QO) under the NginxSample key.
1. [On-Host Integrations](https://infrastructure.newrelic.com/accounts/205337/integrations/onHostIntegrations/accounts/2/nginx/dashboard?filters=%7B%22and%22%3A%5B%7B%22is%22%3A%7B%22label.environment%22%3A%22kdev%22%7D%7D%5D%7D&timeEnd=1591158636102&timeStart=1591155000000)

### Postgres

First, some history. (You can skip this paragraph if you want to skip the finer
details). New Relic had an old system they called "Plugins." Plugins were
[deprecated in January 2021 and are due to be turned off completely June
2021](https://discuss.newrelic.com/t/new-relic-plugin-eol-wednesday-june-16th-2021/127267).
We had previously provided a [db-monitoring
agent](https://github.com/mulesoft/core-paas-db-monitoring-agent) built on the
postgres plugin which is also going away. [This is the
list](https://one.nr/0znQxPa37QV) of databases currently monitored using the
old plugin. New Relic _does_ have a replacement, called "on-host integrations."
That approach is what the rest of this section uses.

[This is the list of
metrics](https://docs.newrelic.com/docs/integrations/host-integrations/host-integrations-list/postgresql-monitoring-integration/#metrics)
that the New Relic Postgres On-Host Integration (nri-postgres) collects.
Core-paas has implemented a centralized monitoring system for these- the only
thing you need to do to enable this monitoring is create a kubernetes Secret
with the correct label.

We have created a [template in
core-paas-base](https://github.com/mulesoft/core-paas-base#basemonitoringdatabase)
which creates the correct secret according to the configuration parameters
given there. For most cases, this should be sufficient. Add this template to
your chart, set the required fields in your .Values.database, and you should be
good to go. After you deploy it, the data should show up in a few places:

1. NR One under these keys:
    * [PostgresqlInstanceSample](https://one.nr/0a7j96PxxQO)
    * [PostgresqlDatabaseSample](https://one.nr/01OwvOMJNRv)
    * [PostgresqlTableSample](https://one.nr/0PLREgOd9Qa)
    * [PostgresqlIndexSample](https://one.nr/0x0jl7n6YRW)
    * PgBouncerSample (if enabled) (I can't make this a link until at least one
      team enables PgBouncer :) )
1. [On-Host Integrations](https://one.nr/0xZw0o1vnQv)
1. [NR Inventory](https://one.nr/0znQxPaN5QV) under the
   `integration/com.newrelic.postgresql` source
1. [New Relic Explorer](https://one.nr/0e1wZvdAKw6)

#### Postgres Lock Metrics

New Relic also supports lock metrics, however, they are currently undocumented
and require an extra step to enable. You can see the names of the metrics and
collection methodology [in the source
code](https://github.com/newrelic/nri-postgresql/blob/915da342ad74e5092006978000712798e6f423dd/src/metrics/lock_definitions.go#L57).
Here is a quick reference on the fields they add:

Under PostgresqlDatabaseSample:

* `db.locks.accessExclusiveLock`
* `db.locks.accessShareLock`
* `db.locks.exclusiveLock`
* `db.locks.rowExclusiveLock`
* `db.locks.rowShareLock`
* `db.locks.shareLock`
* `db.locks.shareRowExclusiveLock`
* `db.locks.shareUpdateExclusiveLock`

If you do not see these fields in your data, you probably need to enable the
`tablefunc` postgres extension; Amazon [supports this
extension](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_PostgreSQL.html#PostgreSQL.Concepts.General.FeatureSupport.Extensions)
but it has to be enabled specifically by running `CREATE EXTENSION tablefunc;`
against your database's public schema. (This would likely be best done as a
migration). See the [CREATE
EXTENSION](https://www.postgresql.org/docs/current/sql-createextension.html) or
[tablefunc](https://www.postgresql.org/docs/current/tablefunc.html) docs for
more.

### Redis

First, some history. (You can skip this paragraph if you want to skip the finer
details). New Relic had an old system they called "Plugins." Plugins were
[deprecated in January 2021 and are due to be turned off completely June
2021](https://discuss.newrelic.com/t/new-relic-plugin-eol-wednesday-june-16th-2021/127267).
These are the lists of redis instances currently monitored by plugins:

* [EC Redis](https://one.nr/0LZQWgoqXQW)
* [Redis](https://one.nr/0xZw0ozL0Qv)
* [Amazon ElastiCache](https://one.nr/01OwvOa3yRv)

New Relic _does_ have a replacement, called "on-host integrations." That
approach is what the rest of this section uses.

[This is the list of
metrics](https://docs.newrelic.com/docs/integrations/host-integrations/host-integrations-list/redis-monitoring-integration/#metrics)
that the New Relic Redis On-Host Integration (nri-redis) collects.  Core-paas
has implemented a centralized monitoring system for these- the only thing you
need to do to enable this monitoring is create a kubernetes Secret with the
correct label.

We have created a [template in
core-paas-base](https://github.com/mulesoft/core-paas-base#basemonitoringredis)
which creates the correct secret according to the configuration parameters
given there. For most cases, this should be sufficient. Add this template to
your chart, set the required fields in your .Values.redis, and you should be
good to go. After you deploy it, the data should show up in a few places:

1. NR One under these keys:
    * [RedisSample](https://one.nr/0YBR66YBdRO)
    * [RedisKeyspaceSample](https://one.nr/0nVjY6V53Q0)
1. [On-Host Integrations](https://one.nr/0e1wZvLEEw6)
1. [NR Inventory](https://one.nr/0bEjONqBDR6) under the
   `integration/com.newrelic.redis` source
1. [New Relic Explorer](https://one.nr/04ERPM7XYjW)
