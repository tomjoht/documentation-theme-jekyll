---
title: Setting up the configuration file 
permalink: /config_setup/
tags: []
keywords: 
audience: 
last_updated: 
summary: "The configuration file contains important settings for your project. Some of the values you set here affect the display and functionality of the theme." 
---
{% include linkrefs.html %} 


## Importance of Configuration File

The configuration file serves important functions with single sourcing. Usually for each site output, you create a unique configuration file for that output. 

The configuration file contains all the settings and other details unique to that site build, such as variables, titles, output directories, build folders, and more.

## Configuration File Options

Some of the options you can set in the configuration file determine theme settings. For sample values, see the default configuration file.

Note that you can arbitrary key value pairs in the configuration file, and then you can access them through `site.yourkey`. However, the values in these tables are used to control different aspects of the theme.

| Field | Description |
|-------|-----------|
| **title**    | Appears in the top navigation bar as the link to home    |       
| **version**    |  Appears next to the title  |
| **tagline**   |  Appears at the top of the left navigation bar   |      
| **url**    | Optional. Recommended to not include this, since it allows you to easily push help from one domain to another (such as from a test environment to a production environment. As long as the baseurl's folder remains the same, the help will display well. I think the only use for the url is for the RSS feed.    |      
| **baseurl**    | Everything that comes after the domain (acme.com). If you publish at acme.com/folder/version/role, then the baseurl is folder/version/role. Jekyll is hard-coded to only display properly when placed inside this baseurl folder.    |         
| **port**    | The port used in the preview mode. This is only for the live preview and doesn't affect the published output.   |         
| **feedback_email**    | Gets configured as the email address in the Send Feedback button in the top navigation bar.    |        
| **sidebar_accordion**    | Boolean. Whether you want the navigation sidebar to use the accordion effect or not. The accordion effect means when you expand a section, the other sections auto-collapse. If you put false, then you can expand multiple sections at once. At the bottom of the navigation sidebar, two links will appear: Collapse All and Expand All.    |         
| **disqus_shortname**    | The disqus site shortname, which is used for comments. If you don't want comment forms via disqus, leave this blank or omit altogether.    |         
| **markdown**    | The processer to use for Markdown. This is a Jekyll-specific setting.    |     
| **redcarpet**    | Extensions used with redcarpet. You can read more about them by searching for redcarpet extensions online. Make sure you leave the `with_toc_data` option included. This auto-creates an ID for each Markdown-formatted heading, which then gets injected into the mini-TOC. Without this auto-creation of IDs, the mini-TOC won't include the heading. If you ever use HTML formatting for headings, you need to manually add an ID attribute to the heading in order for the heading to appear in the mini-TOC.    |          
| **highlighter**    | The syntax highlighter used. Rouge is also an option. I think Pygments does a better job. You will need to [install Pygments](http://pygments.org/download/) on your machine or else you will see an error.  |         
| **exclude**    | A list of files and directories that you want excluded from the build. By default, all the content in your project is included in the output.    |       
| **permalink**    |  The structure used for the link URLs. To read more about permalinks, see [Permalinks](http://jekyllrb.com/docs/permalinks/).   |          
|  **defaults**   | Here you can set default values for frontmatter based on the content type (page, post, or collection).    |          
|  **sass**   | The directory for sass files. This is a Jekyll-specific settings. Sass isn't customized in this theme.    |        
|  **collections**   |  Any specific collections (custom content types that extend beyond pages or posts) that you want to define. This theme defines a collection called tooltips. You access this collection by using site.tooltips instead of site.pages or site.posts. Put the tooltip content types inside a folder in your project called \_tooltips.                
|  **print**  | Boolean. Whether this build is a print build or not. This setting allows you to run conditions in your content such as {% raw %} {% if site.print == true %} do this... {% endif %} {% endraw %}.   |          


## Where to store configuration files

If you have a lot of different site builds (perhaps because you're single sourcing many different outputs), you'll probably want to group the configuration files into a specific folder. 

In this theme, the configuration files are grouped inside the configs folder. There are some build scripts in the root directory that simply reference the configuration files.

## Default config in root

There is also a default \_config.yml file in root that is a copy of the config_designer.yml file. This file is included so that Github Pages will build the theme. 

It's also included because most Jekyll users are accustomed to downloading a theme, running `jekyll serve`, and expecting the site to build. The `jekyll serve` command depends on having a _config.yml file in the root.




