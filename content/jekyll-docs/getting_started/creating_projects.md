---
title: Getting started
permalink: /creating_projects/
---

Although you can get started with this theme by simply gutting the existing jekyll-docs theme and replacing it with your own content and values, that's not how I intended this theme to be used. I'm assuming that you may have multiple projects that you'll be publishing, and that you want to use the theme as a template for each project. As such, you can simply leave the jekyll-docs content as is. The following steps explain how to create a new project for the theme.

Let's say you're creating a new project called "ACME." To publish a new project with the theme, do the following:

1. Clone the Jekyll-doc files from the github repository: [https://github.com/tomjohnson1492/jekyll-doc](https://github.com/tomjohnson1492/jekyll-doc).
2. Inside the configuration folder, duplicate the config_basicproject.yml file and rename it with your project (e.g., config_acme.yml). 
3. Open the configuration file you just created and customize the values for your new project. (The file contains notes for each field.) 
4. In the configuration file, customize the `data_source` value with a folder name corresponding to your project (e.g., settings/acme). (This step is critical.)
5. Inside the settings folder, duplicate the jekyll-docs folder (and its nav.yml and options.yml contents), and then change the name to your project's name (for example, settings/acme).
6. Create a folder inside "content" that matches your project's title. For example, if your project's name is ACME, create a folder inside content called "acme".
7. Add some pages inside the folder you created in the previous step (content/acme). The pages can be Markdown or HTML. Each page must have frontmatter. See the jekyll-doc pages inside content/jekyll-doc for examples.
8. Inside the settings/acme folder, open the nav.yml and options.yml and customize the values with the pages for your theme. Since you probably won't have pages set up you, you can just make a mental note of these files for later customization.
9. In the theme's root directory, duplicate the config_basicproject.sh file and change it to your project name (e.g., config_acme.sh). Open the config_acme.sh file and customize it so the configuration file and output destination are customized for your project.
10. To build your project, open Terminal, `cd` to your path, and type `. config_acme.sh`.