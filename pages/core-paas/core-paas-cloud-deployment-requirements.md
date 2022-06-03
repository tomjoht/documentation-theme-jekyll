# Requirements for Deploying with Core PaaS

For deploying your application with Core PaaS, the following contracts must be met.

## Build Requirements

While building your application, it must comply with:

- [ ] Follow the naming pattern `{product}-{component}(-{asset})`.
- [ ] Consistent naming: the _name_ must be the same for all: GitHub repository, application's primary docker image, helm chart.
- [ ] Consistent tagging: for every app version, _tag_ must be the same in: GitHub repository, application's primary docker image, helm chart.
- [ ] Push the docker image and helm chart using the [Core PaaS Jenkins scripts](jenkins-functions.md).
- [ ] _(MuleSoft requirement)_ Push to Nexus IQ all artifacts from every branch that will be deployed to a production environment.

## Deployment Requirements

While deploying your application, it must comply with:

- [ ] _(MuleSoft requirement)_ A PCCR must be created and approved before deploying.
- [ ] Deploy using the [cpc Jenkins job](cpc.md).
- [ ] Helm tests will run after the application is deployed. The deploy job will fail if the tests fail, but the application will remain deployed.

In the future, [Muleteer](https://muleteer.msap.io/) will have a series of checks that all deployments must pass, such as security checks.
