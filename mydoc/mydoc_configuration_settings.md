---
title: 4. Set the configuration options
tags: [single_sourcing, publishing]
keywords: configuration, config, publishing options, outputs, projects
last_updated: November 30, 2015
summary: "The configuration file contains important settings for your project. Some of the values you set here affect the display and functionality of the theme &mdash; especially the product, platform, audience, and version."
series: "Getting Started"
weight: 4
---
{% include custom/mydoc/getting_started_series.html %}

## Importance of the configuration file

The configuration file serves important functions with single sourcing. For each site output, you create a unique configuration file for that output. 

The configuration file contains most of the settings and other details unique to that site output, such as variables, titles, output directories, build folders, and more.

## Change the project name within the config file

By default, the config file contains the project name, such as mydoc, in numerous places. You can do a find and replace in each of the configuration files to replace "mydoc" with your new project's name. You can also fine tune the configuration settings by looking at what each of them does (as described in the following sections).

## Update the exclude list

By default, all the files in the Jekyll project are included in the output. You have two manually tell Jekyll which files and folders you want to exclude from the output. In  each configuration file there is an `exclude` property that takes a list of items that should be excluded from the build.

In the new configuration file that you created, exclude the mydoc folder and any other mydoc files that you don't want to be output. Similarly, update the mydoc configuration files to exclude the new project that you added.
 
Manually excluding files from the output is one of pain points in Jekyll that I could never solve. Jekyll was not designed for multiple output publishing but was conceived as a way to manage files for a single website.

## Configuration file variables

You can define arbitrary key-value pairs in the configuration file, and then you can access them through `site.yourkey`, where `yourkey` is the name of the key. 

However, some of the options you set in the configuration file determine theme settings. These options are required for this theme to work. The required settings are defined in the following tables.

## Configuration settings for web outputs

The values in the following tables are used to control different aspects of the theme and are not arbitrary key-value pairs. As you set up your project, enter the appropriate values for each of these keys in the configuration file.

If you're unsure how or where the project setting affects the theme, just search for the project setting in the theme (for example, `site.sidebar_version`) and you'll see the files involved.

The order of the settings doesn't matter. 

| Field | Required? | Description |
|-------|-----------|-----------|
| **project** | Required| A unique name for the project. The \_includes/custom/conditions.html file will use this project name to determine what sidebar and top nav data files to use. Make this value unique. Note that the project name also determines what conditions are set in the conditions.html file. It's critical that the project name you specify in the configuration file matches the project names in the conditions.html file. Otherwise, the conditions.html file won't be able to set the right variables needed for single sourcing. (Admittedly, the settings for these attributes are somewhat duplicated between the conditions.html and configuration file.)|
| **audience** | Required | The audience for the output. This value is also set in the \_includes/custom/conditions.html file. Each entry in \_data/sidebar_doc.yml and  \_data/topnav_doc.yml needs to have an audience attribute that matches the correct audience value in order for the sidebar or topnav item to be included.|
| **platform** | Required | The platform for the output. The same matching logic applies as with audience.
| **product** | Required | The product for the output. The same matching logic applies as with audience.
| **version**    |  Required | The version for the output. The same matching logic applies as with audience.
| **destination** | Required | The folder where the site is built. If you put this into your same folder as your other files, Jekyll may start building and rebuilding in an infinite loop because it detects more files in the project folder. Make sure you specify a folder outside your project folder, by using `../` or by specifying the absolute path. The recommended output folder is `../doc_outputs`. The PDF configuration files will look in that directory for the outputs needed to build the PDF outputs.|
| **sidebar_tagline** | Optional | Appears above the sidebar. Usually you put some term related to the site specific build, such as the audience name. In the sample theme files, the taglines are "writers" and "designers." Keep these short &mdash; there's not much room. Six or seven letters is perfect.|     
| **sidebar_version** | Optional | Appears below the sidebar_tagline in a smaller font, usually specifying the version of the documentation. In the sample theme files, the version is "4.0."|
| **topnav_title** | Required | Appears next to the home icon in the top nav bar. In the sample theme files, the topnav_title is "Jekyll Documentation Theme." |
| **homepage_title**| Required | You set the title for your homepage via this setting. This is because multiple projects are all using the same index.md as their homepage. Because index.md has `homepage: true` in the frontmatter, the "page" layout will use the `homepage_title` property from the configuration file instead of the traditional title in the frontmatter. In the sample theme files, the homepage title is "Jekyll Documentation Theme &mdash; writers" or "Jekyll Documentation Theme &mdash; designers." |
| **site_title**| Required | Appears in the webpage title area (on the browser tab, not in the page viewing area). In the sample theme files, the site title is rendered as {% raw %}`{{ page.title }}{% endif %}  | {{ site.site_title }}`{% endraw %} (these values get dynamically replaced depending on the page name and title). |       
| **port**  | Required  | The port used in the preview mode. This is only for the live preview and doesn't affect the published output. If you serve multiple outputs simultaneously, the port must be unique.  |       
| **feedback_email** | Required   | Gets configured as the email address in the Send Feedback button in the top navigation bar.|
| **disqus_shortname** | Optional   | The Disqus site shortname, which is used for comments. If you don't want comment forms via disqus, leave this blank or omit it altogether and Disqus won't appear.   |         
| **markdown**  | Required  | The processor used to convert Markdown to HTML. This is a Jekyll-specific setting. Use `redcarpet`. Another option is `kramdown`. However, my examples will follow redcarpet.   |     
| **redcarpet**  | Required  | Extensions used with redcarpet. You can read more about the Red Carpet extensions [here](https://github.com/vmg/redcarpet).   |          
| **highlighter**  | Required  | The syntax highlighter used. Use `rouge` because it has fewer dependencies on your operating system (it doesn't require Python). However, you can also use `pygments`. If so, you may need need to [install Pygments](http://pygments.org/download/).  |
| **exclude**  | Optional  | A list of files and directories that you want excluded from the build. By default, all the content in your project is included in the output. If you don't want to include a file or directory, list it here. It's helpful to name your files with a prefix such as product_audience_filename.md, so that you can exclude using wildcards such as "product*" or product_audience*". For more information about excluding files, see {{site.data.mydoc.mydoc_urls.mydoc_excluding_files.link}}. |          
|  **defaults** | Optional  | Here you can set default values for frontmatter based on the content type (page, post, or collection).    |          
|  **collections**  | Optional |  Any specific collections (custom content types that extend beyond pages or posts) that you want to define. This theme defines a collection called tooltips. You access this collection by using site.tooltips instead of site.pages or site.posts. Put the tooltip content types inside a folder in your project called \_tooltips. Tooltips are useful for creating UI content. For more information about creating tooltips for UI text, see {{site.data.mydoc.mydoc_urls.mydoc_help_api.link}}. |
|  **output** | Optional | Boolean. Whether this build is `web` or `pdf`. This setting allows you to run conditions in your content such as {% raw %} `{% if site.output == pdf %}` do this... `{% endif %}` {% endraw %}. Limit the options to just `web` or `pdf` for this setting.  |     
| **github_editme_path** | Optional | A path to configure the Github Edit Me button. Put the path to the branch on Github where you want to edit the theme. Here's a sample: `tomjohnson1492/documentation-theme-jekyll/edit/reviews`. In this case, "reviews" is the name of the branch where I want people to make edits. I can then merge the "reviews" branch with the "gh-pages" branch (which is the default branch). See the "page" layout (inside the \_layouts folder) for how this path gets inserted into the rest of the HTML.|
| **company_name** | Optional | Used in the footer to brand your site.|
| **footer_image_location** | Optional | The image used in the footer to brand your site. Store this image in the common_images folder so that it's not excluded by a particular project. Example: ../common_images/company_logo.png|
| **theme_file** | Optional | The theme used for the output. Currently there are two options: theme-green.css or theme-blue.css. These themes cover both web and PDF output. The themes have the same style and layout. They only differ in the accent color for the top nav bar, buttons, hyperlinks, and other small details. |
| **pdf_file_name** | Optional | The name of the PDF file generated by Prince. This is helpful for the code on the home.md page that allows users to download a PDF of the material. If you have 5 different PDFs, you don't want to use `if` statements to render different PDF buttons. Instead, this theme uses the same PDF code but swaps out the PDF file name with a variable here. |

## Where to store configuration files

In this theme, all the configuration files are listed in the configs directory. There are some build scripts in the root directory that reference the configuration files in this configs folder.

There's also a \_config.yml file in the root directory. This is simply copied from the configs directory and used to accommodate publishing with Github Pages.

## Configuration settings for PDF output

The PDF configuration files build on all the settings in the web configuration files, but they add a few more options. 

When you build the PDF output (such as for the writers output), the command will look like this:

```
jekyll serve --detach --config configs/config_writers.yml,configs/config_writers_pdf.yml
```

First Jekyll will read the config_writers.yml file, and then Jekyll will read the config_writers_pdf.yml file. Values from both configuration files will be used, but the later configuration file (on the right) will overwrite any values set in the previous configuration file (on the left). 

(Previously people running Windows reported problems with cascading the configuration files like this. If you're on Windows, for PDF outputs, you may need to combine the settings from the web configuration file into the PDF configuration file.)
 
More detail about generating PDFs is provided in {{site.data.mydoc.mydoc_urls.mydoc_generating_pdfs.link}}, but the configuration settings used for the PDFs are described here.

The process for creating PDFs relies on two steps:

1. First you build a printer-friendly web version of the content. 
2. Then you run PrinceXML to get all the printer-friendly web pages and package them into a PDF.

Thus, you actually build a web version for the PDF first before generating the PDF.

The following table describes the settings in the PDF configuration file.

| Field | Required? | Description |
|-------|-----------|-----------|
| **destination** | Where the PDF web version should be served so that Prince XML can find it. By default, this is in `../mydoc_designers-pdf`, which is just one level above where your project is.  |
| **url** | The URL where the files can be viewed. This is `http://127.0.0.1:4002` in the sample theme files for the designers output. Prince XML requires a URL to access the file.  |
| **baseurl** | The subdirectory after the url where the content is stored. In the sample theme files for the designers output, this is `/designers`. | 
| **port** | The port required by the preview server. |
| **output** | `web` or `pdf`. This setting allows you to construct conditional statements in your content to check whether output is web or pdf. This setting can help you filter out content that doesn't fit well into a PDF (such as dynamic web elements). In particular, the Prince XML script conflicts with any JavaScript on the page, so you want to filter out the JavaScript from the PDF-friendly HTML output that Prince consumes.|
| **print_title** | The title for the PDF. In the sample theme files for designers output, the print title is "Jekyll Documentation Theme for Designers"|
| **print_subtitle** | The subtitle for the PDF. In the sample theme files, the subtitle is "version 4.0." |
| **defaults** | See the sample settings in the config_designers_pdf.yml file. The only difference between this file and config_designers.yml is that the layout used for pages is `page_print` instead of `page`. The `page_print` layout also used `head_print` instead of `head`. This layout strips out components such as the sidebar and top navigation. It also leverages printstyles.css and includes some JavaScript for Prince XML. |

{% include custom/mydoc/getting_started_series_next.html %}