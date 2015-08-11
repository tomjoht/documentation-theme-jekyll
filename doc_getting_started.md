---
title: Getting started with this theme
tags: getting-started
audience: writer, designer
keywords: 
last_updated: 
summary: 
---
{% include linkrefs.html %} 


## Step 1: Set up the prerequisites

Before you start installing the theme, make sure you have all of these prerequisites in place.

* **Mac computer (recommended)**. If you have a PC, you need to see [Jekyll on Windows](http://jekyllrb.com/docs/windows/). Make sure you can get Jekyll working on Windows before proceeding.
* **[Ruby](https://www.ruby-lang.org/en/)**. This should already be installed. Type `which ruby` to confirm. 
* **[Rubygems](https://rubygems.org/pages/download)**. This is a package manager for Ruby (gems). Type `which gem` to confirm.
* **[Jekyllrb](http://jekyllrb.com/)**. To install: `gem install jekyll`. Type `which jekyll` to confirm.
* **[Git](http://git-scm.com/download/mac)**. Type `which git` to see if you already have it installed.
* **Text editor** (some examples: Sublime Text, Atom, WebStorm)
* **[iTerm](http://iterm.sourceforge.net/)** - Optional but recommended instead of Terminal. 
* **[pygments](http://pygments.org/download/)** - Pygments handles syntax highlighting. In my experiments, the Pygments highlighter seemed better than the default rouge highlighter. To install Pygments, you will need Python installed. (If you don't install pygments, you'll get an error when you build the theme.) To check if Python is installed, type `which python`. To install Pygments: `gem install pygments.rb`. If you want to use `rouge` instead, change `pygments` to `rouge` in the configuration files.

{{warning}} These instructions are designed for users on Macs. Jekyllrb supposedly works on Windows but is not officially supported on that platform. See <a href="Jekyll on Windows">http://jekyllrb.com/docs/windows/</a> for more details. {{end}}

## Step 2: Build the theme

Before you start customizing the theme, make sure you can build the theme with the default content and settings first.

1. Make sure you satisfy all the prerequisites as listed in the previous section, "Prerequisites."
2. Download the theme from the [documentation-theme-jekyll Github repository](https://github.com/tomjohnson1492/documentation-theme-jekyll) and unzip it into your ~username/projects folder. 
    
    You can either download the theme files directly by clicking the **Download Zip** button on the right of the repo, or use git to clone the repository to your local machine. Note, however, that you won't be using the pull command to update the theme since you'll be customizing it with your own content and won't want to overwrite those customizations, so there isn't a need to clone it.
	
3. After downloading the theme, note some unique aspects of the file structure: 
 * There isn't a \_config.yml file in the root directory because this theme is set up to single source multiple site outputs, not just one version.
 * In the configs directory, there's a separate configuration file for each unique output you're building.
 * Each configuration file has a different preview port. 
 * Each configuration file specifies a different project and potentially a different audience, product, platform, and version. By setting unique values for these properties in the includes/custom/conditions.html file, you determine how the sidebar and top navigation is constructed. 
 
    {{tip}} The main goal of this theme is to enable single sourcing. With single sourcing, you build multiple outputs from the same source, with somewhat different content in each site based on the particular product, platform, version, and audience. You don't have to use this theme for single sourcing, but most tech writing projects involve this requirement.{{end}}
    
    In general, you build the sites by using build commands that specify the configuration file, like this:

    ```
    jekyll serve --config configs/config_writer.yml
    ```

    The `--config` parameter specifies the location of the configuration file to be used in the build. The configuration file itself contains the destination location for where the site gets built. 

    There are two configuration files in this project: config_writer.yml and config_developer.yml. The idea is that there's an output specific to writers, and an output specific to developers. 
    
3. In the root directory, you'll find a script called multibuild_web.sh that builds (with `jekyll build`, not `jekyll serve`) both projects with the same command.

4. Open a new tab in iTerm and build an additional output:

    ```
    jekyll serve --config configs/config_designer.yml
    ```
    Open a new tab in your browser and preview the site at the preview URL shown. Notice how the themes differ.
    
    If the theme builds both outputs successfully, great. You can move on to the other sections. If you run into errors building the basic theme, you must solve them before moving on. See {{troubleshooting}} for more information.
    
{{tip}} You can set up profiles in iTerm to initiate all your builds with one selection. See {{iterm_profiles}} for details. {{end}}

## Questions

If you have questions, contact me at tomjohnson1492@gmail.com. My regular site is [http://idratherbewriting.com](idratherbewriting.com). I'm eager to make these installation instructions as clear as possible, so please let me know if there are areas of confusion that need clarifying.




