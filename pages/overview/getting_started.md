---
title: Getting started
permalink: /getting_started/
tags: getting-started
audience: writer, designer
---
{% include linkrefs.html %}
## Prerequisites

* Mac computer (recommended). If you have a PC, you need to see [Jekyll on Windows](http://jekyllrb.com/docs/windows/). Make sure you can get Jekyll working on Windows before proceeding.
* [Ruby](https://www.ruby-lang.org/en/). This should already be installed. Type `which ruby` to confirm. 
* [Rubygems](https://rubygems.org/pages/download). This is a package manager for Ruby (gems).
* [Jekyllrb](http://jekyllrb.com/). To install: `gem install jekyll`
* [Git](http://git-scm.com/download/mac). Type `which git` to see if you already have it installed.
* Text editor (some examples: Sublime Text, Atom, WebStorm)
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

1. Using iTerm, create the directory where you want to install the project. I like using ~[username]/projects, because ~[username] is the default directory that appears when you open iTerm on a Mac. 
    
    ```
    cd projects
    mkdir acme
    cd acme
    ```
    
2. Once you're inside the folder for your project (for example, acme), type `git clone https://github.com/tomjohnson1492/documentation-theme-jekyll.git .` (The ` .` means to clone the github repo into the current directory. Make sure the directory is empty before cloning the theme in there.)
3. In your new project folder, remove the .git folder, because no doubt you'll be customizing this project's content and committing it to another revision control repository.
4. In the theme's configs directory, rename config_writer.yml to config_[your audience].yml and customize all the values inside that file based on the instructions in that file. Do the same with config_designer.yml and continue to clone and customize the config file for other audiences. 
    
    In this theme, each output requires an individual config file. Each print output requires a separate config file. If you have 10 audiences and you want both web and PDF outputs for each audience, then you'll have 20 config files in this directory.

5. In the _includes directory, open conditions.html and customize the values there specific to your outputs. (Basically, replace `writer` with your audience, and `designer` with another audience.) The conditions.html file is used to apply different audience requirements to the sidebar and other files.
6. Remove the content inside the pages folder, and then add your own pages in this pages folder. (Using subfolders and sub-subfolders inside the pages folder is all right -- you don't have to worry about folder paths in links.)
7. Inside _data, open sidebar.yml and topnav.yml and customize the navigation. (Don't mess up the spacing or change any of the YML level names or the site or sidebar won't build.)
8. In the root directory, rename build_writer.sh to build_[your audience].sh (same with build_designer.sh for additional outputs). In the files' contents, change the build parameters to point to the configuration file and output directory that you want. 
    
    {{note}} When you're just starting out, don't worry about setting up the PDF builds. This workflow is more complicated and somewhat touchy. See {{create_pdf}} for more details. You will need to set up Prince in order for the PDF build to work. {{end}}

9. In the root directory, customize the index.md file. This file will be the homepage for all of your projects. Use conditional tags (for example, `if site.audience == "writer" ...`) to change the content for different builds of your site. See {{conditional_logic}} for more information.
10. In the _includes folder, open linkrefs.html and add capture tags for all the pages in your site following the sample format shown. This will make it easy to link to each of the topics. (Don't remove the capture tags for the alerts and callouts.) 
11. For each of your pages where you want to insert a link, note, or callout, add {%raw%}`{% include linkrefs.html %}`{%endraw%}  directly below the frontmatter.
12. In the _includes folder, open footer.html and customize the content. If you have different footers for different outputs, use conditional tags as you did on index.md.
12. In the layouts folder, open page.html and customize the values in the `site.show_audience_label` section. These are labels that appear on the page based on the audience attributes in the frontmatter for that page. If you want these shown, make sure you have `true` set for the `site.show_audience_label` property in your config file.
11. Build your site with `. build_acme.sh` and preview it at the URL provided.


{{callout_info}}<b>Publishing to web hosts:</b> If you have multiple outputs, you probably don't want to use Github Pages to publish your site, since Github Pages looks for a _config.yml file in the root directory and uses that to build a site in the gh-pages branch of your repository. You can't instruct Github pages to look in another directory for the right configuration file. Instead, you'll probably have a better experience publishing to a Amazon Web Services S3 bucket or some other web host.{{end}}

## Questions

If you have questions, contact me at tomjohnson1492@gmail.com. My regular site is [http://idratherbewriting.com](idratherbewriting.com). 




