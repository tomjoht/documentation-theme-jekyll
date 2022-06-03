---
title: Build Infrastructure
sidebar: core-paas_sidebar
permalink: core-paas-access-docker-registries.html
folder: core-paas
---


# Docker Registries
Docker registries are where we store our docker images.

## Get credentials
Follow the infosec process here: [Identity User Onboarding](https://confluence.internal.salesforce.com/display/MULEINFOSEC/Identity+User+Onboarding+-+Getting+Started)
> Be sure to note you need Harbor access when you request it. Access is granted via the engineering_all or kontractors group

## Login to Harbor via OIDC Provider
In order to access [harbor](https://artifacts.msap.io) you will need to authenticate with our OIDC prodivder; Keycloak. 

Here are the required steps to authenticate to the Harbor interface:
1) at the Harbor endpoint click the Login via OIDC Provider button
1) following the redirection to Keycloak, enter your federated credentials
1) If this is the first time that you are logging in to Harbor with OIDC, specify a user name for Harbor to associate with your OIDC username. **NOTE**: this user cannot be changed and is required to authenticate via the CLI
1) After the OIDC provider has authenticated you, you will be redirected back to Harbor

## Using OIDC from the Docker or Helm CLI
After you have authenticated via OIDC and logged into the Harbor interface for the first time, you can use the Docker or Helm CLI to access Harbor.

Here are the required steps to authenticate via the CLI(s):
1) Log in to Harbor with an OIDC user account
1) Click your username at the top of the screen and select User Profile
1) Click the clipboard icon to copy the CLI secret associated with your account
1) Copy CLI secret
> Optionally click the ... icon in your user profile to display buttons for automatically generating or manually creating a new CLI secret. A user can only have one CLI secret, so when a new secret is generated or create, the old one becomes invalid.

You can now use your CLI secret as the password when logging in to Harbor from the Docker or Helm CLI:
```bash
docker login -u $harbor_user -p $harbor_cli_secret artifacts.msap.io
```

*NOTES*:
The Docker and Helm CLIs cannot handle redirection for OIDC, so Harbor provides a CLI secret for use when logging in from Docker or Helm. This is only available when Harbor uses OIDC authentication.

The CLI secret is associated with the OIDC ID token. Harbor will try to refresh the token, so the CLI secret will be valid after the ID token expires. However, if the OIDC Provider does not provide a refresh token or the refresh fails, the CLI secret becomes invalid. In this case, log out and log back in to Harbor via your OIDC provider so that Harbor can get a new ID token. The CLI secret will then work again.
