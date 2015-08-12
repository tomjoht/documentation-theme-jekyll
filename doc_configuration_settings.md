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

{{warning}} This theme is coded to look for specific values set by the configuration file. If something isn't working correctly, check to make sure that you have the configuration values that are defined here.{{end}}

## Configuration file options

Some of the options you can set in the configuration file determine theme settings. 

Note that you can define arbitrary key-value pairs in the configuration file, and then you can access them through `site.yourkey`, where `yourkey` is the name of the key. However, the values in these tables are used to control different aspects of the theme and are not arbitrary key-value pairs.

## Configuration settings

| Field | Required? | Description |
|-------|-----------|-----------|
 |
| **project** | Required| A unique name for the project. The \_includes/custom/{project}/conditions.html file will use this project name to determine what sidebar and top nav data files to use. Make this value unique. |
| **audience** | Required | The audience for the output. Each entry in \_data/sidebar_doc.yml and  \_data/topnav_doc.yml needs to have an audience attribute that matches the value here in order for the sidebar or topnav item to be included.|
| **platform** | Required | The platform for the output. See additional information in audience.
| **product** | Required | The product for the output. See additional information in audience.
| **version**    |  Required | The version for the output. See additional information in audience.
| **destination** | Required | The folder where the site is built. If you put this into your same folder as your other files, Jekyll may start building and rebuilding in an infinite loop because it detects more files in the project folder. Make sure you specify a folder outside your project folder, by using `../` or by specifying the absolute path, such as /Applications/XAMPP/xamppfiles/htdocs/myfolder. |
| **sidebar_tagline** | Optional | Appears above the sidebar. Usually you put some term related to the site specific build, such as the audience. In the sample theme files, the taglines are "writers" and "designers."|     
| **sidebar_version** | Optional | Appears below the sidebar_tagline in a smaller font, usually specifying the version of the documentation. In the sample theme files, the version is "3.0."|
| **topnav_title** | Required | Appears next to the home button in the top nav bar. In the sample theme files, the topnav_title is "Jekyll Documentation Theme." |
| **homepage_title**| Required | You set the title for your homepage via this setting. This is because multiple projects are all using the same index.md as their homepage. Because index.md has `homepage: true` in the frontmatter, the "page" layout will use the `homepage_title` property from the configuration file instead of the traditional title in the frontmatter. In the sample theme files, the homepage title is "Jekyll Documentation Theme -- {audience}." |
| **site_title**| Appears in the webpage title area (on the browser tab, not in the page viewing area). In the sample theme files, the site title is the "page name | homepage title." |       
| **port**  | Required  | The port used in the preview mode. This is only for the live preview and doesn't affect the published output. If you serve multiple outputs simultaneously, the port must be unique.  |        
| **feedback_email**    | Gets configured as the email address in the Send Feedback button in the top navigation bar.|
| **sidebar_accordion**  | Optional  | Boolean. The default value is true. Whether you want the navigation sidebar to use the accordion effect or not. The accordion effect means when you expand a section, the other sections automatically collapse. If you put `false`, then you can expand multiple sections at once. At the bottom of the navigation sidebar, two links will appear: Collapse All and Expand All. |  
| **disqus_shortname** | Optional   | The disqus site shortname, which is used for comments. If you don't want comment forms via disqus, leave this blank or omit it altogether and Disqus won't appear.   |         
| **markdown**  | Required  | The processor to use for Markdown. This is a Jekyll-specific setting.    |     
| **redcarpet**  | Required  | Extensions used with redcarpet. You can read more about them by searching for redcarpet extensions online.    |          
| **highlighter**  | Optional  | The syntax highlighter used. `rouge` is also an option. I think Pygments does a better job. You will need to [install Pygments](http://pygments.org/download/) on your machine or else you will see an error. |
| **exclude**  | Optional  | A list of files and directories that you want excluded from the build. By default, all the content in your project is included in the output. |          
|  **defaults** | Optional  | Here you can set default values for frontmatter based on the content type (page, post, or collection).    |          
|  **collections**  | Optional |  Any specific collections (custom content types that extend beyond pages or posts) that you want to define. This theme defines a collection called tooltips. You access this collection by using site.tooltips instead of site.pages or site.posts. Put the tooltip content types inside a folder in your project called \_tooltips. |
|  **print** | Optional | Boolean. Whether this build is a print build or not. This setting allows you to run conditions in your content such as {% raw %} {% if site.print == true %} do this... {% endif %} {% endraw %}.   |     
| **suffix** | Optional | If you publish on Salesforce's site.com, you have to add index.html to the permalink or else the page won't render. If you add `suffix: index.html` in your config file, this suffix will be appended in the homepage URL. If you're not publishing to Salesforce, don't add this property to your configuration file.|

## Where to store configuration files

In this theme, the configuration files are listed in the configs directory. There are some build scripts in the root directory that simply reference the configuration files.

## The conditional attributes

Each configuration file must specify values for the conditional attributes:

* project
* product
* platform
* audience
* version

The sidebar.html and topnav.html files apply conditional logic based on the values for these conditional attributes. 

For example, you will see this kind of logic in the sidebar and topnav files: 

```
{% raw %}
 {% if item.audience contains audience and item.product contains product and item.platform contains platform and item.version contains version and item.web != false %}
{% endraw %}
```

If all of these conditions are met, then the item will qualify to be included in the sidebar or top navigation file. That is why each item in the sidebar_doc.yml or topnav_doc.yml file includes similar properties to match: 

```
- title: Pages
  url: /doc_pages.html
  audience: writers, designers
  platform: all
  product: all
  version: all
```

The file in \_includes/custom/doc/conditions.html contains a project setting and also assigns general names for each of these specific values. This way the same theme files can be used interchangeably depending on the assignments, whose values are specified in the configuration file.

It's a little complicated to describe, but it works. Once you configure your project correctly, you don't even think about how the theme is processing all of this on the backend.




