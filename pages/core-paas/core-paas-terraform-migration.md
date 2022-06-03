# Terraform & Core PaaS Migration

## Migrating from the X environments
If you are migrating from the X environments you will not be required to make many changes to your existing Terraform. We have peered the AWS accounts and VPCs so that networking traffic can flow between them. This means existing databases, redis instances etc can be left as they are. There maybe a few changes that are required before they will be able to connect to these resources:

* We do not support IAM Roles. This means to access infrastructure such as buckets and IAM user will need to be created and have a policy attached to allow it the correct permissions
* Ports will need to be opened to `10.0.0.0/8`. This is to ensure that with our cluster migrations as we are constantly changing the CIDRs that we are deployed into that connectivity is always maintained

We are working on a plan to migrate all of the AWS backend infrastructure into our account however this will not be a priority until a majority of services are onboarded

## Deploying a new service
If you are a new service please make sure you are deploying anything with Terraform into our accounts. You can find examples of common services on the next few pages of this guide. Please reach out to anyone in Core PaaS if you need any assistance. 
