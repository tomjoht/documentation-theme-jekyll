---
title: Tooltips
tags: [formatting]
keywords: popovers, tooltips, user interface text, glossaries, definitions
last_updated: July 3, 2016
summary: "You can add tooltips to any word, such as an acronym or specialized term. Tooltips work well for glossary definitions, because you don't have to keep repeating the definition, nor do you assume the reader already knows the word's meaning."
sidebar: mydoc_sidebar
permalink: mydoc_adding_tooltips.html
folder: mydoc
---

## Creating tooltips
Because this theme is built on Bootstrap, you can simply use a specific attribute on an element to insert a tooltip. Add `data-bs-toggle="tooltip"` to the element, and put the tooltip text in `data-bs-title`. The theme's js/customscripts.js file turns on every tooltip when the page loads. (Tooltips written for earlier versions of the theme, with `data-toggle` and `data-original-title`, still work.)

Suppose you have a glossary.yml file inside your \_data folder. You could pull in that glossary definition like this:

{% raw %}
```html
<a href="#" data-bs-toggle="tooltip" data-bs-title="{{site.data.glossary.jekyll_platform}}">Jekyll</a> is my favorite tool for building websites.
```
{% endraw %}

This renders to the following:

<a href="#" data-bs-toggle="tooltip" data-bs-title="{{site.data.glossary.jekyll_platform}}">Jekyll</a> is my favorite tool for building websites.

{% include links.html %}
