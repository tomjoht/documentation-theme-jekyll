---
title: Pushing builds to server
tags: [publishing]
keywords: AWS, Amazon, command line, pushing build
last_updated: November 30, 2015
summary: "You can push your build to AWS using commands from the command line. By including your copy commands in commands, you can package all of the build and deploy process into executable scripts."
---


## Pushing to AWS S3

If you have the AWS Command Line Interface installed and are pushing your builds to AWS, the following commands show how you can build and push to an AWS location from the command line:

```
#aws s3 cp ~/users/tjohnson/projects/documentation-theme-jekyll-builds/mydoc_writers s3://[aws path]documentation-theme-jekyll/mydoc_writers --recursive

#aws s3 cp ~/users/tjohnson/projects/documentation-theme-jekyll-builds/mydoc_designers s3://[aws path]/documentation-theme-jekyll/mydoc_designers --recursive
```

The first path is the local location; the second path is the destination.

## Pushing to a regular server

If you're pushing to a regular server that you can ssh into, you can use `scp` commands to push your build. Here's an example:

```
scp -r /users/tjohnson/projects/documentation-theme-jekyll-builds/mydoc_writers name@domain:/var/www/html/documentation-theme-jekyll/mydoc_writers
```

Similar to the above, the first path is the local location; the second path is the destination.


