# Step 2: Running in the cloud

The following tasks have to be accomplished to complete this step:

1. Configure your jenkinsfile to build and push the docker image and the helm chart. Use the [Valkyr](https://github.com/mulesoft/valkyr) pipeline.

1. Create the namespace (product/team name) in [kilonova-envs-config](https://github.com/mulesoft/kilonova-envs-config/) for each environment in `https://github.com/mulesoft/kilonova-envs-config/blob/master/k*/core-paas/core-paas-namespaces/values.yaml`.

1. Add the configurations for kdev and kqa in [kilonova-envs-config](https://github.com/mulesoft/kilonova-envs-config/).

1. Deploy your app to the kdev and kqa clusters:
   - [Valkyr](https://github.com/mulesoft/valkyr) pipeline will deploy the app in a CD way depending on the branch and the configuration defined.
   - Follow the [deployment requirements for deploying with Core PaaS](deployment-requirements.md).

1. [Access the clusters](../access/clusters.md) where the app is deployed.

1. [URLs to access service](urls.md)

1. When ready to go to production, fill out the [release readiness checklist](../checklists/production.md) and create a PR for the [production deploy whitelist](https://github.com/mulesoft/kilonova-product-configs#whitelist-of-services-enabled-for-production-deploy).

1. [Migrating to production](production-migration.md)
