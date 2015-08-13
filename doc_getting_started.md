---
title: Getting started with this theme
tags: [getting-started]
keywords: start, introduction, begin, install, build, hello world,
last_updated: August 12, 2015
summary: "To get started with this theme, first make sure you have all the prerequisites in place; then build the theme following the sample build commands. Because this theme is set up for single sourcing projects, it doesn't follow the same pattern as most Jekyll projects (which have just a _config.yml file in the root directory)."
---
{% include linkrefs.html %} 


## Step 1: Set up the prerequisites

Before you start installing the theme, make sure you have all of these prerequisites in place.

* **Mac computer (recommended)**. If you have a PC, you need to see [Jekyll on Windows](http://jekyllrb.com/docs/windows/). Make sure you can get Jekyll working on Windows before proceeding.
* **[Ruby](https://www.ruby-lang.org/en/)**. On a Mac, this should already be installed. Open your Terminal and type `which ruby` to confirm. 
* **[Rubygems](https://rubygems.org/pages/download)**. This is a package manager for Ruby. Type `which gem` to confirm.
* **[Jekyllrb](http://jekyllrb.com/)**. To install: `gem install jekyll`. Type `which jekyll` to confirm that Jekyll is installed.
* **Text editor** (some examples: Sublime Text, Atom, WebStorm, IntelliJ)
* **[iTerm](http://iterm.sourceforge.net/)** - Optional but recommended instead of Terminal. 
* **[pygments](http://pygments.org/download/)** - Pygments handles syntax highlighting. In my experiments, the Pygments highlighter seemed better than the default rouge highlighter. To install Pygments, you will need Python installed. (If you don't install pygments, you'll get an error when you build the theme.) To check if Python is installed, type `which python`. To install Pygments: `gem install pygments.rb`. If you want to use `rouge` instead, change `pygments` to `rouge` in the configuration files.

## Step 2: Build the theme

Before you start customizing the theme, make sure you can build the theme with the default content and settings first.

1. Download the theme from the [documentation-theme-jekyll Github repository](https://github.com/tomjohnson1492/documentation-theme-jekyll) and unzip it into your ~username/projects folder. 
    
    You can either download the theme files directly by clicking the **Download Zip** button on the right of the repo, or use git to clone the repository to your local machine. Note, however, that you won't be using the pull command to update the theme since you'll be customizing it with your own content and won't want to overwrite those customizations, so there isn't a need to clone it.
	
2. After downloading the theme, note some unique aspects of the file structure: 
 * Although there's a \_config.yml file in the root directory, it's there only so that Github Pages will build the theme. Because the theme is set up for single sourcing, there's a separate configuration file for each unique output you're building. 
 * All the configuration files are stored in the configs directory. Each configuration file has a different preview port. 
 * Each configuration file specifies a different project and potentially a different audience, product, platform, and version. By setting unique values for these properties in the includes/custom/conditions.html file, you determine how the sidebar and top navigation get constructed. 
 * You can build all the outputs in your configs directory by running the doc_multibuild_web.sh file in the root directory.
 
    {{tip}} The main goal of this theme is to enable single sourcing. With single sourcing, you build multiple outputs from the same source, with somewhat different content in each site based on the particular product, platform, version, and audience. You don't have to use this theme for single sourcing, but most tech writing projects involve this requirement.{{end}}
    
    There are four configuration files in this project: config_writer.yml and config_designer.yml as well as their PDF equivalents. The idea is that there's an output specific to writers, and an output specific to designers. 
    
    In reality, both of these outputs are pretty much the same. However, for the writers output, I've conditionally excluded more lengthy explanations about how the theme works. The idea is that writers just want to create and publish content; in contrast, designers want to understand and modify the theme itself. Also, the configuration files use different themes.
    
3. Build the writer's output:
	
    ```
    jekyll serve --config configs/config_writers.yml
    ```

    The `--config` parameter specifies the location of the configuration file to be used in the build. The configuration file itself contains the destination location for where the site gets built. 
    
    Open a new tab in your browser and preview the site at the preview URL shown.
	
4. Press **Ctrl+C** in Terminal to shut down the writer's output. 
5. Build the designers output:
	
    ```
    jekyll serve --config configs/config_designers.yml
    ```
    
    Open a new tab in your browser and preview the site at the preview URL shown. Notice how the themes differ (designers is blue, writers is green).

5. Press **Ctrl+C** in Terminal to shut down the designer's output. 
6. Build both themes by running the following command:

	```
	. doc_multibuild_web.sh
	```
	
	The themes build in the ../doc_designers and ../doc_writers folders. Use finder and browse to one level above where you installed the project (probably username/projects). 
	
	Open the writers and designers folders and click the index.html file. The themes should launch and appear similar to their appearance in the preview folder. This is because the themes are build using a relative link structure, so you can move the theme to any folder you want without breaking the links. 
	
    If the theme builds both outputs successfully, great. You can move on to the other sections. If you run into errors building the themes, try to solve them before moving on. See {{doc_troubleshooting}} for more information.
    
{{tip}} You can set up profiles in iTerm to initiate all your builds with one selection. See {{doc_iterm_profiles}} for details. {{end}}

	More information about building the PDF versions is provided in {{doc_generating_pdfs}}.

## Questions

If you have questions, contact me at <a href="mailto:tomjohnson1492@gmail.com">tomjohnson1492@gmail.com</a>. My regular site is [http://idratherbewriting.com](idratherbewriting.com). I'm eager to make these installation instructions as clear as possible, so please let me know if there are areas of confusion that need clarifying.




