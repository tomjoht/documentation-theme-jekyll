# Operational Excellence

## Observability
In order to successfully run your application in production, the most important thing is to have proper __monitoring__ in place. _Proper monitoring_ has different meaning based on the team, product and application.

The main goals are to be able to:
- proactively prevent potential incidents.
- promptly react during incidents.
- have better context for RCAs.

This is a basic list of services for monitoring:
- Application logs are accessible in [Sumo Logic](../logging/sumologic.md).
- Application metrics are accessible in [New Relic](../monitoring/newrelic.md).
- [AWS ELB Logs](../logging/elb.md) are sent to our ELB logging S3 bucket in each environment.

## Alerting
> TBD

> Tune namespace quotas per environment to allow capacity for all of the assets (https://github.com/mulesoft/kilonova-envs-config/blob/master/kdev/core-paas/core-paas-namespaces/values.yaml#L27). A tuning guidance can live at https://github.com/mulesoft/core-paas-namespaces/blob/master/README.md.

## Debug tooling

[How to use debug tools in production](../troubleshooting/debug-tools.md)
