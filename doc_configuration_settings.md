---
title: Configuration settings
tags: []
keywords:  
summary: "The configuration file contains important settings for your project. Some of the values you set here affect the display and functionality of the theme." 
---
{% include linkrefs.html %} 


## Importance of Configuration File

The configuration file serves important functions with single sourcing. For each site output, you create a unique configuration file for that output. 

The configuration file contains all the settings and other details unique to that site output, such as variables, titles, output directories, build folders, and more.

{{warning}} This theme is coded to look for specific values set by the configuration file. If something isn't working correctly, check to make sure that you have the configuration values that are defined here properly configured.{{end}}

## Configuration file options

Some of the options you can set in the configuration file determine theme settings. 

Note that you can arbitrary key value pairs in the configuration file, and then you can access them through `site.yourkey`. However, the values in these tables are used to control different aspects of the theme and are not arbitrary key-value pairs.

## Cascading configuration files

When you build or serve Jekyll, you specify the configuration file that you want Jekyll to use. If you have multiple sites you're building, you can put all the common configuration values into a base configuration file. For the unique configuration files, you put them into another configuration file. Jekyll will read multiple configuration files. 

The build command needs to look like this:

```
jekyll serve --config config_base.yml,config_designer.yml
```

Later configuration files will override settings in earlier configuration files. 


{{warning}} You cannot use a space after the period.{{end}}

## Configuration settings

| Field | Required? | Description |
|-------|-----------|-----------|
 |
| **project** | Required| A unique name for the project. The \_includes/custom/{project}/conditions.html file will use this project name to determine what sidebar and top nav data files to use. Make this value unique. |
| **audience** | Required | The audience for the output. Each sidebar entry in the \_data/sidebar.yml files needs to have an audience attribute that matches the value here in order for the sidebar item to be included.|
| **platform** | Required | The platform for the output. The function is the same as audience -- the sidebar file matches up with attributes defined in the configuration file to determine what sidebar items are included in the build.|
| **product** | Required | Same function as audience, platform, and version.
| **version**    |  Required | Same function as audience, platform, and product.
| **destination** | Required | The folder where the site is built. If you put this into your same folder as your other files, Jekyll may start building and rebuilding in an infinite loop because it detects more files in the project folder. Make sure you specify a folder outside your project folder, by using `../` or by specifying the absolute path, such as /Applications/XAMPP/xamppfiles/htdocs/myfolder. |
| **sidebar_tagline** | Optional | Appears above the sidebar. Usually you put some tag related to the site specific build, such as the audience.|     
| **sidebar_version** | Optional | Appears below the sidebar_tagline in a smaller font. Usually specifying the version of the documentation. |
| **topnav_title** | Required | Appears next to the home button in the top nav bar.|
| **homepage_title**| Required | You set the title for your homepage via this setting. This is because multiple files are being displayed on the index.md page depending on the project. Because index.md has `homepage: true` in the frontmatter, then the page layout will use the `homepage_title` property from the configuration file instead of the traditional title in the frontmatter.|
| **site_title**| Appears in the webpage title area (on the browser tab, not in the page viewing area). |       
| **port**  | Required  | The port used in the preview mode. This is only for the live preview and doesn't affect the published output. If you serve multiple outputs simultaneously, the port must be unique.  |         
| **feedback_email**    | Gets configured as the email address in the Send Feedback button in the top navigation bar.|
| **sidebar_accordion**  | Optional  | Boolean. Whether you want the navigation sidebar to use the accordion effect or not. The accordion effect means when you expand a section, the other sections auto-collapse. If you put false, then you can expand multiple sections at once. At the bottom of the navigation sidebar, two links will appear: Collapse All and Expand All. The default is true.|  
| **disqus_shortname** | Optional   | The disqus site shortname, which is used for comments. If you don't want comment forms via disqus, leave this blank or omit it altogether.    |         
| **markdown**  | Required  | The processor to use for Markdown. This is a Jekyll-specific setting.    |     
| **redcarpet**  | Required  | Extensions used with redcarpet. You can read more about them by searching for redcarpet extensions online.    |          
| **highlighter**  | Optional  | The syntax highlighter used. Rouge is also an option. I think Pygments does a better job. You will need to [install Pygments](http://pygments.org/download/) on your machine or else you will see an error. |
| **exclude**  | Optional  | A list of files and directories that you want excluded from the build. By default, all the content in your project is included in the output.    |       
| **permalink** | Required   |  The structure used for the link URLs. To read more about permalinks, see [Permalinks](http://jekyllrb.com/docs/permalinks/).   |          
|  **defaults** | Optional  | Here you can set default values for frontmatter based on the content type (page, post, or collection).    |          
|  **sass** | Required  | The directory for sass files. This is a Jekyll-specific settings. Sass isn't customized in this theme.    |        
|  **collections**  | Optional |  Any specific collections (custom content types that extend beyond pages or posts) that you want to define. This theme defines a collection called tooltips. You access this collection by using site.tooltips instead of site.pages or site.posts. Put the tooltip content types inside a folder in your project called \_tooltips. |
|  **print** | Optional | Boolean. Whether this build is a print build or not. This setting allows you to run conditions in your content such as {% raw %} {% if site.print == true %} do this... {% endif %} {% endraw %}.   |     
| **suffix** | Optional | If you publish on Salesforce's site.com, you have to add index.html to the permalink or else the page won't render. If you add `suffix: index.html` in your config file, this suffix will be appended in the homepage URL. If you're not publishing to Salesforce, don't add this property to your configuration file.|

## Where to store configuration files

In this theme, the configuration files are listed in the configs directory. There are some build scripts in the root directory that simply reference the configuration files.





