---
title: 2. Add a new project
tags: [getting_started]
last_updated: November 30, 2015
keywords: getting started, customization, beginning steps, modifying the theme, modification
summary: "You add a new project essentially by duplicating all the mydoc project files in the _data, _includes, configs, and other folders. You can add as many projects as you want in this theme."
series: "Getting Started"
weight: 2
---

{% include custom/mydoc/getting_started_series.html %}

## About customizing the theme 

The theme shows two build outputs: one for designers, and one for writers. The dual outputs is an example of the single sourcing nature of the theme. The designers output is comprehensive, whereas the writers output is a subset of the information. However, the outputs are mostly the same. I just created the separate output to demonstrate how the single sourcing aspect works. 

You can add as many documentation projects as you want to the same Jekyll project. Some doc projects have multiple outputs, as is the case with the designers and writers outputs for the mydoc project. 

## Add a new project
Follow these steps to add additional projects.

{{site.data.alerts.important}} In these instructions, I'll assume your project's name is "acme." Replace "acme" with the real name of your project. {{site.data.alerts.end}}

### 1. Copy and customize the mydoc folder in _data

Inside the \_data folder, copy the mydoc folder and its contents. Rename it to acme, and then rename each of the YML files inside the folder with the acme prefix.

The files in data control how the side and top nav bar get populated. Here is also where URLs, definitions, and other settings are stored.

### 2. Copy and customize the mydoc folder in configs

In the configs folder, copy the mydoc folder and its contents. Rename it to acme, and then rename each of the config_ files to the outputs you need for your acme project. 

In this theme, each output requires a separate config file. If you have 10 audiences and you want separate sites for each, then then you'll have 10 config files in this directory. 

Change the file names from config_writers.yml and so forth to whatever file names best represent the audiences for your outputs.

More details about customizing the settings in the configuration files will be explained later. For now you're just duplicating the necessary project files for your new project.

### 3. Create a new folder inside \_includes/custom

In the _includes/custom directory, add a new folder there called "acme." This folder should sit parallel to the mydoc folder. This is where you can store includes for your project. 

### 4. Add a new folder in the root directory

In the root directory, add a folder for your pages called acme (similar to the mydoc folder). Include two subfolders inside acme: files and images.

Inside the mydoc folder, copy the home.md file and add it to the acme folder. (With most Jekyll projects, they open up on the index.html file in the root directory. However, because the pages for each project are stored in subfolders, it was necessary to create a redirect from the index page to the home.md page.)

This acme directory is where you'll store all your pages. 

Note that you cannot create subfolders in this acme directory. All of your pages have to be flat in this directory. This is because the references to the resources (stylesheets, javascript, etc.) are relative, and creating additional directory levels will break the relative paths.

### 5. Copy and customize the mydoc shell scripts in the root directory

In the root directory, duplicate the shell scripts (the file extension is .sh) and rename the prefix to "acme_". The following files are the shell scripts that need to be duplicated:

* mydoc_1_multiserve_pdf.sh
* mydoc_2_multibuild_pdf.sh
* mydoc_3_multibuild_web.sh
* mydoc_4_publish.sh
* mydoc_all.sh

### 6. Copy the URL generator text file

In the root directory, copy urls_mydoc.txt and duplicate it. Change the suffix to urls_acme.txt.

{{site.data.alerts.tip}} In this step, you're just duplicating project files. In later steps, you'll actually customize all of the settings. {{site.data.alerts.end}}

{% include custom/mydoc/getting_started_series_next.html %}


 



