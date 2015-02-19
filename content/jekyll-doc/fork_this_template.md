---
layout: page
title: Getting started
permalink: /fork_this_template/
tags: gettingStarted
published: true
---

(not sure if this is needed anymore ...)

The easiest way to understand how Jekyll works is to fork this template and start your own project using it. You are free to use this entire theme and anything it contains. I forked this original theme from [Shiori](https://github.com/ellekasai/shiori/). The theme is built on Bootstrap, which is a free resource from [getbootstrap.com](http://getbootstrap.com) and [http://bootply.com](bootply.com)).

You should note that I'm using a Mac. If you're using Windows, you'll need to follow Windows specific instructions for installing Jekyll on Windows.

## Prerequisites

Install the following first:

* Git
* Jekyll

## Forking the theme

1. Download the content from Github here: 
2. cd to the folder and start the Jekyll server: `jekyll serve --config config_web.yml --destination site_web`. As a shortcut, you can also just type `. web.sh` because I put this into a shell script. 

Note that you normally just use `jekyll serve` to start the server, but I'm defining a specific configuration file to be used in the build as well as a specific destination folder for the output. You need this specificity if you're single sourcing your content into different channels.
    
Here's how I organized things:

## Content

I put files into a subdirectory called "web". It's important to use subfolders for each set of information that you want to possibly exclude from an output. If you look in the configuration file, you'll see that certain excludes are set for content that I don't want included. Excludes can be based on folders or directories.

## Configuration 

Customize the values in the configuration section.

