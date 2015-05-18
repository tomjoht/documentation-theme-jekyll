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

The configuration file serves important functions with single sourcing. For each site output, you create a unique configuration file for that output. 

The configuration file contains all the settings and other details unique to that site output, such as variables, titles, output directories, build folders, and more.

{{warning}} This theme is coded to look for specific values set by the configuration file. If something isn't working correctly, check to make sure that you have the configuration values that are defined here properly configured.{{end}}

## Configuration file options

Some of the options you can set in the configuration file determine theme settings. For sample values, see the default configuration file.

Note that you can arbitrary key value pairs in the configuration file, and then you can access them through `site.yourkey`. However, the values in these tables are used to control different aspects of the theme.

## Cascading configuration files

When you build or serve Jekyll, you specify the configuration file that you want Jekyll to use. If you have multiple sites you're building, you can put all the common configuration values into a base configuration file. For the unique configuration files, you put them into another configuration file. Jekyll will read multiple configuration files. 

The documentation on Jekyll for using multiple configuration files isn't very clear. In my experience, the build command needs to look like this:

```
jekyll serve --config config_base.yml,config_designer.yml
```

Later configuration files will override settings in earlier configuration files. 


{{warning}} You cannot use a space after the period.{{end}}

## Configuration settings

| Field | Required? | Description |
|-------|-----------|-----------|
 |
| **project** | Required| A unique name for the project. The _includes/custom/conditions.html file will use this project name to determine what sidebar and top nav data files to use. Make this value unique. |
| **audience** | Required | The audience for the output. Each sidebar entry in the _data/sidebar.yml files needs to have an audience attribute that matches the value here in order for the sidebar item to be included.|
| **platform** | Required | The platform for the output. The function is the same as audience -- the sidebar file matches up with attributes defined in the configuration file to determine what sidebar items are included in the build.|
| **product** | Required | Same function as audience, platform, and version.
| **version**    |  Required | Same function as audience, platform, and product.
| **destination** | Required | The folder where the site is built. If you put this into your same folder as your other files, Jekyll may start building and rebuilding in an infinite loop because it detects more files in the project folder. It's better to specify a folder outside your project folder, by using `../`. |
| **tagline** | Optional | Appears above the sidebar. Usually you put some tag related to the site specific build, such as the audience.|       
| **topnav_title** | Required | Appears next to the home button in the top nav bar.|
| **topnav_version** | Optional | Appears next to the title (which is next to the home button) in the top nav bar.|
| **homepage_title**| Required | If you're using includes to pull in the homepage content, then you set the title for your homepage via the configuration file. This is because multiple files are being displayed on the index.md page depending on the project. The page layout will use the homepage_title instead of the one on the include.|
| **site_title**| |
| **baseurl**    |  Optional | The folder where the help will appear when published. If you're publishing one version of your doc into a root directory, this isn't needed. However, most likely you will publish each output into its own folder, so add a value for the baseurl. Note that your site *must* be published in this baseurl in order to display correctly. This is because the links in the published site build are not all relative in the same way. However, you can publish the same output onto different domains (as long as you keep the same baseurl folder on those different domains).
| **url**    | Optional. | Recommended to not include this, since it allows you to easily push help from one domain to another (such as from a test environment to a production environment. As long as the baseurl's folder remains the same, the help will display well. I think the only use for the url is for the RSS feed.    |      
| **baseurl**  | Optional  | The baseurl is everything that comes after the domain (acme.com). If you publish at acme.com/folder/version/role, then the baseurl is folder/version/role. Jekyll is hard-coded to only display properly when placed inside this baseurl folder.    |         
| **port**  | Required  | The port used in the preview mode. This is only for the live preview and doesn't affect the published output. If you serve multiple outputs simultaneously, the port must be unique.  |         
| **feedback_email**    | Gets configured as the email address in the Send Feedback button in the top navigation bar.|
| **sidebar_accordion**  | Required  | Boolean. Whether you want the navigation sidebar to use the accordion effect or not. The accordion effect means when you expand a section, the other sections auto-collapse. If you put false, then you can expand multiple sections at once. At the bottom of the navigation sidebar, two links will appear: Collapse All and Expand All.|  
| **floating_nav** | Optional | Boolean. Whether you want the nav bar to float or not when users scroll down. |     
| **disqus_shortname** | Optional   | The disqus site shortname, which is used for comments. If you don't want comment forms via disqus, leave this blank or omit it altogether.    |         
| **markdown**  | Required  | The processor to use for Markdown. This is a Jekyll-specific setting.    |     
| **redcarpet**  | Required  | Extensions used with redcarpet. You can read more about them by searching for redcarpet extensions online. {% include custom/toc_id_note.html %}    |          
| **highlighter**  | Optional  | The syntax highlighter used. Rouge is also an option. I think Pygments does a better job. You will need to [install Pygments](http://pygments.org/download/) on your machine or else you will see an error. |
| **exclude**  | Optional  | A list of files and directories that you want excluded from the build. By default, all the content in your project is included in the output.    |       
| **permalink** | Required   |  The structure used for the link URLs. To read more about permalinks, see [Permalinks](http://jekyllrb.com/docs/permalinks/).   |          
|  **defaults** | Optional  | Here you can set default values for frontmatter based on the content type (page, post, or collection).    |          
|  **sass** | Required  | The directory for sass files. This is a Jekyll-specific settings. Sass isn't customized in this theme.    |        
|  **collections**  | Optional |  Any specific collections (custom content types that extend beyond pages or posts) that you want to define. This theme defines a collection called tooltips. You access this collection by using site.tooltips instead of site.pages or site.posts. Put the tooltip content types inside a folder in your project called \_tooltips. |
|  **print** | Optional | Boolean. Whether this build is a print build or not. This setting allows you to run conditions in your content such as {% raw %} {% if site.print == true %} do this... {% endif %} {% endraw %}.   |     
| **floating_nav** | Optional | Boolean. If you add `false`, then the sidebar navigation won't apply a fixed floating property. When the user scrolls. the nav bar won't stay in the same place. If you have a large nav bar, you may want to turn off the floating properties. Also, for small screens with viewports of 600px of height or smaller, the fixed nav is automatically turned off because the options tend to extend past the visible screen. Usually leave this set to `true` or omit the option altogether (the default is true).|
| **suffix** | Optional | If you publish on Salesforce's site.com, you have to add index.html to the permalink or else the page won't render. If you add `suffix: index.html` in your config file, this file will be appended in the URLs. If you're not publishing to Salesforce, don't add this property to your configuration file.|

## Where to store configuration files

In this theme, the configuration files are listed in the root directory. There are some build scripts in the root directory that simply reference the configuration files.

For reasons unknown to me, Jekyll won't work if you put the configuration files into a subdirectory and are using multiple configuration files.

## Default config in root

There is also a default \_config.yml file in root that is a copy of the config_designer.yml file. This file is included so that Github Pages will build the theme. 

It's also included because most Jekyll users are accustomed to downloading a theme, running `jekyll serve`, and expecting the site to build. The `jekyll serve` command depends on having a _config.yml file in the root.




