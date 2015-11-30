---
title: 5. Customize the conditions file
tags: 
  - navigation
keywords: "single sourcing, conditions, filtering, attributes, logic"
last_updated: "November 30, 2015"
summary: "The conditions file is included in various parts of the theme. Its purpose is to set attributes as variables that affect how the theme is constructed. The settings in this file are essential for single sourcing."
series: "Getting Started"
weight: 7
---

{% include custom/mydoc/getting_started_series.html %}

## About the conditions.html file
The conditions file is a critical file that sets certain variables used in constructing the theme. You already set some of these values in the configuration file, but you need to duplicate some of the settings here. In this file, the settings are variable assignments.

This file is used as include in certain files. When used as an include, it sets variables that are used to configure your theme. Because you're single sourcing your Jekyll content, you need this file.

## Customize the conditions file

In the \_includes/custom directory, open the conditions.html file. Duplicate one of the project settings blocks like this:

{% raw %}
```
{% if site.project == "mydoc_writers" %}
{% assign audience = "writers" %}
{% assign sidebar = site.data.mydoc.mydoc_sidebar.entries %}
{% assign topnav = site.data.mydoc.mydoc_topnav.topnav %}
{% assign topnav_dropdowns = site.data.mydoc.mydoc_topnav.topnav_dropdowns %}
{% assign version = "all" %}
{% assign product = "all" %}
{% assign platform = "all" %}
{% assign projectTags = site.data.mydoc.mydoc_tags.allowed-tags %}
{% assign projectFolder = "mydoc" %}
{% endif %}
```
{% endraw %}

You need to duplicate this block for each output you have.

Once you've duplicated the block, make a few customizations:

* In each place that "mydoc" appears, change "mydoc" to "acme". 
* Use the same attributes for project, audience, version, product, and platform that you used in your configuration file. (If you don't have a specific attribute value that you need, just put "all".) The values here have to exactly match those in the configuration file.

{{site.data.alerts.tip}} If you want to create signposts in the code as shown in the conditions.html file, install a utility called [figlets](http://www.figlet.org/) on your Mac. The figlets just make scanning long code blocks easier. If you have 15+ configuration groupings in your conditions file, the figlets make it easy to scan.{{site.data.alerts.end}}

{% include custom/mydoc/getting_started_series_next.html %}

