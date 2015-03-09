---
title: Build arguments
permalink: /build_arguments/
tags: getting_started
---

## How to build Jekyll sites

The normal way to build the Jekyll site is through the build command:

```
jekyll build
```

To build the site and view it in a live server, use the `serve` command:

```
jekyll serve
```

By default, the _config.yml will be used, Jekyll will scan the current directory for files, and the folder _site will be used as the output. You can customize these:

```
jekyll serve --config config_web.yml --destination site_web
```

Here the config_web.yml file is used instead of _config.yml. The destination directory is site_web.

In order to exclude pages from being included in the build, I use the `exclude` property in the configuration file:

```
exclude:
  - "README.md"
  - "CHANGELOG.md"
  - "CNAME"
  - "Gemfile"
  - "Gemfile.lock"
  - content/web
  - content/acme/drafts
```

These files or directories will be excluded from the build. 

## Shortcuts for the build arguments

If you don't want to enter the long Jekyll argument every time, with all your configuration details, you can create a shell script and then just run the script. 

Copy the build script into a new file called web.sh (or whatever):

```
jekyll serve --config config_web.yml --destination site_web
```

Put web.sh into your root Jekyll directory. 

Open Terminal and go to the directory. Change the file permissions to make the sh file executable:

```
chmod +x web.sh
```

Now to execute the build script, do this:

```
./web.sh
```

