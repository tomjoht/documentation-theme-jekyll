---
title: Series pages
permalink: /series/
tags: []
keywords: series
audience: writers, designers
last_updated: May 17, 2015 
summary: "You can automatically link together topics belonging to the same series. This helps users know the context within a particular process."
---
{% include linkrefs.html %} 


## Demo

Here's a demo that pulls together three posts that are part of an "acme_series".

{% assign pages = site.pages | sort:"weight"  %}
<ol>
  {% for p in pages %}
  {% if p.series == "acme_series" %}
    <li>
      <b><a {% if p.url == page.url %}class="active"{% endif %} href="{{p.url | prepend: site.baseurl | append: site.suffix}}">{{p.title}}</a>.</b> {{p.summary}}
    </li>
    {% endif %}
  {% endfor %}
</ol>

When you click on each link, you'll see a Series selector that looks like this:

{% include custom/acme_series.html %}

None of the pages in the list are highlighted because you're not on that page. If you go to a series page, the active page isn't linked, appears in bold, and has a left arrow pointing to it. This allows the user to know where he or she is within the series.

Why the drop-down? If you have just 2-3 pages in a series, you don't need the drop-down menu. But if you have 8+ items in the series, it gets to be lengthy. The display is one way of moving it out of the reader's way.

## Create a series

To create a series, follow the sections below. 

### 1. Add frontmatter to your series pages

In the frontmatter of your series pages, add these two values:

```
series: acme_deploy
weight: 1
```

Call your series whatever you want.

The weight represents the sorting order for the series. Use numerical values to represent the order of the series posts.

### 2. Create the series include

In _includes/custom, create a new file such as acme_series.html. In the file, create a loop that looks like this:

{% raw %}
```html
<div class="seriesContext">
<div class="btn-group">
    <button type="button" data-toggle="dropdown" class="btn btn-primary dropdown-toggle">Acme Process <span class="caret"></span></button>
    <ol class="dropdown-menu">
        {% assign pages = site.pages | sort:"weight"  %}
        {% for p in pages %}
        {% if p.series == "acme" %}
        {% if p.url == page.url %}
        <li class="active"> → {{p.weight}}. {{p.title}}</li>
        {% else %}
        <li>
            <a href="{{p.url | prepend: site.baseurl | append: site.suffix}}">{{p.weight}}. {{p.title}}</a>
        </li>
        {% endif %}
        {% endif %}
        {% endfor %}
    </ol>
</div>
</div>
```
{% endraw %}

Change the name of the series from `acme_series' to your own series (as you've named it in your frontmatter). Adjust any other styling for the content.

This code sorts pages by weight. It then uses a `for` loop to look through the pages to find all pages that have the specified series. It then arranges the pages into a list.

The list is packaged into a Bootstrop drop-down menu. If you don't want the drop-down menu, remove the code outside of the `ol` tags.


### 3. Add the include on each of your series pages

For each of the pages in the series, add this near the top (below the linkrefs.html include):

{% raw %}
```
{% include custom/acme_series.html %}
```
{% endraw %}

{{warning}} Be careful not to add too many `for` loops to your pages. Each `for` loop you add will impact the build time of your Jekyll site. This is because Liquid (where the `for` loop logic comes from, is slow.{{end}}

## Changing the series drop-down color

The Bootstrap menu uses the `primary` class for styling. If you change this class in your theme, the Bootstrap menu should automatically change color as well.



