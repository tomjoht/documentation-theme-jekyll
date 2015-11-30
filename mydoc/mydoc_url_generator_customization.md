---
title: 8. Customize the URL generator
tags: 
  - navigation
keywords: "URL generator, link generator, links, hyperlinks"
last_updated: "November 30, 2015"
summary: "You need to customize the URL generator with your project's name. This generator helps you make quick links within your content."
series: "Getting Started"
weight: 8
---

{% include custom/mydoc/getting_started_series.html %}

## About the URL generator

The URL generator is a special file that helps you generate the code you need for links. This generator helps you avoid broken links, and ensures more consistency.

To learn more about the linking strategy used with this theme, see {{site.data.mydoc.mydoc_urls.mydoc_hyperlinks.link}}. The step here simply explains how to customize the URL generator for a new project.

## Customize the URL generator

1. In the project root directory, open urls_acme.txt (a file you should have already duplicated from urls_mydoc.txt) in an earlier step.
2. Do a find a replace for "mydoc" with "acme".
3. Change the project conditions at the top:
	
	{% raw %}
	```
	{% if site.project == "mydoc_writers" or site.project == "mydoc_designers" %}
	```
	{% endraw %}
	
	Add all the projects here that will use this URL generator. For example, if you have 3 different projects, list them here. Otherwise the file's contents will be replaced with the values from the latest project that you run.

Notice that this URL generator iterates through the sidebar file only, and it doesn't apply the attribute qualifiers as with the sidebar.html file. As such, this URL generator will work with the output from any of the project files.

{% include custom/mydoc/getting_started_series_next.html %}