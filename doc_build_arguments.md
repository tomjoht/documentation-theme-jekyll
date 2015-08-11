---
title: Build arguments
tags: [publishing]
audience: writer, designer
keywords: 
last_updated: 
summary: 
---
{% include linkrefs.html %} 

## How to build Jekyll sites

The normal way to build the Jekyll site is through the build command:

```
jekyll build
```

To build the site and view it in a live server so that Jekyll rebuilds that site each time you make a change, use the `serve` command:

```
jekyll serve
```

By default, the _config.yml will be used, Jekyll will scan the current directory for files, and the folder _site will be used as the output. You can customize these build commands.

```
jekyll serve --config configs/config_writer.yml --destination /users/tjohnson/projects/documentation-theme-jekyll-builds/writer
```

Here the configs/config_writer.yml file is used instead of _config.yml. The destination directory is /users/tjohnson/projects/documentation-theme-jekyll-builds/writer.

## Shortcuts for the build arguments

If you don't want to enter the long Jekyll argument every time, with all your configuration details, you can create a shell script and then just run the script. This theme shows an example with the doc_multibuild_web.sh file in the root directory.

My preference is to add the scripts to profiles in iTerm. See {{doc_setting_up_iterm_profiles}} for more details.

## Stop a server

When you're doing with the preview server, press `Ctrl+C` to exit out of it. If you exit Terminal without shutting down the server, the next time you build your site, or if you build multiple sites with the same port, you may get a server-already-in-use message.

You can kill the server process using these commands:

`ps aux | grep jekyll`

Find the PID (for example, it  looks like "22298").

Then type `kill -9 22298` where "22298" is the PID.


