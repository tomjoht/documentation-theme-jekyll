---
title: 1. Build the default project
tags: [getting_started]
keywords: start, introduction, begin, install, build, hello world,
last_updated: November 30, 2015
summary: "To get started with this theme, first make sure you have all the prerequisites in place; then build the theme following the sample build commands. Because this theme is set up for single sourcing projects, it doesn't follow the same pattern as most Jekyll projects (which have just a _config.yml file in the root directory)."
series: "Getting Started"
weight: 1
---

{% include custom/mydoc/getting_started_series.html %}
## Set up the prerequisites

Before you start installing the theme, make sure you have all of these prerequisites in place.

* **Mac computer**. If you have a Windows machine, make sure you can get a vanilla Jekyll site working before proceeding. You'll probably need Ruby and Ruby Dev Kit installed first. Also note that the shell scripts (.sh files) in this theme for automating the builds work only on a Mac. To run them on Windows, you need to convert them to BAT.  
* **[Ruby](https://www.ruby-lang.org/en/)**. On a Mac, this should already be installed. Open your Terminal and type `which ruby` to confirm. 
* **[Rubygems](https://rubygems.org/pages/download)**. This is a package manager for Ruby. Type `which gem` to confirm.
* **Text editor**: My recommendations is WebStorm (or IntelliJ). You can use another text editor. However, there are certain shortcuts and efficiencies in WebStorm (such as using Find and Replace across the project, or Markdown syntax highlighting) that I'll be noting in this documentation.

I added a page called {{site.data.mydoc.mydoc_urls.mydoc_install_dependencies.link}} that explains how to install any necessary RubyGem dependencies in case you run into errors.

## Build the default project

Before you start customizing the theme, make sure you can build the theme with the default content and settings first.

1. Download the theme from the [documentation-theme-jekyll Github repository](https://github.com/tomjohnson1492/documentation-theme-jekyll) and unzip it into your ~username/projects folder. 
    
    You can either download the theme files directly by clicking the **Download Zip** button on the right of the repo, or use git to clone the repository to your local machine. 
	
2. After downloading the theme, note some unique aspects of the file structure: 
 * Although there's a \_config.yml file in the root directory, it's there only so that Github Pages will build the theme. Because the theme is set up for single sourcing, there's a separate configuration file for each unique output you're building. 
 * All the configuration files are stored in the configs directory. Each configuration file has a different preview port. If you want, you can build and preview all your outputs simultaneously in different preview servers. 
 * Each configuration file specifies a different project and potentially a different audience, product, platform, and version. By setting unique values for these properties in the includes/custom/conditions.html file, you determine how the sidebar and top navigation get constructed. 
 * A variety of shell scripts (.sh files) in the project's root directory automate the building and publishing of both the web and PDF files. After you configure the scripts, you can execute all the scripts through the master shell script, mydoc_all.sh.
 * "mydoc" is the name of the documentation project. You can leave the mydoc content in the theme. It won't affect the other projects you add to the theme.
 
    {{site.data.alerts.tip}} The main goal of this theme is to enable single sourcing. With single sourcing, you build multiple outputs from the same source, with somewhat different content in each output based on the particular product, platform, version, and audience. You don't have to use this theme for single sourcing, but most tech writing projects require this. If you're not a technical writer or not creating documentation, this theme is probably not for you. It doesn't have any post features coded, just pages.{{site.data.alerts.end}}
    
    There are four configuration files in this project: config_writers.yml and config_designers.yml as well as their PDF equivalents. The idea is that there's an output specific to writers, and an output specific to designers. 
    
    In reality, both of these outputs are pretty much the same. I mainly incorporated two outputs here mainly to demonstrate how the single sourcing works.

3. Unless you're planning to publish on Github Pages, you can delete the Gemfile. The Gemfile is only in this project to allow publishing on Github Pages.
	
	The theme is not using a Gemfile to manage project dependencies. Although theoretically the Gemfile should make things easier, I've found that it tends to give users more errors than they need. Add to this the incompatibility of Github Pages with Jekyll 3.0 and the Gemfile becomes even more problematic.

4. Install the [Jekyll](https://rubygems.org/gems/jekyll), [redcarpet](https://rubygems.org/gems/redcarpet), and [pygments](https://rubygems.org/gems/pygments.rb) gems.
	
	These gems are the only ones the project uses. Go to the [Rubygems site](https://rubygems.org) for each of these gems (based on the links above). In the right column, click the "INSTALL" command and paste the copied command into your terminal. If your computer gives you permissions errors, add `sudo` before the command.
	
5. In your terminal, browse to the documentation-theme-jekyll folder that you downloaded. 
6. Build the writer's output:
	
    ```
    jekyll serve --config configs/mydoc/config_writers.yml
    ```
	
    The `--config` parameter specifies the location of the configuration file to be used in the build. The configuration file itself contains the destination location for where the site gets built. 
    
    Open a new tab in your browser and preview the site at the preview URL shown.
	
7. Press **Ctrl+C** in Terminal to shut down the writer's preview server. 
8. Build the designers output:
	
    ```
    jekyll serve --config configs/mydoc/config_designers.yml
    ```
    
    Open a new tab in your browser and preview the site at the preview URL shown. Notice how the themes differ (designers is blue, writers is green).

9. Press **Ctrl+C** in Terminal to shut down the designer's preview server. 
10. Build both themes by running the following command:

	```
	. mydoc_3_multibuild_web.sh
	```
	
	The themes build in the `../doc_outputs/mydoc/mydoc_designers` and `../doc_outputs/mydoc/mydoc_writers` folders. Browse to these directories to view the output. 
	
	Open the writers and designers folders and click the index.html file. The themes should launch and appear similar to their appearance in the preview folder. This is because the themes are built using a relative link structure, so you can move the theme to any folder you want without breaking the links. 
	
    If the theme builds both outputs successfully, great. You can move on to the other sections. If you run into errors building the themes, solve them before moving on. See {{site.data.mydoc.mydoc_urls.mydoc_troubleshooting.link}} for more information.
    
	{{site.data.alerts.tip}} You can set up profiles in iTerm to initiate all your builds with one selection. See {{site.data.mydoc.mydoc_urls.mydoc_iterm_profiles.link}} for details. {{site.data.alerts.end}}
	
	More information about building the PDF versions is provided in {{site.data.mydoc.mydoc_urls.mydoc_generating_pdfs.link}}.

## Questions

If you have questions, contact me at <a href="mailto:tomjohnson1492@gmail.com">tomjohnson1492@gmail.com</a>. My regular site is [idratherbewriting.com](http://idratherbewriting.com). I'm eager to make these installation instructions as clear as possible, so please let me know if there are areas of confusion that need clarifying.

{% include custom/mydoc/getting_started_series_next.html %}




