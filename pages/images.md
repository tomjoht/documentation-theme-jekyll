---
layout: page
title: Images
permalink: /images/
tags: formatting
---
{% include_relative reuse/variables.html %}

For images, create an images folder and put it in your root Jekyll directory. You can create subfolders inside the images directory. 

HTML syntax:

<img  title="my sample image" src="{{ "/images/jekyll-doc/sample.png" | prepend: site.baseurl }}">

Markdown syntax:

![My sample image]({{ "/images/jekyll-doc/sample.png" | prepend: site.baseurl }})
