---
title: Getting started
permalink: /getting_started/
tags: getting-started
audience: writer, designer
---

## Prerequisites

* Mac computer (recommended). If you have a PC, you need to see [Jekyll on Windows](http://jekyllrb.com/docs/windows/). Make sure you can get Jekyll working on Windows before proceeding.
* Ruby. This should already be installed. Type `which ruby` to confirm. 
* [Rubygems](https://rubygems.org/pages/download). This is a package manager for Ruby (gems).
* Jekyllrb. To install: `gem install jekyll`
* * [Git](http://git-scm.com/download/mac). Type `which git` to see if you already have it installed.
* text editor (some examples: Sublime Text, Atom, WebStorm, Emacs)
* [iTerm](http://iterm.sourceforge.net/) - optional but recommended instead of Terminal. 

{{warning}} These instructions are designed for users on Macs. Jekyllrb supposedly works on Windows but is not officially supported on that platform. See <a href="Jekyll on Windows">http://jekyllrb.com/docs/windows/</a> for more details. {{end}}

## Build the theme

Because this theme is intended to build multiple outputs from the same project, it doesn't use the default _config.yml file like other Jekyll themes. Instead, each different output has its own config file in the configs directory. 

Each config file has a different preview port and build destination. It also specifies a different audience.

You build the sites by using more specific build commands, like this:

```
jekyll serve --config configs/config_writer.yml --destination /users/tjohnson/projects/documentation-theme-jekyll-builds/writer
```
Because these commands are long and bulky, it's easier to store them in a small shell script and then run the script. In the root directory, you'll find build_writer.sh, which simply contains this build argument. Instead of running the command above, run the following:

```
. build_writer.sh
```

If you run into permissions errors trying to run the .sh file, you may need to change the file permissions to make the sh file executable. To do that, browse to the directory containing build_writer.sh and run the following:

```
chmod +x build_writer.sh
```

## Customizing the theme

The theme shows two build outputs: one for designers, and one for writers. Here's how you would customize the theme. In these instructions, I'll assume your project's name is "acme."

1. Using iTerm, go to the directory where you want to install the project. I like using ~[username]/projects, because ~[username] is the default directory that appears when you open iTerm on a Mac.
2. git clone `https://github.com/tomjohnson1492/documentation-theme-jekyll.git .`
3. Rename the documentation-theme-jekyll folder to acme.
4. In the theme's configs directory, rename config_writer.yml to config_acme.yml and customize all the values based on the instructions in that file. Do the same with config_designer.yml if you have additional outputs.
5. In the _includes directory, open conditions.html and customize the values there specific to your outputs. (Basically, replace writer with your audience, and designer with another audience.)
5. Add your pages inside the pages folder. (Using subfolders and sub-subfolders inside pages is all right -- you don't have to worry about folder paths in links.)
5. Inside _data, open sidebar.yml and topnav.yml and customize the navigation. (Don't mess up the spacing or change any of the level names or the site won't build.)
6. In the root directory, rename build_writer.sh to build_acme.sh (same with build_designer.sh for additional outputs). In the file's contents, change the build parameters to point to the configuration file and destination/output directory that you want.
6. Build your site with `. build_writer.sh` and preview it at the URL provided.

If you have 10 different outputs, you'll have 10 separate configuration files in your configs directory, and probably 10 different shell scripts containing build arguments for each configuration.

{{callout_info}}If you have multiple outputs, you probably don't want to use Github Pages to publish your site, since Github Pages looks for a _config.yml file in the root directory and uses that to build a site in the gh-pages branch of your repository. You can't instruct Github pages to look in another directory for the right configuration file. Instead, you'll probably have a better experience publishing to a Amazon Web Services S3 bucket or some other host.{{end}}

## Questions

If you have questions, contact me at tomjohnson1492@gmail.com. My regular site is [http://idratherbewriting.com](idratherbewriting.com). 


