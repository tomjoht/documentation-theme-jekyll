# Production Migration Process
This doc outlines the process for getting your application running on production.
The doc uses us prod as an example but the same steps apply for prod-eu.

# Prerequisites
Before continuing be sure the following prerequisites are met:

* You have read all of https://github.com/mulesoft/core-paas-getting-started.
* The application meets [production checklist](https://salesforce.quip.com/ux5pAIkdogNG).
* The application is successfully running in kdev / kqa.
* The changes for Core PaaS are in master branch.

# Migration Steps

## High level overview

1. Create kprod **DNS entry** pointing to the existing applications `ELB` (internal or external).
2. Point traffic to new entry.
3. Deploy application to kprod.
4. Migrate traffic over from non-k8s to k8s environment using DNS weights.
5. Destroy old infrastructure after validation period is complete.

We recommend doing steps 1 & 2 first in its own release window.

## Details
### 1. Create kprod **DNS entry** pointing to the existing applications `ELB` (internal or external). 
The first step is to create a new **DNS entry** for the application which points to the applications existing `ELB` (internal or external) in the non kubernetes environment.

Example:

* `App` is running in prod behind `ELB`.
* **DNS entry** `App.cloudhub.io` resolves to `ELB`.

For step 1 we will create new **DNS entry** `App.kprod.msap.io` which resolves to `ELB`.

To do this we create a [PR to kilonova to create a new source and weights](https://github.com/mulesoft/kilonova-envs-config/pull/1230/files).

### 2. Point traffic to new entry.
The next step is to get traffic to resolve to the new **DNS entry** we created above. There are two ways to do this.
A. Update Mule/proxy to point to new DNS entry
Use this method when there is a Mule or other proxy like nginx in front of your application.

Example:

* `App` is running in prod behind `ELB`.
* **DNS entry** `App.cloudhub.io` resolves to a Mule Proxy which proxies traffic to `ELB`.
* **DNS entry** `App.kprod.msap.io` resolves to `ELB`.

For step 2 we will update Mule proxy to send traffic to `App.kprod.msap.io`.

To do this create a PR to the Mule proxy configuration to point to the new DNS entry.

### B. Update existing **DNS entry** for to resolve to the new kprod DNS entry.
Use this method when there is no external proxy between the application URL and its `ELB`.

Example:

* `App` is running in prod behind `ELB`.
* **DNS entry** `App.cloudhub.io` resolves to `ELB`.
* **DNS entry** `App.kprod.msap.io` resolves to `ELB`.

For step 2 we will update **DNS entry** `App.cloudhub.io` to be a CNAME that resolves to `App.kprod.msap.io`.

To do this we create a PR to the terraform scripts that create the top level entry to point to the new DNS entry.

## TLS/HTTPS considerations
If the application requires TLS there are a few more steps involved before you can switch the traffic.
1. If you do not use ACM create a SAN cert that includes both domains (*.cloudhub.io, *.kprod.msap.io). If you use ACM, you can use the existing wildcard SAN certs.
1. Attach correct cert to the existing `ELB` in the `*x` environment (updating existing terraform)

    |env|arn|
    |-|-|
    |kdev|arn:aws:acm:us-east-1:073815667418:certificate/19da4e4c-a852-46bb-94c9-e1f618862eae|
    |kqa|arn:aws:acm:us-east-1:008119339527:certificate/a57734a7-8e0f-4781-902b-d0f359a60f91|
    |kstg|arn:aws:acm:us-east-1:645983395287:certificate/c30b9c76-de72-48d1-b794-1c2ca92417f1|
    |kprod-eu|arn:aws:acm:eu-central-1:749475055724:certificate/66dca718-2d24-453e-ac2f-51936edab93d|
    |kprod|arn:aws:acm:us-east-1:494141260463:certificate/d004170f-8168-4913-927e-807e862ee1d6|
1. Attach cert to the new `k*` `ELB` ([adding annotation to your helm chart](https://github.com/mulesoft/core-paas-base/blob/master/helm/core-paas-base/templates/_service.tpl#L8))

    |env|arn|
    |-|-|
    |kdev|arn:aws:acm:us-east-1:053047940888:certificate/9eaed5bd-0c81-4d64-b1a0-925db8e560c6|
    |kqa|arn:aws:acm:us-east-1:675448719222:certificate/85b0d913-1749-4149-b228-8bb5d8a8e90a|
    |kstg|arn:aws:acm:us-east-1:700982990415:certificate/6c0f253e-7876-4600-b70f-8e187426c961|
    |kprod-eu|arn:aws:acm:eu-central-1:749475055724:certificate/66dca718-2d24-453e-ac2f-51936edab93d|
    |kprod|arn:aws:acm:us-east-1:379287829376:certificate/8824a2fe-36ac-42f0-9e6e-edc40d287b20|

## 3. Deploy application to kprod.
The next step is to get your application to kprod.
You will have to fill out the [production checklist](https://salesforce.quip.com/ux5pAIkdogNG) and ensure it gets approved.

## 4. Migrate traffic over from non-k8s to k8s environment using DNS weights.
The next step is to start sending traffic to the application running inside kprod

To do this make [PRs to kilonova to adjust the weights](https://github.com/mulesoft/kilonova-envs-config/pull/1244/files). This can be done as slow or as fast as you feel comfortable.

Once you have the PR ready, please create a PCCR ticket, informing which service is affected including the old and new weights.

## 5. Destroy old infrastructure after validation period is complete.
Once the migration is complete and we have let the deploy soak for a while, we will destroy the old infrastructure and update dependent applications to point to the new DNS entries directly.
