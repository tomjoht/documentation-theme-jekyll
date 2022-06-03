# Run the App in KIND

[`kind`](https://kind.sigs.k8s.io/) (**K**ubernetes **In** **D**ocker) is a tool like `minikube` for running Kubernetes locally.

## Getting started with Kind

### Prerequisites

1. Get the required tools [run `provision.sh`](https://github.com/mulesoft/core-paas-getting-started/blob/master/scripts/provision.sh).
1. Ensure Docker is configured with enough disk, ram, and CPU for your services. We recommend 64gb disk, 6 cpus, and 6gb ram.

To create a new local Kubernetes cluster run:

```bash
export KUBEVERSION=v1.17.5
kind create cluster --image=kindest/node:$KUBEVERSION
```

> NOTE: Set your kind cluster version (KUBEVERSION) to our production clusters version.
>
You can get the version of a running cluster using the following steps:

1. [Login](../access/clusters.md#Login) to a running core-paas Kubernetes cluster.
1. Run the following command to fetch the **\$KUBEVERSION**

```bash
export KUBEVERSION=$(kubectl version -o json | jq -r .serverVersion.gitVersion)
```

**CAUTION**: Ensure your `kubectl` context points to your local kind cluster.
You can run `kubectl config get-clusters | grep kind` to list out your kind clusters by name. You can switch the context by running `kubectl config use-context <your-kind-cluster-name>` before running any Kubernetes operations. This makes sure the commands run on your local cluster.

## Start Helm Tiller

- Start the helm server, called `tiller`, inside the kind cluster. We can use [core-paas-client(`cpc`)](https://github.com/mulesoft/core-paas-client) to deploy tiller.

```bash
export HELM_VERSION=2.17.0
cpc debug helm tiller --kube-context <your-kind-cluster-name> --env local --cluster kind --image-version ${HELM_VERSION} --image-name ghcr.io/helm/tiller
```

**NOTE**: Please ensure you have the **latest** `cpc` installed in your local machine. You can find out how to install cpc [here](https://github.com/mulesoft/core-paas-client/blob/master/README.md#installing).

- Use latest helm chart location, as helm v2 defaults to a deprecated source. (see the error below)
  ```
  Error: error initializing: Looks like "https://kubernetes-charts.storage.googleapis.com" is not a valid chart repository or cannot be reached: Failed to fetch https://kubernetes-charts.storage.googleapis.com/index.yaml
  ```

```bash
helm init --stable-repo-url=https://charts.helm.sh/stable --client-only
```

- run the following command to test if `tiller` is working. The command should exit **without** an error if tiller is setup.

```bash
helm ls
```

- Ensure all pods are running by running the following command:

```bash
kubectl get pods --all-namespaces
```

All the entries should show `STATUS` as `Running`:

```bash
NAMESPACE     NAME                                         READY   STATUS        RESTARTS   AGE
kube-system   coredns-86c58d9df4-6xj5s                     1/1     Running       0          4m58s
kube-system   coredns-86c58d9df4-fq2d4                     1/1     Running       0          4m58s
kube-system   etcd-kind-control-plane                      1/1     Running       0          4m15s
kube-system   ip-masq-agent-d75jk                          1/1     Running       0          4m58s
kube-system   kindnet-8rt8r                                1/1     Running       1          4m58s
kube-system   kube-apiserver-kind-control-plane            1/1     Running       0          4m6s
kube-system   kube-controller-manager-kind-control-plane   1/1     Running       0          4m12s
kube-system   kube-proxy-x2fk9                             1/1     Running       0          4m58s
kube-system   kube-scheduler-kind-control-plane            1/1     Running       0          4m16s
kube-system   tiller-deploy-57f498469-8wlsx                0/1     Terminating   0          10s
kube-system   tiller-deploy-5d6cc99fc-8mpfp                0/1     Running       0          8s
```

## Build the docker image locally

- Set these environment variables to what you are deploying

```bash
# This should be the name of the application. Example "xapi"
export COMPONENT=xapi
# This should be the name of the product. Example "mozart"
export PRODUCT=mozart
# This is the chartname of your application
export NAME=${PRODUCT}-${COMPONENT}
```

- Build the docker image:

```bash
docker build -t artifacts.msap.io/mulesoft/${NAME}:latest .
```

- Load the docker image onto your `kind` Kubernetes cluster

```bash
kind load docker-image artifacts.msap.io/mulesoft/${NAME}:latest
```

## Install helm dependencies

Add base repo

```bash
helm repo add core-paas-base https://s3-us-west-2.amazonaws.com/mulesoft-ci-helm-chart-repository/stable/core-paas
```

Install deps

```bash
helm dep up helm/${NAME}
```

## Review configuration

To view the Kubernetes configs that will applied run:

```bash
helm template --namespace ${PRODUCT} --name ${NAME} ./helm/${NAME}
```

## Install the app

To install and start the app in the cluster run:

```bash
helm upgrade --install --debug --namespace ${PRODUCT} ${NAME} ./helm/${NAME}
```

Once the command completes, verify that the app is `Running`:

```bash
kubectl -n ${PRODUCT} get pod
```

The result should look like:

```bash
NAME                                            READY     STATUS    RESTARTS   AGE
alexander-preprocessing-service-6c4bd698b9-d6wqh   0/1       Running   0          7s
```

At this point the app is running inside the cluster by running:

```bash
kubectl -n ${PRODUCT} logs alexander-preprocessing-service-6c4bd698b9-d6wqh
```

## Calling the app

Confirm that the app is responding by calling it.
The Kubernetes cluster runs inside a virtual machine so it's not accessible directly through localhost.
Access the app inside the cluster is through [port-forwarding](../troubleshooting/kubectl.md#port-forward).

## Delete the app

_DANGER!_ **The helm delete command should be run with EXTREME CAUTION!!**

Make sure you are running the command against `kind` and not a cloud Kubernetes cluster.
You can check by ensuring that the `KUBECONFIG` environment points to : `${HOME}/.kube/kind`.

To make the `KUBECONFIG` var point to the `kind` config, run:

```bash
export KUBECONFIG=$(kind get kubeconfig-path)
```

Then delete the app:

```bash
helm delete --purge ${NAME}
```
