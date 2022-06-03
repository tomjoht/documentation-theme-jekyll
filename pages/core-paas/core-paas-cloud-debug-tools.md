# Debug tools

In production we want our containers to be as small as possible to ensure fastest startup time and lowest disk use.
However that means just shipping the binary and/or deps without and debug tools like `curl`.
To install debug tools into a pod during runtime we recommend the following approach.

# Non destructive tool injections

To inject new files into a pod without restarting it we can use a `volume` backed by a `configmap`.
You have to enable live tool injection before you can use it.
Steps 1 & 2 enable live tool injection.
> Note: Steps 1 & 2 have to be done before you get live injection of tools.
  When you do steps 1 & 2 a new deploy will happen causing your pods to restart.

1. Create `configmap` source.

    The first step is to create the source for your debug tools. We recommend creating a new repo for this purpose.
    [Click here for an example repo setup](../../examples/core-paas-debug-tools)
    The repo should contain a `Dockerfile` with the base image you want to create the tools from and a helm charts that only create a `configmap`.

    Make sure to deploy these to all envs before continuing (pods will not start if this does not exist)

    > NOTE: A single `configmap` has a max size of `1mb`. You can create a new `configmap` per tool if needed. If you need a single binary that is larger then 1mb install tools that will allow you to retrieve it from an external location (like curl or aws s3)

2. Modify your services deployment helm chart

    After we have created the source `configmap` we need to add it to our deployment helm chart.
    Add the following lines to mount the files.
    Use the same `name` from the step above.
    * Add `volumeMounts` under keypath `spec.template.spec.containers`
    * Add `volumes` under keypath `spec.template.spec.volumes`

    Example in `deployment.yaml`:
    ```
    Kind: Deployment
    ...
    spec:
      ...
      template:
        ...
        spec:
          ...
          containers:
            ...
            volumeMounts:
            ...
            - mountPath: /etc/debug-tools
              name: ubuntu-config-map
          ...
          volumes:
          ...
          - configMap:
              defaultMode: 511
              name: ubuntu-config-map
    ```
    > NOTE: If your pods get stuck in creating when you deploy ensure you have deployed the `configmap` from the first step and you are using the same `name`. `kubectl --namespace <your namespace> get configmaps` will list the current deployed `configmaps`

3. Using tools

    Once you deploy with the above changes you are ready to use your tools. They will appear inside your container at the `mountPath` we defined above. `/etc/debug-tools` in this example.
    ```
    kubectl exec -it pod sh
    > /etc/debug-tools ls
    /home /etc ...
    > /etc/debug-tools curl
    ...
    ```

    > NOTE: Anytime you update the `configmap` the files will be updated automatically within 1 minute in all pods without restarting them.

# Destructive tool injection

If you require more then just binaries or file to enter debug mode (Debug flags for example) you can also do a destructive restart. This would be a new deployment. There are 2 ways off adding this functionality.

## Single debug pod deployment

If you want only 1 debug pod and not make all pods in your deployment in debug mode you can make a conditional deployment resource. In your helm chart you would copy your `deployment.yaml` and create a new file `debug-deployment.yaml`.

Modify the new file with the following:
* Wrap deployment in a `debugEnable` key (which you would set in `kilonova`)
* Add debug flags if required
* Set `replica count` to 1 (or the number you want)
* Update to use a debug image if required

Example of `debugEnable` flag setting in your `debug-deployment.yaml`
```
{{- if .Values.debugEnable -}}
Kind: Deployment
...
{{- end -}}
```
When `debugEnable` is set to `true` in `values.yaml` or in `kilonova` this container will be deployed

## All pods debug mode

If you want all your pods to enter debug mode then you can edit your `deployment.yaml` directly with a conditional around what you want to modify.

Example of typical debug conditionals:

```
Kind: Deployment
...
      containers:
        {{- if .Values.debugEnable -}}
        image: <your_debug_image>
        {{- else -}}
        image: "{{- template "base.image.name" . -}}"
        {{- end -}}
        ...
        envs:
        {{- if .Values.debugEnable -}}
        DEBUG: enable
        {{- end -}}
        ...
        args:
        {{- if .Values.debugEnable -}}
        --debug
        {{- end -}}
        --xMem:val
        ...
```

> NOTE: `your_debug_image` Would be replaced with a debug docker image of your service

When `debugEnable` is set to `true` in `values.yaml` or in `kilonova` the debug values will be added to each pod.
