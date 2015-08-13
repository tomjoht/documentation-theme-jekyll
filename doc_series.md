---
title: Series pages
tags: [content-types]
keywords: series, connected articles, tutorials, hello world
last_updated: August 12, 2015
summary: "You can automatically link together topics belonging to the same series. This helps users know the context within a particular process."
---
{% include linkrefs.html %} 

## Using series for pages
You create a series by looking for all pages within a tag namespace that contain certain frontmatter. Here's a demo: {{doc_seriesdemo1_1}}. 

## 1. Create the series button 

First create an include that contains your series button:

```html
{% raw %}
<div class="seriesContext">
    <div class="btn-group">
        <button type="button" data-toggle="dropdown" class="btn btn-primary dropdown-toggle">Series Demo <span class="caret"></span></button>
        <ol class="dropdown-menu">
            {% assign pages = site.pages | sort:"weight"  %}
            {% for p in pages %}
            {% if p.series == "ACME series" %}
            {% if p.url == page.url %}
            <li class="active"> → {{p.weight}}. {{p.title}}</li>
            {% else %}
            <li>
                <a href="{{p.url}}">{{p.weight}}. {{p.title}}</a>
            </li>
            {% endif %}
            {% endif %}
            {% endfor %}
        </ol>
    </div>
</div>
{% endraw %}
```

Change "ACME series" to the name of your series. 

Save this in your \_includes folder as something like series\_acme.html.

Note that with pages, there isn't a universal namespace created from tags or categories like there is with Jekyll posts. As a result, you have to loop through all pages. If you have a lot of pages in your site (e.g., 1,000+), then this looping will create a slow build time. If this is the case, you will need to rethink the approach to looping here.

## 2. Create the "next" include

This will be the next button at the bottom of the page:

```html
{% raw %}
<p>{% assign series_pages = site.tags.series_acme %}
    {% for p in pages %}
    {% if p.series == "ACME series" %}
    {% assign nextTopic = page.weight | plus: "0.1"  %}
    {% if p.weight == nextTopic  %}
    <a href="{{p.url}}"><button type="button" class="btn btn-primary">Next: {{p.weight}}  {{p.title}}</button></a>
    {% endif %}
    {% endif %}
    {% endfor %}
</p>

{% endraw %}
```
Change "acme" to the name of your series. 

Save this in your \_includes folder as series\_acme\_next.html. 

## 3. Add the correct frontmatter to each of your series pages

Now add the following frontmatter to each page in the series:

```json
series: "ACME series"
weight: 1.0
```

With weight, you could use 1, 2, 3, etc.., but Jekyll will treat 10 as coming after 1. This is why I use 1.0 and 1.1, 1.2, etc. 

If you do use whole numbers, change the `plus: "0.1"` to `plus: "1"`.

## 4. Add links to the series button and next button on each page.

On each series page, add a link to the series button at the top and a link to the next button at the bottom.
 
```html
{% raw %}
<!-- your frontmatter goes here -->

{% include custom/doc/series_acme.html %}

<!-- your page content goes here ... -->

{% include custom/doc/series_acme_next.html %}
{% endraw %}
```

## Changing the series drop-down color

The Bootstrap menu uses the `primary` class for styling. If you change this class in your theme, the Bootstrap menu should automatically change color as well. You can also just use another Bootstrap class in your button code. Instead of `btn-primary`, use `btn-info` or `btn-warning`. See {{doc_labels}} for more Bootstrap button classes.