---
title: Pushing builds to server
tags: [publishing]
keywords: AWS, Amazon, command line, pushing build
summary: "You can push your build to AWS using commands from the command line."
---
{% include linkrefs.html %} 

## Pushing to AWS S3

If you have the AWS Command Line Interface installed and are pushing your builds to AWS, the following commands show how you can build and push to an AWS location from the command line:

```
#aws s3 cp ~/users/tjohnson/projects/documentation-theme-jekyll-builds/writer s3://[aws path]documentation-theme-jekyll/writer --recursive

#aws s3 cp ~/users/tjohnson/projects/documentation-theme-jekyll-builds/designer s3://[aws path]/documentation-theme-jekyll/designer --recursive
```

## Pushing to a regular server

If you're pushing to a regular server that you can ssh into, you can use `scp` commands to push your build. Here's an example:

```
scp -r /Applications/XAMPP/xamppfiles/htdocs/documentation-theme-jekyll/writers name@domain:/var/www/html/documentation-theme-jekyll/writers
```

