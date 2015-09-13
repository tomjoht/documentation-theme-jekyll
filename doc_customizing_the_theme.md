---
title: Customizing the theme
tags: [getting-started]
last_updated: August 12, 2015
keywords: getting started, customization, beginning steps, modifying the theme, modification
summary: "You start customizing the theme by gutting the existing content in this theme and replacing it with your own content. Start with the configuration files, then customize the data files, and add your own markdown pages in the root directory."
---


## About customizing the theme 

The theme shows two build outputs: one for designers, and one for writers. The dual outputs is an example of the single sourcing nature of the theme. The designers output is comprehensive, whereas the writers output is a subset of the information. Follow these steps to customize the theme with your own content.

{{site.data.alerts.important}} In these instructions, I'll assume your project's name is "acme." I'll also assume you have two audiences you're building your acme project for: marketers and developers. {{site.data.alerts.end}}

To customize the theme:

1. In the theme's root directory, rename config_writer.yml to config_marketer.yml and customize all the values inside that file based on the instructions in {{site.data.urls.doc_configuration_settings.link}}. Do the same with config_designer.yml (changing it to config_developer.yml) and continue to clone and customize the config file for other audiences you need.
    
    In this theme, each output requires a separate config file. If you have 10 audiences and you want separate sites for each, then then you'll have 10 config files in this directory. 

2. Make similar customizations to the PDF configuration files. You will later use these files when you create PDFs.
	
    {{site.data.alerts.tip}} As you customize the config files, make the port values unique so that you don't run into "Address already in use" issues when you build multiple sites and want to preview them at the same time.{{site.data.alerts.end}}
    
5. In the \_includes/custom directory, open conditions.html and customize the values there specific to your outputs. (Basically, replace `writer` with  `developer`, and `designer` with `marketer`.) 
    
    The conditions.html file is used to apply different requirements to the sidebar and other files. The conditions.html file is included in various parts of the theme &mdash; the sidebar.html, the topnav.html, and some of the print files. *conditions.html is sort of the brains of the theme.* If you don't have a specific value for audience, version, platform, or product, just put `all`.
    
6. Remove the pages that begin with "doc_" in the root directory, and then add your own pages here. Leave all the files flat in the root directory. 
	
	If you nest files inside folders, you'll create problems for the links and the theme will break. Yes, this will result in a lot of files in the root directory, but you can get around this issue with some viewing strategies in your text editor.
	
	For example, with WebStorm, if you press **Shift** twice and type the file name you want, the editor finds it. I usually have the preview mode open in another browser and navigate the content that way. When I want to edit a specific file, I copy the filename path from the preview browser, press **Shift** twice, and then it opens. You can also create a favorites section that just shows files you've added to Favorites (an option in the context menu).

7. Inside \_data, open sidebar_doc.yml and topnav_doc.yml and customize the navigation. 
    
    {{site.data.alerts.warning}} Don't mess up the spacing or change any of the YML level names or the site or sidebar won't appear. Each new YML level is indented with two spaces. Sometimes getting this spacing right is tricky. I recommend you save the sample template here that shows the various levels, and then just copy and paste the levels where you need them. YML is very picky and it can be frustrating sorting out spacing and level issues. {{site.data.alerts.end}}
    
9. In the root directory, customize the index.md file. This file will be the homepage for all of your projects.
	
    Use conditional tags (for example, `{% raw %}{% if site.project == "writers" %} ... {% endif %}{% endraw %}`) to change the content for different builds of your site. See {{site.data.urls.conditional_logic.link}} for more information on applying conditions.
    
10. In the \_includes folder, open footer.html and customize the content (namely the footer image). If you have different footers for different outputs, use conditional tags as you did with index.md.
11. Build your site with a command such as `jekyll serve --config configs/config_writers.yml` etc., and preview it at the URLs provided.