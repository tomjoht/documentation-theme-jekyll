# Service Brokers

## Background

Managing the lifecycle of supporting infrastructure such as databases, caches,
monitoring configuration and more is a challenging, time-consuming, and
expensive task for development teams as it requires knowledge of our various
Software as a Service dependencies. This introduces a high cost for development
teams to deploy new services, and as a result environments and an ever growing
support burden for operations teams.

Service Brokers is a Core PaaS initiative to solve the complexities and
management of supporting infrastructure in the public cloud and PCE. 

## Overview

![Broker Overview](../images/broker-overview.png)  

Within the Core PaaS clusters two components will be present. The Service
Catalog API and the Core PaaS Service Broker.

The Service Catalog is an extension API that enables applications running inside
the cluster to access applications and services provided by external sources,
such as: databases, message queuing applications, object storage services, etc.
This API provides a way to list, provision, and bind with external Managed
Services created by the Service Brokers.

The Core PaaS Service broker is then responsible for fulfilling these requests
and managing the lifecycle of the infrastructure it provisions. This allows Core
PaaS to abstract the way infrastructure is provisioned and managed across our
different environments such as ComCloud, GovCloud & PCE. All while providing sane,
secure defaults and additionally allowing us to make changes across our entire
fleet of infrastructure without having to update hundreds of repositories.

## Requirements

In order to interact with the Service Catalog and resources created by the
Service Brokers please read the [Prerequisites](../brokers/tooling.md) page.

## Broker Implementations

The Service Brokers currently available & supported in Core PaaS clusters are:
- [IAM Roles](../brokers/iam.md)
