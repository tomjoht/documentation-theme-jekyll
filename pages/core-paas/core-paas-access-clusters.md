---
title: Accessing Core PaaS Cloud Clusters
sidebar: core-paas_sidebar
permalink: core-paas-access-clusters.html
folder: core-paas
---
# Accessing Core PaaS Cloud Clusters

## Get credentials
Follow the infosec process here: [Identity User Onboarding](https://confluence.internal.salesforce.com/display/MULEINFOSEC/Identity+User+Onboarding+-+Getting+Started)
> Be sure to note you need kubernetes access when you request it.

## Install tools
Ensure the [required tools are installed](provision.md).

## Login
To connect to a cluster you need to use `tele` to login to it. `tele` will modify your `~/.kube` configuration files to point to a cluster.

```bash
tele login --auth=Keycloak --hub opscenter.kdev.msap.io stable5-us-east-1
```

The following parameters are passed to the `tele` command:
- login: Telling the tool that we want to login.
- --auth=Keycloak: The authorization mechanism (We only support Keycloak).
- opscenter.kdev.msap.io: URL to the environment you want to log into. Change kdev to the environment you want access to `kdev|kbuild|kbuild-dev|kqa|kstg|kprod|kprod-eu`.
- stable5-us-east-1: The cluster you want access to. [Here](https://github.com/mulesoft/valkyr/blob/master/config/channel-template.yaml#L60) is the list of clusters deployable by Valkyr.
