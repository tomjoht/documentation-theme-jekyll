---
title: Knowledge-base layout
tags: [special_layouts]
keywords: knowledge base, support portal, grid, doc portal
last_updated: July 3, 2016
summary: "This shows a sample layout for a knowledge base. Each square could link to a tag archive page. In this example, font icons from Font Awesome are used for the graphics, and the layout is pulled from the Modern Business theme. ."
sidebar: mydoc_sidebar
permalink: mydoc_kb_layout.html
toc: false
folder: mydoc
---

Here's the sample knowledge-base style layout:

<h2>Knowledge Base Categories</h2>

<div class="row row-cols-1 row-cols-sm-2 row-cols-xl-4 g-4 mb-4">
    <div class="col">
        <div class="card h-100 text-center kb-card">
            <div class="card-body">
                <span class="fa-stack fa-3x">
                    <i class="fa-solid fa-circle fa-stack-2x text-primary"></i>
                    <i class="fa-solid fa-tree fa-stack-1x fa-inverse"></i>
                </span>
                <h4 class="card-title mt-3">Getting started</h4>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                <a href="tag_getting_started.html" class="btn btn-primary">Learn More</a>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100 text-center kb-card">
            <div class="card-body">
                <span class="fa-stack fa-3x">
                    <i class="fa-solid fa-circle fa-stack-2x text-primary"></i>
                    <i class="fa-solid fa-car fa-stack-1x fa-inverse"></i>
                </span>
                <h4 class="card-title mt-3">Navigation</h4>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                <a href="tag_navigation.html" class="btn btn-primary">Learn More</a>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100 text-center kb-card">
            <div class="card-body">
                <span class="fa-stack fa-3x">
                    <i class="fa-solid fa-circle fa-stack-2x text-primary"></i>
                    <i class="fa-solid fa-life-ring fa-stack-1x fa-inverse"></i>
                </span>
                <h4 class="card-title mt-3">Single sourcing</h4>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                <a href="tag_single_sourcing.html" class="btn btn-primary">Learn More</a>
            </div>
        </div>
    </div>
    <div class="col">
        <div class="card h-100 text-center kb-card">
            <div class="card-body">
                <span class="fa-stack fa-3x">
                    <i class="fa-solid fa-circle fa-stack-2x text-primary"></i>
                    <i class="fa-solid fa-database fa-stack-1x fa-inverse"></i>
                </span>
                <h4 class="card-title mt-3">Formatting</h4>
                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                <a href="tag_formatting.html" class="btn btn-primary">Learn More</a>
            </div>
        </div>
    </div>
</div>

The layout uses Bootstrap 5 [cards](https://getbootstrap.com/docs/5.3/components/card/) in a responsive grid. The `row-cols-*` classes set how many cards appear in each row at different screen widths, and the icons are stacked [Font Awesome](https://fontawesome.com/icons) icons. View the source of this page (pages/mydoc/mydoc_kb_layout.md) to see the code.

## Generating a list of all pages with a certain tag

If you don't want to link to a tag archive index, but instead want to list all pages that have a certain tag, you could use this code:

```html
{% raw %}Getting started pages:
<ul>
{% assign sorted_pages = site.pages | sort: 'title' %}
{% for page in sorted_pages %}
{% for tag in page.tags %}
{% if tag == "getting_started" %}
<li><a href="{{ page.url | remove_first: "/" }}">{{page.title}}</a></li>
{% endif %}
{% endfor %}
{% endfor %}
</ul>{% endraw %}
```

Here's the result:

Getting started pages:

<ul>
{% assign sorted_pages = site.pages | sort: 'title' %}
{% for page in sorted_pages %}
{% for tag in page.tags %}
{% if tag == "getting_started" %}
<li><a href="{{ page.url | remove_first: "/" }}">{{page.title}}</a></li>
{% endif %}
{% endfor %}
{% endfor %}
</ul>

{% include links.html %}
