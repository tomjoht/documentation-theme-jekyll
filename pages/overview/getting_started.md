---
title: Getting started
permalink: /getting_started/
tags: getting-started
audience: writer, designer
keywords: 
last_updated: 
summary: 
---
{% include linkrefs.html %} 


## Step 1: Install all the prerequisites

Before you start installing the theme, make sure you have all of these prerequisites in place.

* Mac computer (recommended). If you have a PC, you need to see [Jekyll on Windows](http://jekyllrb.com/docs/windows/). Make sure you can get Jekyll working on Windows before proceeding.
* [Ruby](https://www.ruby-lang.org/en/). This should already be installed. Type `which ruby` to confirm. 
* [Rubygems](https://rubygems.org/pages/download). This is a package manager for Ruby (gems). Type `which gem` to confirm.
* [Jekyllrb](http://jekyllrb.com/). To install: `gem install jekyll`. Type `which jekyll` to confirm.
* [Git](http://git-scm.com/download/mac). Type `which git` to see if you already have it installed.
* Text editor (some examples: Sublime Text, Atom, WebStorm)
* [iTerm](http://iterm.sourceforge.net/) - Optional but recommended instead of Terminal. 
* [pygments](http://pygments.org/download/) - Pygments handles syntax highlighting. In my experiments, the Pygments highlighter seemed better than the default rouge highlighter. To install Pygments, you will need Python installed. (If you don't install pygments, you'll get an error when you build the theme.) To check if Python is installed, type `which python`. To install Pygments: `gem install pygments.rb`.

{{warning}} These instructions are designed for users on Macs. Jekyllrb supposedly works on Windows but is not officially supported on that platform. See <a href="Jekyll on Windows">http://jekyllrb.com/docs/windows/</a> for more details. {{end}}

## Step 2: Build the theme

{{important}} Because this theme is intended to build multiple outputs from the same project, it doesn't use the default _config.yml file like other Jekyll themes. Instead, each different output has its own config file in the configs directory. As a result, you can't type `jekyll serve` to build the theme, since this command looks for the _config.yml file in your project directory, and there isn't one there.{{end}}

1. Make sure you satisfy all the prerequisites as listed in the previous section, "Prerequisites."
1. Download the theme from the [documentation-theme-jekyll Github repository](https://github.com/tomjohnson1492/documentation-theme-jekyll) and unzip it into your ~username/projects folder. 
    You can either download the theme files directly by clicking the **Download Zip** button on the right of the repo, or use git to clone the repository to your local machine. Note, however, that you won't be using the pull command to update the theme since you'll be customizing it with your own content and won't want to overwrite those customizations, so there isn't a huge need to clone or fork it.
2. After downloading the theme, note some unique aspects of the file structure: *Inside the configs folder, there's a separate config file for each unique output you're building.* Each config file has a different preview port and build destination. Each config file also specifies a different audience. The whole point of this theme is to enable single sourcing, which allows you to build multiple outputs from the same source. That's why there are separate config files for each output.
    
    In general, you build the sites by using build commands that specify the config file and destination , like this:

    ```
jekyll serve --config configs/config_writer.yml --destination ../documentation-theme-jekyll-builds/writer
```
    The `--config` parameter specifies the location of the configuration file to be used in the build, and the `--destination` parameter specifies where you want the site to be built. 
    Because these commands are long and bulky, it's easier to store them in a small shell script and then run the script. 
3. In the root directory, you'll find build_writer.sh, which is a simple shell script containing this build argument. Instead of running the command above, run the following:

    ```
    . build_writer.sh
    ```
    
    Preview the site at the preview URL shown.
    
4. Open a new tab in iTerm and build an additional output:

    ```
    . build_designer.sh
    ```
    Open a new tab in your browser and preview the site at the preview URL shown. 
    
    If the theme builds both outputs successfully, great. You can move on to the next section: Customizing the theme. If you run into errors building the basic theme, you must solve them before moving on. See {{troubleshooting}} for more information.

## Step 3: Customize the theme

{{note}} Before you start customizing the theme, make sure you can build the theme by following the instructions in the previous section, "Step 2: Build the theme." {{end}}

The theme shows two build outputs: one for designers, and one for writers. The dual outputs is an example of the single sourcing nature of the theme. The designers output is comprehensive, whereas the writers output is a subset of the information. Follow these steps to customize the theme with your own content.

{{important}} In these instructions, I'll assume your project's name is "acme." I'll also assume you have two audiences you're building your acme project for: developers and marketers. {{end}}

1. If you haven't already downloaded the theme, see the previous section, "Step 2: Build the theme." Press Ctrl+C to stop the previews.
1. In the theme's configs directory, rename config_writer.yml to config_developer.yml and customize all the values inside that file based on the instructions in that file. Do the same with config_designer.yml (changing it to config_marketer.yml) and continue to clone and customize the config file for other audiences you need.
    
    In this theme, each output requires a separate config file. If you have 10 audiences and you want separate sites for each, then then you'll have 10 config files in this directory. 
    
    {{tip}} As you customize the config files, make the port values unique so that you don't run into "Address already in use" issues when you build multiple sites and want to preview them at the same time.{{end}}
    
5. In the _includes directory, open conditions.html and customize the values there specific to your outputs. (Basically, replace `writer` with your developer, and `designer` with another marketer.) 
    
    The conditions.html file is used to apply different audience requirements to the sidebar and other files. The conditions.html file is included in various parts of the theme -- the sidebar.html, the topnav.html, and some of the print files.
    
6. Remove the content inside the pages folder, and then add your own pages in this pages folder. (Using subfolders and sub-subfolders inside the pages folder is fine -- you won't have to worry about folder paths in links.)
7. Inside _data, open sidebar.yml and topnav.yml and customize the navigation. 
    
    {{warning}} Don't mess up the spacing or change any of the YML level names or the site or sidebar won't build.) {{end}}
    
8. In the root directory, rename build_writer.sh to build_developer.sh (same with build_designer.sh; change it to build_marketer.sh). In the content of each of these files, change the build parameters to point to the configuration file and output directory that you want. 
    
    {{note}} When you're just starting out, don't worry about setting up the PDF builds. This workflow for PDFs is more complicated and somewhat touchy. See {{create_pdf}} for more details. You will need to set up Prince in order for the PDF build to work. {{end}}

9. In the root directory, customize the index.md file. This file will be the homepage for all of your projects. Use conditional tags (for example, `if site.audience == "developer" ...`) to change the content for different builds of your site. See {{conditional_logic}} for more information.
10. In the _includes folder, open linkrefs.html and add capture tags for all the pages in your site following the sample format shown. This will make it easy to link to each of the topics. (Don't remove the capture tags for the alerts and callouts.) 
11. For each of your pages where you want to insert a link, note, or callout, add {%raw%}`{% include linkrefs.html %}`{%endraw%}  directly below the frontmatter.
12. In the _includes folder, open footer.html and customize the content. If you have different footers for different outputs, use conditional tags as you did with index.md.
12. In the layouts folder, open page.html and customize the values in the `site.show_audience_label` section. These are labels that appear on the page based on the audience attributes in the frontmatter for that page. If you want audiencd tags shown, make sure you have `true` set for the `site.show_audience_label` property in your config file. Each of your pages will need an audience property in the frontmatter.
11. Build your site with `. build_developer.sh` and `. build_marketer.sh` and preview it at the URLs provided.


{{callout_info}}<b>Publishing to web hosts:</b> If you have multiple outputs, you probably don't want to use Github Pages to publish your site, since Github Pages looks for a _config.yml file in the root directory and uses that to build a site in the gh-pages branch of your repository. You can't instruct Github pages to look in another directory for the right configuration file. Instead, you'll probably have a better experience publishing to a Amazon Web Services S3 bucket or some other web host.{{end}}

## Questions

If you have questions, contact me at tomjohnson1492@gmail.com. My regular site is [http://idratherbewriting.com](idratherbewriting.com). I'm eager to make these installation instructions as clear as possible, so please let me know if there are areas of confusion that need clarifying.




