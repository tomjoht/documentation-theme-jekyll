# Helm
[Helm](https://helm.sh/) is the best way to find, share, and use software built for Kubernetes.
We use it as a templating engine and as the application installer.

# Setup
## Helm Files

Once you will have containerized your application after following the [Dockerfile](../getting-started/dockerfile.md) instructions,
you will have to create Kubernetes-native manifests so that Kubernetes is able to work with your newly created docker container.

Helm allows you to create templatized versions of these Kubernetes manifests, thus providing an extensible and
configurable way of managing these Kubernetes manifests.

Follow the [quickstart steps](https://helm.sh/docs/chart_template_guide/) to learn how these are
manifests are created. Helper templates containing these templatized Kubernetes manifest files can be found
[here](https://github.com/mulesoft/core-paas-base#base-the-helm-helper-chart).

### Generated files
When builds run, helm will download the core-paas-base chart and other requirements you could have. In order to avoid this files to appear as changes in your builds, you will need to add this to your `.gitignore`:

```
# Helm
**/requirements.lock
**/charts
```

### .helmignore

To avoid adding undesired files to your helm charts, `.helmignore` will tell helm to not include the files matching the patterns defined here. For example:

```
# Patterns to ignore when building packages.
# This supports shell glob matching, relative path matching, and
# negation (prefixed with !). Only one pattern per line.
.DS_Store
# Common VCS dirs
.git/
.gitignore
.bzr/
.bzrignore
.hg/
.hgignore
.svn/
# Common backup files
*.swp
*.bak
*.tmp
*~
# Various IDEs
.project
.idea/
*.tmproj
# Local values
*/*/values-local.yaml
*/*/values-dev.yaml
*/*/dev-values.yaml
```

## Environment Configuration
Configuration in Kubernetes is done via environment variables.
All values (secret or not) should be read via environment variables, __NOT__ files or external endpoints.
The advantage of configuring applications this way is that it makes it easy to deploy across many environments in a well-defined manner and all languages support reading environment variables.

For all languages, it is recommended to have a single file which contains all the configuration keys (sourced from environment variables).
This way, one configuration file can just differ in values per env.
This helps reduce copy-pasting entire configuration values files per env.

**Environment variables should `NOT` contain an object. Do not do this.**
```bash
BAD_ENVIRONMENT_VARIABLE={'dont': 'do this', or: 'this'}
```

**Instead, reference them as different keys and shape them in your configuration file.**

### Node.js
For Node projects, we recommend using the NPM package [@mulesoft/external-property](https://github.com/mulesoft/external-property).

[Click here for a real example](https://github.com/mulesoft/authentication-server/blob/master/api/config/default.js#L27).

### Java
For Java projects, we recommend creating a file called `override.properties` and adding it to your run command. Example:
```properties
poller.frequency=${POLLER_FREQUENCY}
messagequeue.path=jdbc:postgresql://${PLATFORM_MESSAGES_DB_HOST}:80/path
```
[Click here for a real example](https://github.com/mulesoft/anypoint/blob/develop/resources/kubernetes/arm/overrides/mule-message-processor/override.properties).

### Others
For other projects, we recommend following the same pattern as above. Create a single file or module that reads environment variables and sets a configuration key.

**Secrets should only be defined in [kilonova-envs-config](https://github.com/mulesoft/kilonova-envs-config/).**

## Pod Resource Configuration
It is mandatory to define the resource `limits` and `requests` for your application. We make this mandatory to improve cluster health and so that we can ensure we have enough servers for all of Mulesoft.
[How to set resource values](https://github.com/mulesoft/core-paas-base#baseresourceslimits).

## Health Configuration
Kubernetes requires health checks to ensure that your kubernetes cluster routes traffic to the healthy pods and kills the bad ones.
[How to set health values](https://github.com/mulesoft/core-paas-base#basehealth).

## Helm Tests
Helm chart tests are required to validate your applications after deploy. Valkyr already provides
support for running these helm tests once the Chart is deployed successfully. More information on creating helm tests can
be found [here](https://v2.helm.sh/docs/chart_tests/).

NOTE: When defining helm tests in your chart, you must use `base.labels.mulesoft.test` instead of `base.labels.mulesoft`
when defining labels for helm test resources. This prevents the helm test pods from potentially receiving traffic from your main services.
For more info, go [here](https://github.com/mulesoft/core-paas-base#baselabelsmulesofttest).
