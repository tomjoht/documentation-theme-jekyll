# How to remove a service from production

This is an attempt to track every step for removing a service from production.
In general, the steps for removal are:

1. Please follow these steps in order. If done out of order, it will break changes to `kilonova-product-configs`.
1. Submit all the PRs to various places for removal (but do not merge them yet).
    - [muleteer](https://github.com/mulesoft/muleteer)
    - [production allowlist](https://github.com/mulesoft/kilonova-product-configs) (remember to check both gov and com channels)
    - [envs-config](https://github.com/mulesoft/kilonova-envs-config)
    - [core-paas-namespaces](https://github.com/mulesoft/core-paas-namespaces/blob/master/helm/core-paas-namespaces/values.yaml#L18-L24): add namespace to `namespacesToDelete`
    - [core-paas-monitoring](https://github.com/mulesoft-ops/core-paas-monitoring/blob/master/terraform/core/alerts.tf): Remove your policy variable & module block for the deprecated namespace

1. Submit Change Request for prod environments. As part of that Change Request specify:
    For each of high envs:
    1. Purge service (`helm delete --purge <chart>`)
    1. Run terraform destroy (if necessary)

1. Get Change Request approved in [#pccr-triage](https://mulesoft.slack.com/archives/C90C7JYFN)

1. Following actions should be executed in this order:
    1. Merge production allowlist removal PR (so the service can't be redeployed)
    1. Ask [#sre-corner](https://mulesoft.slack.com/archives/CGEN054QP) or core-paas-run team to execute your Change Case.
    1. Merge envs-config PR
    1. Merge muleteer PR
    1. Merge core-paas-monitoring PR
    1. Merge core-paas-namespaces PR 

1. Archive / Remove remaining resources (#engineering-services)
    1. Move repo to mulesoft-attic
    2. Delete Jenkins job
