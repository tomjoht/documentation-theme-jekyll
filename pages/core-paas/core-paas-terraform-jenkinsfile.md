# Jenkinsfile for `K*` envs Terraform deployments

Here is an example of a `Jenkinsfile` required to create infrastructure within the Kuberenetes AWS environments
```
#!groovy

import groovy.transform.Field

// define all of the Jenkins hosts that we currently use
@Field def buildJenkins = 'https://jenkins.build.msap.io/'
@Field def devJenkins = 'https://jenkins.dev.build.msap.io/'
@Field def govJenkins = 'https://jenkins.build.gov.msap.io/'
@Field def supportedEnvs = []
@Field def supportedRegions = []
@Field def automaticEnvs = []
@Field def automaticRegions = []

deployBranch = "master"

// define the k8s environments that we currently deploy to
switch (env.JENKINS_URL) {
  case buildJenkins:
    supportedEnvs = ['cpdev','kdev','kqa','kstg','kprod','kprod-eu']
    supportedRegions = ['us-east-1','eu-central-1','us-west-1']
    automaticEnvs = ['kdev']
    automaticRegions = ['us-east-1']
    break
  case govJenkins:
    supportedEnvs = ['kgstg','kgprod']
    supportedRegions = ['us-gov-west-1']
    automaticEnvs = ['kgstg']
    automaticRegions = ['us-gov-west-1']
    break
  default:
    error "unknown jenkins url ${env.JENKINS_URL}"
    break
}

// define parameters to be passed to the job
properties([
  parameters([
    choice(choices: '\n' + supportedEnvs.join('\n'), description: 'Target environment (blank for all)', name: 'Environment'),
    choice(choices: '\n' + supportedRegions.join('\n'), description: 'Target region (blank for all)', name: 'Region'),
    booleanParam(defaultValue: false, description: 'Destroy?', name: 'Destroy')
  ]),
  pipelineTriggers([])
])

deployEnvs = env.Environment ? [env.Environment] : automaticEnvs
deployRegion = env.Region ? [env.Region] : automaticRegions
destroy = env.Destroy == 'true'

// deploy to environments
if (env.BRANCH_NAME == deployBranch) {
  for (deploy_env in supportedEnvs) {
    if (deployEnvs.contains(deploy_env)) {
      for (deploy_region in deployRegion) {
        terraformDeploy(
          environment  : deploy_env,
          account      : deploy_env,
          region       : deploy_region,
          terraform_version : '0.12.29',
          // depend on our core terraform that creates our networking and encryption keys
          dependencies : ["tf-k8s-core"],
          // your environment specific profiles will need to be located in `profiles/`. e.g `profiles/kdev.tfvars`
          var_files    : ["profiles/${deploy_env}.tfvars"],
          destroy      : destroy
        )
      }
    } else {
      stage (deploy_env) {
        echo "Skipping ${deploy_env}"
      }
    }
  }
}
```
