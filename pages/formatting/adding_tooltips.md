---
title: Adding tooltips
permalink: /adding_tooltips/
tags: []
keywords: 
audience: 
last_updated: 
summary: 
---
{% include linkrefs.html %} 

You can add tooltips to your content. Because this theme is built on Bootstrap, you can simply use a specific attribute on an element to insert a tooltip.

Suppose you have a glossary.yml file inside your _data folder. You could pull in that glossary definition like this:

{% raw %}
```html
<a href="#" data-toggle="tooltip" data-original-title="{{site.data.glossary.jekyll_platform}}">Jekyll</a> is my favorite tool for building websites.</a>
```
{% endraw %}

This renders to the following: 

<a href="#" data-toggle="tooltip" data-original-title="{{site.data.glossary.jekyll_platform}}">Jekyll</a> is my favorite tool for building websites.</a>

