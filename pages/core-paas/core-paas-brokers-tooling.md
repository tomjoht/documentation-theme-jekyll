# Service Broker Prerequisites

This page outlines the tooling required to interact with Service Brokers. This
includes brokers installed within the cluster, offerings that the deployed
brokers support and the lifecycle of resources managed via a Service Broker. 

## Kubectl & Helm

As the Service Catalog extends the Kubernetes API it is imperative that
`kubectl` & `helm` is installed and configured to communicate with the cluster
and check on the status of the chart which will be creating the service instance
managed by the Service Brokers. This is installed via our
[provision.sh](https://github.com/mulesoft/core-paas-getting-started/blob/master/scripts/provision.sh)
script or can be installed via most package managers (brew, apt, etc).

## svcat

`svcat` is a CLI for interacting with Service Catalog resources. `svcat` is a
domain-specific tool to make interacting with the Service Catalog easier. `svcat`
communicates with Kubernetes cluster by directly using REST API - just like
`kubectl`. Core PaaS recommends using the same version of the CLI as we run in
our clusters. Currently we are running `v0.3.1` in all environments. 

To install `svcat` please use the following commands dependent on your operating
system:

**NOTE: when there is more adoption with Service Brokers the installation will
be moved to the provision.sh script**

### macOS
```bash
curl -sLO https://download.svcat.sh/cli/v0.3.1/darwin/amd64/svcat
chmod +x ./svcat
mv ./svcat /usr/local/bin/
svcat version --client
```

You can alternatively use brew on macOS if that is your preferred installation
method:
```bash
brew update
brew install kubernetes-service-catalog-client@0.3.1
svcat version --client
```

### Linux
```bash
curl -sLO https://download.svcat.sh/cli/v0.3.1/linux/amd64/svcat
chmod +x ./svcat
mv ./svcat /usr/local/bin/
svcat version --client
```
