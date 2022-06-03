# Jenkins Functions
Looking to get onto kubernetes but switching to [Valkyr](https://github.com/mulesoft/valkyr) is too much of a risk? This is the way for you then!

# Who should use
You should use this method only if you meet any of the following criteria.
* Valkyr does not support your use case.
* You already know how to build Docker images.
* You already have a testing framework in place.

# Functions
The following functions are used to publish your artifacts to Core PaaS.
* [ImagePublish](#imagepublish). Used to publish a docker image artifact.
* [HelmPublish](#helmpublish). Used to publish a helm chart artifact.
* [Publish](#publish). A helper function that publishes all Core PaaS artifacts. Calls both functions above.

All the methods have the same arguments `(product, component, version)`:

* `product` Should be the name of your product. core-paas, mozart, exchange are a few examples. Typically this matches the first part of your repo name.
* `component` Should be the name of your app that is built. Typically this is your repo name without `product`.
* `version` Should be the semvar version of your build.

## ImagePublish
This method pushes a docker which you have built to the Core PaaS registries.
```
corePaasImagePublish("core-paas", "healthz", "v0.0.0")
```

**Note: The image must exist with that tag in the current docker context.**

## HelmPublish
This method builds and pushes your helm chart to to Core PaaS registry.
```
corePaasHelmPublish("core-paas", "healthz", "v0.0.0")
```

**Note: Helm charts must exist in the `./helm/<product>-<component>` folder.**

## Publish
This is a helper method which calls both [`ImagePublish`](#imagepublish) and [`HelmPublish`](#helmpublish).
```
corePaasPublish("core-paas", "healthz", "v0.0.0")
```
