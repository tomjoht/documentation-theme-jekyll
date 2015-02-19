---
title: Getting started
permalink: /getting_started/
---

Although you can get started with this theme by simply gutting the existing jekyll-docs theme and replacing it with your own content and values, that's not how I intended this theme to be used. I'm assuming that you may have multiple projects that you'll be publishing, and that you want to use the theme as a template for each project. As such, you can simply leave the jekyll-doc content as is. The following steps explain how to create a new project for the theme.

{{alertprimary}} In these instructions, to simplify things, I'm assuming your project's name is "ACME." Customize these instructions to swap in your real project name.{{end}}

To publish a new project with the jekyll-doc theme, do the following:

## Clone the jekyll-doc repository

1. `mkdir acme`
2. `cd acme`
3. git clone `https://github.com/tomjohnson1492/jekyll-doc.git .`

## Customize the blankproject folder inside projects

1. Inside the projects folder, change the name "blankproject" to your project's name -- e.g., acme. Note: If you don't change this folder name, the next time your run `git pull`, its contents (with same file names) will be overwritten. 

## Customize the configuration
1. In the configurations folder, rename config_blankproject.yml to config_acme.yml.
2. Open config_acme.yml and customize all the values. The file contains notes for each part you need to customize.

## Customize the pages
1. Open the pages folder inside acme. Here is where you add your pages. Leave the reuse and drafts folders there. You add links, callouts, and notes in those folders, so you can easily include them into your pages.

## Customize data

1. In the data folder, nav.yml contains the navigation for the sidebar and topnav. The current values are for the jekyll-doc theme, so you can see an example. Change these values with your own page titles and URLs.
2. In data/options.yml, open this file and customize the values.

## Duplicate and customize configurations

1. Inside the configurations folder, rename config_blankproject.yml to config_acme.yml.
2. Open config_acme.yml and customize with your own values. See notes in the file for each field.

## Duplicate and customize the build script

1. In the root directory, duplicate jekyll-doc.sh and rename it to acme.sh.
2. Open acme.sh and customize it as per the notes in the file. 

## Build your site

`cd` to your project folder.
Type `. acme.sh`.

{{calloutprimary}} You can run `git pull` to get updates to the theme. The updates will not overwrite your other project files that you have added. For example, the updates from the theme won't overwrite anything in content/acme. However, if you change content in content/jekyll-doc, the updates will overwrite that folder. In short, if your cloned repo has files A,B,C, D, E, F, and the repo has only files A, B, C, then only A, B, C, will be overwritten when you pull new updates. I won't add any new subfolders under projects other than jekyll-doc.{{end}}