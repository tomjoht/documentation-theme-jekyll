# IAM Role Service Broker 

## Overview

The IAM Role Service Broker is responsible for creating an IAM role that can be
assumed by the Core PaaS proxy role and then consumed by the
[kube-aws-iam-controller](https://github.com/mulesoft-labs/kube-aws-iam-controller).
This controller then injects temporary credentials into the pod allowing for it
to access AWS resources without the need for long lived access keys. More
information on the use of roles can be found
[here](https://github.com/mulesoft/core-paas-rfc/blob/master/iam-access.md).

## Onboarding

Onboarding to the IAM broker is relatively painless as we have extended the
[base
helper](https://github.com/mulesoft/core-paas-base/blob/master/helm/core-paas-base/templates/_iam.tpl)
used to assume a role to now create a Service instance managed by the broker.
The role created via the helper is able to be assumed by the controller and be
created with the permissions supplied via the inline policy in your chart.

### Sample Application Onboarding

Here we will onboard a sample application to an IAM role created by the broker
and assumed via the controller. Please skip the first two steps if you are
already using the IAM base helper

First we will create an `iam.yaml` with the following contents:
```yaml
{{- include "base.iam.role" . -}}
```

Secondly we will include the required helpers into our `Deployment` resource:
```yaml
# Please note your indentation might differ

apiVersion: apps/v1
kind: Deployment
...
spec:
  template:
    spec:
      containers:
      - name: sample-app
        env:
        {{ include "base.iam.env" . | indent 8 | trim }}
        volumeMounts:
        {{ include "base.iam.volumeMounts" . | indent 8 | trim }}
      volumes:
      {{ include "base.iam.volumes" . | indent 6 | trim }}
```

Finally we will configure our IAM role inline policy in our `values.yaml` and
set the `enableServiceInstance` flag that toggles the helper to create role via
the Service Broker:
```yaml
iam:
  enabled: true
  enableServiceInstance: true
  inlinePolicy: |
   {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "",
        "Effect": "Allow",
        "Action": [
          "ec2:DescribeTags",
        ],
        "Resource": "*"
      }
    ]
   }
```

Please see the [base
helper](https://github.com/mulesoft/core-paas-base/blob/master/helm/core-paas-base/templates/_iam.tpl)
for more configuration options that might apply to you.

## Interacting with the created resource

Once created the role will be available in AWS. They can be found
[here](https://console.aws.amazon.com/iamv2/home?#/roles).

To see the resource within the Kubernetes cluster please use `svcat`.

First get the Service Instance name in your namespace:
```bash
$ svcat -n $NAMESPACE get instances
```

Then you can describe the instance to retrieve more information about it
including class, plan and most importantly `status`:
```bash
$ svcat -n $NAMESPACE describe instances sample-app
```

## Known Limitations
- Currently there is no way to render inline policies with different ARNs in
    separate environments. This may create duplication but will be resolved when
    more resources are managed via Service Brokers.
