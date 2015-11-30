---
title: Knowledge-base layout
tags: [special_layouts]
keywords: knowledge base, support portal, grid, doc portal
last_updated: November 30, 2015
summary: "This shows a sample layout for a knowledge base. Each square could link to a tag archive page. In this example, font icons from Font Awesome are enlarged to a large size. You can also add captions below each icon."
---


<div class="row">
          <div class="col-md-4"><a class="noCrossRef" href="tag_getting_started.html"><i class="fa fa-file-image-o fa-8x border"></i><div class="kbCaption">Getting Started</div></a></div>
          <div class="col-md-4"><a class="noCrossRef" href="tag_navigation.html"><i class="fa fa-bar-chart-o fa-8x border"></i><div class="kbCaption">Navigation</a></div></div>
          <div class="col-md-4"><a class="noCrossRef" href="tag_single_sourcing.html"><i class="fa fa-code fa-8x border"></i><div class="kbCaption">single_sourcing</div></a></div>
</div>
<p>&nbsp;</p>
<div class="row">
          <div class="col-md-4"><a class="noCrossRef" href="tag_publishing.html"><i class="fa fa-dashboard fa-8x border"></i><div class="kbCaption">Publishing</div></a></div>
          <div class="col-md-4"><a class="noCrossRef" href="tag_special_layouts.html"><i class="fa fa-desktop fa-8x border"></i><div class="kbCaption">Special layouts</div></a></div>
          <div class="col-md-4"><a class="noCrossRef" href="tag_formatting.html"><i class="fa fa-cloud fa-8x border"></i><div class="kbCaption">Formatting</div></a></div>
</div>
        
## Generating a list of all pages with a certain tag

If you don't want to link to a tag archive index, but instead want to list all pages that have a certain tag, you could use this code:

{% raw %}
```html
Getting started pages:
<ul>
{% assign sorted_pages = (site.pages | sort: 'title') %}
{% for page in sorted_pages %}
{% for tag in page.tags %}
{% if tag == "getting_started" %}
<li><a href="{{page.url | prepend: '..'}}">{{page.title}}</a></li>
{% endif %}
{% endfor %}
{% endfor %} 
</ul>
```
{% endraw %}

Getting started pages:

<ul>
{% assign sorted_pages = (site.pages | sort: 'title') %}
{% for page in sorted_pages %}
{% for tag in page.tags %}
{% if tag == "getting_started" %}
<li><a href="{{page.url | prepend: '..'}}">{{page.title}}</a></li>
{% endif %}
{% endfor %}
{% endfor %} 
</ul>