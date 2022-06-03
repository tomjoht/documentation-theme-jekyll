# CDN Static Assets

## Quickstart

The deploy pipeline can be configured to upload static assets to the AnyPoint CDN.

To enable, add `staticAsset: true` to `valkyr.yaml`:
```yaml
# valkyr.yaml
...
requires:
  staticAsset: true
  deployment: true # also required, even for static-asset only repos

staticAssetMimeMap: # definition for every filetype in /dist/static folder
  .css:   text/css
  .html:  text/html
  .gif:   image/gif
  .js:    application/javascript
  .json:  application/json
```

Any files in the `/dist/static/` of the Dockerfile image will be synced during deployment.

The files will be available via CloudFront:
```
https://cdn-$ENV.anypoint.mulesoft.com/artifacts/$PRODUCT-$COMPONENT-$ASSET/$FILENAME
```

Or directly from the S3 bucket:
```
https://cdn-anypoint-$ENV.s3.amazonaws.com/artifacts/$PRODUCT-$COMPONENT-$ASSET/$FILENAME
```

View an [example CDN project](http://github.com/mulesoft/deploy-cdn-bootstrap-ui) repo.



## Introduction

### What's CDN?



>**Content delivery network** or **Content distribution network** is a geographically distributed network of [proxy servers](https://en.wikipedia.org/wiki/Proxy_server) and their [data centers](https://en.wikipedia.org/wiki/Data_center). The goal is to provide high availability and performance by distributing the service spatially relative to [end users](https://en.wikipedia.org/wiki/End_user).

>Since then, CDNs have grown to serve a large portion of the Internet content today, including web objects (text, graphics and scripts), downloadable objects (media files, software, documents), applications ([e-commerce](https://en.wikipedia.org/wiki/E-commerce), [portals](https://en.wikipedia.org/wiki/Web_portal)), [live streaming](https://en.wikipedia.org/wiki/Live_streaming) media, on-demand streaming media, and [social media](https://en.wikipedia.org/wiki/Social_media) sites.

From the Mulesoft standpoint, the CDN is used to serve static assets (js/html) from distributed servers close to the end-users.


### What use cases does CDN solve for my service?

If your service is serving static assets, such as (but not limited to): HTML, Javascript, images, PDFs etc. then you may benefit from enabling CDN usage for your service.
Using the CDN will lighten the load on your services while enhancing end-user experience with lower response time.


## Technical details


### What technologies are we using for CDN?

Content is hosted in [AWS S3](https://aws.amazon.com/s3/) buckets, served by an [AWS CloudFront](https://aws.amazon.com/cloudfront/) distribution.


#### What are the S3 bucket names?

`cdn-anypoint-$ENV`
where $ENV is one of:

* devx
* qax
* stgx
* prod
* prod-eu
* gstg
* gprod

Example: `s3://cdn-anypoint-prod`


#### What are the S3 paths used for content?

* artifacts
    * $PRODUCT-$COMPONENT-$ASSET

Example: `s3://cdn-anypoint-prod/artifacts/dev-doc-nginx-beta`


#### How are S3 buckets and Cloudfront distributions deployed?

- [S3 Terraform](https://github.com/mulesoft-ops/tf-static-content-buckets/blob/master/s3.tf)
- [Cloudfront Terraform](https://github.com/mulesoft-ops/tf-static-content-buckets/blob/master/cf.tf)


#### How are Cloudfront distributions named?

| env | name      | alias |
| ----------- | ----------- | ----------- |
| prod      | cdn-anypoint-prod.s3.amazonaws.com       | cdn.anypoint.mulesoft.com |
| any other   | cdn-anypoint-$ENV.s3.amazonaws.com | cdn-$ENV.anypoint.mulesoft.com |

## Onboarding

### What are the requirements to onboard to CDN?

#### 1. Onboarded to core-paas

The service must be making use of the `core-paas` platform with a valid `valkyr.yaml` present at the root of its repository.


#### 2. Static assets present in the right folder.

The resulting `container` image being created through the build pipeline, must have all its static assets present under the `/dist/` folder.
Be aware that this folder MUST be at the **root of the container filesystem**.

**Valid**:

* /dist/static/index.html
    * Example Dockerfile: `COPY static/index.html /dist/static/index.html`

**Invalid**:

* $WORK_DIR/dist/static/index.html
    * Example Dockerfile `COPY static/index.html dist/static/index.html`



#### 3. Feature enabled in `valkyr.yaml`



```
...
requires:
    staticAsset: true
```



## CDN Pipeline in detail


![Pipeline Overview](../images/cdn-overview.png)  

### Build pipeline flow

#### 1. Valkyr determines if static assets upload required

##### Requirement: Opt-in to static assets

[valkyr.yaml at root of repository](https://github.com/mulesoft/dev-docs-nginx-beta/blob/master/valkyr.yaml#L53)

```
requires:
    staticAsset: true
```

##### Requirement: Place assets in docker image

Assets will be picked up from the `/dist/static/` folder in the resulting Docker image.


#### 2. Valkyr archives static assets into a tarball


Workflow in [Makefile](https://github.com/mulesoft/valkyr/blob/master/strategies/default/Makefile#L260)
Valkyr calls `make publish-nexus` - This spawns a few commands described below.
![CDN Deploy Job](../images/cdn-deploy-job.png)  


##### 1. copy-from-image.sh

[copy-from-images.sh](https://github.com/mulesoft/valkyr/blob/master/strategies/default/copy-from-image.sh) with arguments (source, from docker image) /dist/ , (destination, on Jenkins build node) ./dist
At this point, a ./dist folder exists on the Jenkins build node with the content of $DOCKER_IMG:/dist/


##### 2. tar czf

```
tar -czf ./$(ARTIFACT_PATH) -C dist .
```

Where `$ARTIFACT_PATH` equals `$FULLNAME-$TAG.tar`
Example:


```
tar -czf ./dev-docs-nginx-beta-v1.0.607.tar -C dist .
```



```
**11:01:20**  + make publish-nexus --makefile /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master@2/strategies/docker/Makefile STRATEGY_VERSION=6 RUN_TEST_IMAGE=
**11:01:20**  /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master@2/strategies/docker//../default//copy-from-image.sh mulesoft/dev-docs-nginx-beta:v1.0.607 /dist/. ./dist

**11:01:20**  + docker create --cidfile containerid mulesoft/dev-docs-nginx-beta:v1.0.607[...]
**11:01:20**  + docker cp [...]:/dist/. ./dist
**11:02:17**  + docker rm [...]
**11:02:17**  tar -czf ./dev-docs-nginx-beta-v1.0.607.tar -C dist .
```



##### 3. Upload to Nexus



```
curl --retry 5 --retry-connrefused -sSf -u $(NEXUS_USER):$(NEXUS_PASS) \
--upload-file ./$(FULLNAME)-$(TAG_VERSION).tar \${NEXUS_REPOSITORY}/content/repositories/artifacts/com/mulesoft/$(FULLNAME)/$(TAG_VERSION)/$(ARTIFACT_PATH)
```

Example:


```
curl --retry 5 --retry-connrefused -sSf -u ****:**** \
--upload-file ./dev-docs-nginx-beta-v1.0.607.tar \
https://nexus.build.msap.io/nexus/content/repositories/artifacts/com/mulesoft/dev-docs-nginx-beta/v1.0.607/dev-docs-nginx-beta-v1.0.607.tar
```



#### 3. Valkyr produces final manifest with link to tarball

Each component of the deployment (helm, nexus etc..) results in a dedicated manifest [created by this piece of code](https://github.com/mulesoft/valkyr/blob/e6f3e1b7f532cb664ec2ad68f0ed10b92b9f985b/utils.groovy#L179).
At the end of the build process, all manifests [are merged together](https://github.com/mulesoft/valkyr/blob/02dc670cc9bd02ddb10957ed017d12c22d943efd/stages.groovy#L418) and [archived on Jenkins first](https://github.com/mulesoft/valkyr/blob/02dc670cc9bd02ddb10957ed017d12c22d943efd/stages.groovy#L426) then [committed](https://github.com/mulesoft/valkyr/blob/f5bd71bca8a8f2ad72ce229e455d15e4c21615cc/strategies/manifest/Makefile#L28) to a Git repository called [mulesoft/maelstrom-artifacts](https://github.com/mulesoft/maelstrom-artifacts)


##### Example successful run



```
**09:58:51**  Found manifests: [https:--nexus.build.msap.io-nexus-?artifact=dev-docs-nginx-beta&ext=tar&group=com.mulesoft&repo=artifacts-v1.0.606.nexus, artifacts.msap.io-mulesoft-dev-docs-nginx-beta-v1.0.606.docker, dev-docs-nginx-beta-v1.0.606.helm] [Pipeline] echo[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) **09:58:51**  Processing artifact manifest https:--nexus.build.msap.io-nexus-?artifact=dev-docs-nginx-beta&ext=tar&group=com.mulesoft&repo=artifacts-v1.0.606.nexus [Pipeline] readYaml[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) [Pipeline] echo[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) **09:58:51**  Processing artifact manifest artifacts.msap.io-mulesoft-dev-docs-nginx-beta-v1.0.606.docker [Pipeline] readYaml[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) [Pipeline] echo[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) **09:58:51**  Processing artifact manifest dev-docs-nginx-beta-v1.0.606.helm [Pipeline] readYaml[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) [Pipeline] } [Pipeline] // dir [Pipeline] writeYaml[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) [Pipeline] readFile[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) [Pipeline] echo[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) **09:58:51**  This is the manifest I built! [Pipeline] echo[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) **09:58:51**  ################################################################################ [Pipeline] echo[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) **09:58:51**  dev-docs:
**09:58:51**    dev-docs-nginx-beta:
**09:58:51**    - type: docker
**09:58:51**      name: artifacts.msap.io/mulesoft/dev-docs-nginx-beta
**09:58:51**      version: 1.0.606
**09:58:51**      tag: v1.0.606
**09:58:51**      digest: sha256:fad1e4cddb3aa419f84702d0bf35a26142a213b0a6e9b3e17909aa7a488bd767
**09:58:51**    - type: helm
**09:58:51**      name: dev-docs-nginx-beta
**09:58:51**      version: 1.0.606
**09:58:51**      tag: 1.0.606
**09:58:51**      digest: sha512:a7fbd495906de22c90ad4b28711b26a518b4b7d1b8cfcdc3fd72d2154892fe9b0dd7102538ef7802b09b49de9379ff27d85e8246fbf7a3a74fce7bbfcd56ee97
**09:58:51**    - type: nexus
**09:58:51**      name: [https://nexus.build.msap.io/nexus/?artifact=dev-docs-nginx-beta&ext=tar&group=com.mulesoft&repo=artifacts](https://nexus.build.msap.io/nexus/?artifact=dev-docs-nginx-beta&ext=tar&group=com.mulesoft&repo=artifacts)
**09:58:51**      version: 1.0.606
**09:58:51**      tag: v1.0.606
**09:58:51**      digest: 598625f731dc8950ad9bb90c72fedae46eb8687c
**09:58:51** [Pipeline] echo[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) **09:58:51**  ################################################################################ [Pipeline] archiveArtifacts[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) **09:58:51**  Archiving artifacts
**09:58:51**  Recording fingerprints [Pipeline] withCredentials[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) **09:58:51**  Masking supported pattern matches of $PRIVATE_KEY_BASE64 [Pipeline] {[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) [Pipeline] sh (runTask: publish for strategy manifest:)[](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/consoleFull#) **09:58:52**  + make publish --makefile /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/strategies/manifest/Makefile STRATEGY_VERSION= RUN_TEST_IMAGE=
**09:58:52**  /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/strategies/manifest/Makefile:60: warning: overriding recipe for target 'tag'
**09:58:52**  /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/strategies/manifest//../default/Makefile:304: warning: ignoring old recipe for target 'tag'
**09:58:52**  Publishing manifest for dev-docs-nginx-beta to github.com/mulesoft/maelstrom-artifacts/artifacts/dev-docs/dev-docs-nginx-beta/master.yaml
**09:58:52**  rm -rf /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/platform-repo
**09:58:52**  git clone  [https://****:****@github.com/mulesoft/maelstrom-artifacts.git](https://****:****@github.com/mulesoft/maelstrom-artifacts.git) /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/platform-repo
**09:58:52**  Cloning into '/var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/platform-repo'...
**09:59:18**  git -C /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/platform-repo checkout master
**09:59:18**  Already on 'master'
**09:59:18**  Your branch is up to date with 'origin/master'.
**09:59:18**  mkdir -p /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/platform-repo/artifacts/dev-docs/dev-docs-nginx-beta
**09:59:18**  mv /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/valkyr-manifest.yaml "/var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/platform-repo/artifacts/dev-docs/dev-docs-nginx-beta/master.yaml"
**09:59:18**  git -C /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/platform-repo add "artifacts/dev-docs/dev-docs-nginx-beta/master.yaml"
**09:59:18**  echo   'Manifest dev-docs-nginx-beta 1.0.606'      > /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/commit.tmp
**09:59:18**  echo                                         >> /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/commit.tmp
**09:59:18**  echo   'ASSET_NAME="dev-docs-nginx-beta"'            >> /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/commit.tmp
**09:59:18**  echo   'ASSET_VERSION="1.0.606"'          >> /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/commit.tmp
**09:59:18**  echo   'ASSET_BRANCH="master"'      >> /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/commit.tmp
**09:59:18**  echo   'VALKYR_VERSION="v0.3.584"'  >> /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/commit.tmp
**09:59:18**  echo   'JENKINS_BUILD="[https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/)"'        >> /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/commit.tmp
**09:59:18**  # This commit will be empty if the artifacts are exactly the same as the
**09:59:18**  # previous build. This is unlikely, but possible, and doesn't actually
**09:59:18**  # necessarily mean anything is wrong. We record it anyway so we have a
**09:59:18**  # record of the build.
**09:59:18**  docker run --rm --init --user 1000:1000 -t -v /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master:/usr/src/work -v /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/platform-repo:/usr/src/app -w /usr/src/app -e HOME="/usr/src/work" -e GIT_AUTHOR_NAME="Valkyr" -e GIT_AUTHOR_EMAIL="valkyr@mulesoft.com" -e GIT_COMMITTER_NAME="Valkyr" -e GIT_COMMITTER_EMAIL="valkyr@mulesoft.com" artifacts.msap.io/mulesoft/core-paas-base-image-infra-deploy:v4.0.100@sha256:faf3ff5628449ee67e2d85312ee4426c6576e461f7e641d60f7316c4edc8de5c /bin/bash -c 'echo **** | base64 --decode | gpg --import && git commit --gpg-sign=6F90E1F7D2E080D6 --allow-empty -F /usr/src/work/commit.tmp'
**09:59:18**  gpg: directory '/usr/src/work/.gnupg' created
**09:59:18**  gpg: keybox '/usr/src/work/.gnupg/pubring.kbx' created
**09:59:18**  gpg: /usr/src/work/.gnupg/trustdb.gpg: trustdb created
**09:59:18**  gpg: key 6F90E1F7D2E080D6: public key "Valkyr Bot <valkyr@mulesoft.com>" imported
**09:59:18**  gpg: key 6F90E1F7D2E080D6: secret key imported
**09:59:18**  gpg: Total number processed: 1
**09:59:18**  gpg:               imported: 1
**09:59:18**  gpg:       secret keys read: 1
**09:59:18**  gpg:   secret keys imported: 1
**09:59:18**  [master 02833688bdd] Manifest dev-docs-nginx-beta 1.0.606
**09:59:18**   1 file changed, 9 insertions(+), 9 deletions(-)
**09:59:18**  rm -f /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/commit.tmp
**09:59:18**  /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/strategies/manifest//push.sh "/var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/platform-repo" "docker run --rm --init --user 1000:1000 -t -v /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master:/usr/src/work -v /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/platform-repo:/usr/src/app -w /usr/src/app -e HOME="/usr/src/work" -e GIT_AUTHOR_NAME="Valkyr" -e GIT_AUTHOR_EMAIL="valkyr@mulesoft.com" -e GIT_COMMITTER_NAME="Valkyr" -e GIT_COMMITTER_EMAIL="valkyr@mulesoft.com" artifacts.msap.io/mulesoft/core-paas-base-image-infra-deploy:v4.0.100@sha256:faf3ff5628449ee67e2d85312ee4426c6576e461f7e641d60f7316c4edc8de5c /bin/bash -c 'echo **** | base64 --decode | gpg --import && git pull  --gpg-sign=6F90E1F7D2E080D6 --rebase=false --no-edit -X ours -q [https://****:****@github.com/mulesoft/maelstrom-artifacts.git](https://****:****@github.com/mulesoft/maelstrom-artifacts.git) master'" "" "[https://****:****@github.com/mulesoft/maelstrom-artifacts.git](https://****:****@github.com/mulesoft/maelstrom-artifacts.git)" "master"
**09:59:18**  /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/strategies/manifest//push.sh: line 12: git -C /var/lib/jenkins/workspace/e-new_dev-docs-nginx-beta_master/platform-repo rev-parse HEAD: No such file or directory
**09:59:18**  fatal: ambiguous argument '': unknown revision or path not in the working tree.
**09:59:18**  Use '--' to separate paths from revisions, like this:
**09:59:18**  'git <command> [<revision>...] -- [<file>...]'
**09:59:18**  gpg: key 6F90E1F7D2E080D6: "Valkyr Bot <valkyr@mulesoft.com>" not changed
**09:59:18**  gpg: key 6F90E1F7D2E080D6: secret key imported
**09:59:18**  gpg: Total number processed: 1
**09:59:18**  gpg:              unchanged: 1
**09:59:18**  gpg:       secret keys read: 1
**09:59:18**  gpg:  secret keys unchanged: 1
**09:59:20**  To [https://github.com/mulesoft/maelstrom-artifacts.git](https://github.com/mulesoft/maelstrom-artifacts.git)
**09:59:20**     f4675a76c42..02833688bdd  master -> master
```



##### Example valkyr-manifest.yaml

[valkyr-manifest.yaml](https://jenkins.build.msap.io/job/application/job/Developer%20Documents/job/docs-site-new/job/dev-docs-nginx-beta/job/master/612/artifact/valkyr-manifest.yaml)


```
dev-docs:
 dev-docs-nginx-beta:
  - type: docker
    name: artifacts.msap.io/mulesoft/dev-docs-nginx-beta
    version: 1.0.606
    tag: v1.0.606
    digest: sha256:fad1e4cddb3aa419f84702d0bf35a26142a213b0a6e9b3e17909aa7a488bd767
  - type: helm
    name: dev-docs-nginx-beta
    version: 1.0.606
    tag: 1.0.606
    digest: sha512:a7fbd495906de22c90ad4b28711b26a518b4b7d1b8cfcdc3fd72d2154892fe9b0dd7102538ef7802b09b49de9379ff27d85e8246fbf7a3a74fce7bbfcd56ee97
  - type: nexus
    name: https://nexus.build.msap.io/nexus/?artifact=dev-docs-nginx-beta**&ext=tar&group=com.mulesoft&repo=artifacts**version: 1.0.606
    tag: v1.0.606
    digest: 598625f731dc8950ad9bb90c72fedae46eb8687c
```

For reference, this is what the artifact looks like on Nexus at this point.
![Nexus Artifact](../images/cdn-nexus.png)
#### 4. Valkyr triggers Kilonova-product pipeline

![CDN Pipeline](../images/cdn-pipeline.png)
### Deploy pipeline flow

Example pipeline: https://jenkins.build.msap.io/job/core-paas/job/deploy/job/master/215632/


#### 1. Kilonova feeds cpc the manifest & cpc creates a new manifest

![CDN Deploy Job](../images/cdn-deploy-job-manifest.png)
```
./cpc manifest generate -o 'manifest.yaml' ./code/common/config-spec.yaml ./code/versioned-tmp-spec.yaml
```

```
 ./cpc manifest generate -o manifest.yaml ./code/common/config-spec.yaml ./code/versioned-tmp-spec.yaml 

 startup                                  version=v10.1.3 

 processing spec                          service-count=2 

 multi-list                               count=2 opts="{PullOptions:{Directory: SkipDigest:false SkipPull:false Cache:TreeCache[manifest.cache]} Limit:1 Order:version-descending LogInterval:0s}" 

 multi-list status                        total=2 remain=2 detail="[GitCommit{[https://github.com/mulesoft/kilonova-envs-config/master](https://github.com/mulesoft/kilonova-envs-config/master)} Microservice{dev-docs/nginx-beta: GitTag{[https://github.com/mulesoft/dev-docs-nginx-beta/<all-branches>](https://github.com/mulesoft/dev-docs-nginx-beta/<all-branches>), map[pattern:v1.0.606]}}]" 

 docker registry override                 parent-req="Microservice{dev-docs/nginx-beta: GitTag{[https://github.com/mulesoft/dev-docs-nginx-beta/<all-branches>](https://github.com/mulesoft/dev-docs-nginx-beta/<all-branches>), map[pattern:v1.0.606]}}" regs=[artifacts.msap.io] 

 multi-list status                        total=2 remain=0 detail=[] 

multi-list done 

marshaling 

writing manifest                         dst=manifest.yaml
```

Resulting manifest.yaml


```
dev-docs:
  dev-docs-nginx-beta:
  - artifactName: microservice-0
    digest: sha256:fad1e4cddb3aa419f84702d0bf35a26142a213b0a6e9b3e17909aa7a488bd767
    name: artifacts.msap.io/mulesoft/dev-docs-nginx-beta
    tag: v1.0.606
    type: docker
    version: 1.0.606
  - artifactName: microservice-1
    digest: d4de5957bb05e9bbb39fa454157a851ea15f9a0b
    name: https://github.com/mulesoft/dev-docs-nginx-beta
    tag: v1.0.606
    type: git
    version: 1.0.606
  - artifactName: microservice-2
    digest: sha512:a7fbd495906de22c90ad4b28711b26a518b4b7d1b8cfcdc3fd72d2154892fe9b0dd7102538ef7802b09b49de9379ff27d85e8246fbf7a3a74fce7bbfcd56ee97
    name: s3://mulesoft-ci-helm-chart-repository/stable/dev-docs/dev-docs-nginx-beta?region=us-west-2
    tag: 1.0.606
    type: helm
    version: 1.0.606
  - artifactName: microservice-3
    digest: 598625f731dc8950ad9bb90c72fedae46eb8687c
    name: https://nexus.build.msap.io/nexus/?artifact=dev-docs-nginx-beta&ext=tar&group=com.mulesoft&repo=artifacts
    tag: v1.0.606
    type: nexus
    version: 1.0.606
global:
  global:
  - artifactName: config
    digest: 302140ba33d889d2141d1115ac9ca7677ced580e
    name: https://github.com/mulesoft/kilonova-envs-config
    tag: 302140ba33d889d2141d1115ac9ca7677ced580e
    type: git
    version: 0.0.0-commit.0+302140ba33d889d2141d1115ac9ca7677ced580e
```



#### 2. cpc pulls all artifacts (incl. Nexus)

![CDN Deploy Job](../images/cdn-deploy-job-fetch.png)
```
./cpc manifest pull -f 'type!=docker' manifest.yaml -o table:service,type,name,tag | sort

[...]

multi-pull status                        total=4 remain=1 detail="[[Nexus{[https://nexus.build.msap.io/nexus/artifacts/com.mulesoft/dev-docs-nginx-beta-v1.0.606.tar](https://nexus.build.msap.io/nexus/artifacts/com.mulesoft/dev-docs-nginx-beta-v1.0.606.tar)} from dev-docs-nginx-beta/microservice-3]]"

multi-pull done

dev-docs-nginx-beta    nexus    [https://nexus.build.msap.io/nexus/?artifact=dev-docs-nginx-beta&ext=tar&group=com.mulesoft&repo=artifacts](https://nexus.build.msap.io/nexus/?artifact=dev-docs-nginx-beta&ext=tar&group=com.mulesoft&repo=artifacts)    v1.0.606
```



#### 3. cpc prepares files metadata & uploads to S3

![CDN Deploy Job](../images/cdn-deploy-job-deploy.png)

This is part of the `cpc manifest deploy` workflow, there is no CDN-specific command.


##### (Plan prepare phase) tarball loading

cpc [loads the (previously downloaded) tarball in memory](https://github.com/mulesoft/core-paas-client/blob/master/deploy/static.go#L41), iterates through all files and creates a map describing the files to be uploaded.


```
staticFiles[remoteName] = staticFile{  
 key:  remoteName,  
 data: fileData,// note the extra quotes, this is how aws returns it.  
 etag: fmt.Sprintf(`"%x"`, md5.Sum(fileData)),}
```



##### (Plan prepare phase) remote (S3) objects check

cpc [retrieves (HEAD) metadata](https://github.com/mulesoft/core-paas-client/blob/master/deploy/static.go#L124) for S3 objects in the bucket, using the name of the files retrieved from the local tarball


##### (Plan prepare phase) check if upload required

[cpc compares local files (tarball) metadata against remote files (S3) metadata](https://github.com/mulesoft/core-paas-client/blob/master/deploy/static.go#L142), mainly comparing MD5 (etag). If MD5 matches, the file is not considered for further processing.
If file is new or modified, a new instance of S3Object is created and added to a waiting list.


##### (Plan apply phase) Upload of files

(This step happens right before the new Helm Chart version is deployed)
[cpc uses the AWS SDK S3 client to upload files](https://github.com/mulesoft/core-paas-client/blob/master/deploy/plan.go#L1115) previously added to the list
