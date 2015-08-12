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
* **[Ruby](https://www.ruby-lang.org/en/)**. This should already be installed. Open your Terminal and type `which ruby` to confirm. 
* **[Rubygems](https://rubygems.org/pages/download)**. This is a package manager for Ruby (gems). Type `which gem` to confirm.
* **[Jekyllrb](http://jekyllrb.com/)**. To install: `gem install jekyll`. Type `which jekyll` to confirm that Jekyll is installed.
* **Text editor** (some examples: Sublime Text, Atom, WebStorm, IntelliJ)
* **[iTerm](http://iterm.sourceforge.net/)** - Optional but recommended instead of Terminal. 
* **[pygments](http://pygments.org/download/)** - Pygments handles syntax highlighting. In my experiments, the Pygments highlighter seemed better than the default rouge highlighter. To install Pygments, you will need Python installed. (If you don't install pygments, you'll get an error when you build the theme.) To check if Python is installed, type `which python`. To install Pygments: `gem install pygments.rb`. If you want to use `rouge` instead, change `pygments` to `rouge` in the configuration files.

{{warning}} These instructions are designed for users on Macs. Jekyllrb supposedly works on Windows but is not officially supported on that platform. See <a href="http://jekyllrb.com/docs/windows/">Jekyll on Windows"</a> for more details about getting Jekyll working on Windows. {{end}}

## Step 2: Build the theme

Before you start customizing the theme, make sure you can build the theme with the default content and settings first.

1. Download the theme from the [documentation-theme-jekyll Github repository](https://github.com/tomjohnson1492/documentation-theme-jekyll) and unzip it into your ~username/projects folder. 
    
    You can either download the theme files directly by clicking the **Download Zip** button on the right of the repo, or use git to clone the repository to your local machine. Note, however, that you won't be using the pull command to update the theme since you'll be customizing it with your own content and won't want to overwrite those customizations, so there isn't a need to clone it.
	
3. After downloading the theme, note some unique aspects of the file structure: 
 * Although there's a \_config.yml file in the root directory, it's there only so that Github Pages will build the theme. Because the theme is set up for single sourcing, there's a separate configuration file for each unique output you're building. 
 * All the configuration files are stored in the configs directory. Each configuration file has a different preview port. 
 * Each configuration file specifies a different project and potentially a different audience, product, platform, and version. By setting unique values for these properties in the includes/custom/conditions.html file, you determine how the sidebar and top navigation is constructed. 
 * You can build all the outputs in your configs directory by running the doc_multibuild_web.sh file in the root directory.
 
    {{tip}} The main goal of this theme is to enable single sourcing. With single sourcing, you build multiple outputs from the same source, with somewhat different content in each site based on the particular product, platform, version, and audience. You don't have to use this theme for single sourcing, but most tech writing projects involve this requirement.{{end}}
    
    The doc_multibuild_web.sh file just contains build commands that refer to specific configuration files. Here's how you build the "writers" output:

    ```
    jekyll serve --config configs/config_writers.yml
    ```

    The `--config` parameter specifies the location of the configuration file to be used in the build. The configuration file itself contains the destination location for where the site gets built. 

    There are two configuration files in this project: config_writer.yml and config_designer.yml. The idea is that there's an output specific to writers, and an output specific to developers. 
    
    In reality, both of these outputs are pretty much the same (except for a theme difference). However, for the writers output, I've conditionally excluded more lengthy explanations about how the theme works. The idea is that writers just want to create and publish content; in contrast, designers want to understand and modify the theme itself.
	
4. Open a new tab in Terminal and build the designers output:

    ```
    jekyll serve --config configs/config_designers.yml
    ```
    Open a new tab in your browser and preview the site at the preview URL shown. Notice how the themes differ (designers is blue, writers is green).
    
    If the theme builds both outputs successfully, great. You can move on to the other sections. If you run into errors building the basic theme, try to solve them before moving on. See {{doc_troubleshooting}} for more information.
    
{{tip}} You can set up profiles in iTerm to initiate all your builds with one selection. See {{doc_iterm_profiles}} for details. {{end}}

## Questions

If you have questions, contact me at tomjohnson1492@gmail.com. My regular site is [http://idratherbewriting.com](idratherbewriting.com). I'm eager to make these installation instructions as clear as possible, so please let me know if there are areas of confusion that need clarifying.




