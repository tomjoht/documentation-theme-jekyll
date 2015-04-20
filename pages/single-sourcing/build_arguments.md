---
title: Build arguments
permalink: /build_arguments/
tags: [single-sourcing, publishing]
audience: writer, designer
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

By default, the _config.yml will be used, Jekyll will scan the current directory for files, and the folder _site will be used as the output. You can customize these build commands.

```
jekyll serve --config configs/config_writer.yml --destination /users/tjohnson/projects/documentation-theme-jekyll-builds/writer
```

Here the configs/config_writer.yml file is used instead of _config.yml. The destination directory is /users/tjohnson/projects/documentation-theme-jekyll-builds/writer.

In order to exclude pages from being included in the build, use the `exclude` property in the configuration file:

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

If you don't want to enter the long Jekyll argument every time, with all your configuration details, you can create a shell script and then just run the script. This theme shows an example with the build_writer.sh file in the root directory.

To run the script:

Open Terminal and go to the directory. The first time, you may need to change the file permissions to make the sh file executable:

```
chmod +x build_writer.sh
```

Now to execute the build script, do this:

```
. build_writer.sh
```

A similar file is set up for the designer output. Note that the port listed in the configuration file for each build must be unique.

## Stop a server

When you're doing with the preview server, press `Ctrl+C` to exit out of it. If you exit Terminal without shutting down the server, the next time you build your site, you may get a server-already-in-use message.

You can kill the server process using these commands:

`ps aux | grep jekyll`

Find the PID (for example, it  looks like "22298").

Then type `kill -9 22298` where "22298" is the PID.


