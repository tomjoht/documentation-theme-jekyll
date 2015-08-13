---
title: Configuration settings
tags: [single-sourcing, publishing]
keywords: configuration, config, publishing options, outputs, projects
last_updated: August 12, 2015
summary: "The configuration file contains important settings for your project. Some of the values you set here affect &mdash; especially the product, platform, audience, and version &mdash; the display and functionality of the theme."
---
{% include linkrefs.html %} 

## Importance of Configuration File

The configuration file serves important functions with single sourcing. For each site output, you create a unique configuration file for that output. 

The configuration file contains all the settings and other details unique to that site output, such as variables, titles, output directories, build folders, and more.

{{warning}} This theme is coded to look for specific values set by the configuration file. If something isn't working correctly, check to make sure that you have the configuration values that are defined here.{{end}}

## Configuration file options

Some of the options you can set in the configuration file determine theme settings. 

Note that you can define arbitrary key-value pairs in the configuration file, and then you can access them through `site.yourkey`, where `yourkey` is the name of the key. However, the values in these tables are used to control different aspects of the theme and are not arbitrary key-value pairs.

## Configuration settings for web outputs

| Field | Required? | Description |
|-------|-----------|-----------|
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

## Configuration settings for PDF output

The PDF configuration files build on all the settings in the web configuration files, but they add a few more options. 

When you build the PDF output (such as for the writers output), the command will look like this:

```
jekyll serve --detach --config configs/config_writers.yml,configs/config_writers_pdf.yml
```

First Jekyll will read the config_writers.yml file, and then Jekyll will read the config_writers_pdf.yml file.
 
More detail about generating PDFs is provided in {{doc_generating_pdfs}}, but the configuration settings used for the PDFs are described here.

The process for creating PDFs relies on two steps:

1. First you build a printer-friendly web version of the content. 
2. Then you run PrinceXML to get all the printer-friendly web pages and package them into a PDF.

Thus, you actually build a web version for the PDF first before generating the PDF. (You might be able to remove this first step by doing more coding, but I found it easier just to strip out components I didn't want included and make other adjustments.)

| Field | Required? | Description |
|-------|-----------|-----------|
| destination | Where the PDF web version should be served so that Prince XML can find it. By default, this is in ../doc_designers-pdf, so just one level above where your project is.  |
| url | The URL where the files can be viewed. This is `http://127.0.0.1:4002` in the sample theme files for the designers output. Prince XML requires a URL to access the file. (My attempts to use local file paths didn't work.) |
| baseurl | The subdirectory after the url where the content is stored. In the sample theme files for the designers output, this is `/designers`. | 
| port | The port required by the preview server. |
| print | A boolean so that you can construct conditional statements in your content to check whether print is true or not. This setting can help you filter out content that doesn't fit well into a PDF (such as dynamic web elements). |
| print_title | The title for the PDF. In the sample theme files for designers output, the print title is "Jekyll Documentation Theme for Designers"|
| print_subtitle | The subtitle for the PDF. In the sample theme files, the subtitle is "version 3.0." |
| defaults | See the sample settings in the config_designers_pdf.yml file. The only difference between this file and config_designers.yml is that the layout used for pages is `page_print` instead of `page`. The `page_print` layout also used `head_print` instead of `head`. This layout strips out components such as the sidebar and top navigation. It also leverages printstyles.css and includes some JavaScript for Prince XML. |



