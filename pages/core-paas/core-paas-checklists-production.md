# Production Ready Checklist

Core PaaS production ready checklist contains all the prerequisites required to deploy an application all the way to production.
If you are unsure of the requirements below, please review our [on-boarding documentation](https://github.com/mulesoft/core-paas-getting-started).

**If this production checklist does not represent the state of your application in production, you will have 24 hours to bring it back into compliance.**

**An incident will be declared if your application does not come back into compliance within that time window.**

# Process

1. Create a new [GUS](https://gus.lightning.force.com/lightning/o/ADM_Work__c/list) ticket named: `Review Production Readiness Checklist for <your application name>`. Please use `MS Core PaaS` as  Product Tag.
1. Create a new Quip document using the [Production Checklist Template](https://salesforce.quip.com/ux5pAIkdogNG), and link the document to the GUS ticket. Please answer **ALL** of the questions.  

   #### \* All questions are _mandatory_.

   #### \* If the question is not applicable to your application, please provide a _detailed_ explanation.

   #### \* Core PaaS(Run Team) will be conducting a review on all the questions. Please ensure that all posted links work and all questions are answered _before_ requesting a review.

   #### \* Core PaaS(Run Team) must approve this ticket before your application can be deployed to **kstg**.

1. Message with `!ask` in the [#prodeng-run-k8s-support](https://mulesoft.slack.com/archives/C02TKKV39D0) channel to request a review of this checklist.  
 **Run team will review the checklist within 3 business days**

   

### Post Checklist Approval tasks

- Create a new [GUS change case ticket](https://gus.lightning.force.com/lightning/o/Case/list?filterName=Recent) that outlines the deployment of your application. Example: [#pccr-triage](https://mulesoft.slack.com/archives/C90C7JYFN)
- Get your GUS change case reviewed and approved by posting the link in [#pccr-triage](https://mulesoft.slack.com/archives/C90C7JYFN).
- Create a PR to [kilonova-product-configs](https://github.com/mulesoft/kilonova-product-configs/) that includes your application's product specification. You will need to fork the repository in order to push your changes. 
  Ensure the PR description includes:
  - a link to the production checklist GUS ticket approved by Run Team
  - a link to the "GUS change ticket" approved in the #pccr-triage slack channel

**NOTE**: When creating a new GUS change case, please select "Change" as the record type.
