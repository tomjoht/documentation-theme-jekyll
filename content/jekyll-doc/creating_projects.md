---
title: Creating new projects
permalink: /creating_projects/
---

Although you can get started with this theme by simply gutting the existing jekyll-docs theme and replacing it with your own content and values, that's not how I intended this theme to be used. I'm assuming that you may have multiple projects that you'll be publishing, and that you want to use the theme as a template for each project. As such, you can simply leave the jekyll-doc content as is. The following steps explain how to create a new project for the theme.

Let's say you're creating a new project called "ACME." To publish a new project with the theme, do the following:

## Clone the jekyll-doc repository

1. `mkdir acme`
2. `cd acme`
3. git clone `https://github.com/tomjohnson1492/jekyll-doc.git .`

## Duplicate and customize configurations

1. Inside the configurations folder, duplicate the config_jekyll-doc.yml file and rename it to config_acme.yml.
2. Open config_acme.yml and customize with your own values. See notes in the file for each field.

## Duplicate and customize settings

1. In the settings folder, duplicate jekyll-doc and rename it to acme.
2. In settings/acme, open nav.yml and options.yml and customize the files with your own values. See notes in the file for each field.

## Duplicate and customize content

1. In the content folder, duplicate jekyll-doc and rename it to your project.

## Duplicate and customize the build script

1. In the root directory, duplicate jekyll-doc.sh and rename it to jekyll-acme.sh.
2. Open jekyll-acme.sh and customize it as per the notes in the file. 

## Build your site

`cd` to your project folder.
Type `. acme.sh`.

{{calloutprimary}} You can run `git pull` to get updates to the theme. The updates will not overwrite your other project files. For example, the updates from the theme won't overwrite anything in content/acme. However, if you change content in content/jekyll-doc, the updates will overwrite that folder. 