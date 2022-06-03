---
title: Provisioning
sidebar: core-paas_sidebar
permalink: core-paas-access-provision.html
folder: core-paas
---

## Installation
To get your environment configured with all the dependencies and the correct versions for them, use [provision.sh](https://github.com/mulesoft/core-paas-getting-started/blob/master/scripts/provision.sh):
- `provision.sh remove`: removes all the installations of the dependencies. Use this to clean your environment before provisioning the new dependencies.
- `provision.sh check`: checks current versions of dependencies. Use this to check the current state of your system.
- `provision.sh`: installs all dependencies, using the correct versions for each one. 

In addition you can set the environment variable `GITHUB_API_TOKEN` to your github token to avoid having to set it interactively. Documentation on how to generate a token can be found [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
