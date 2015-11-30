---
title: 6. Configure the sidebar
tags: [getting_started]
last_updated: November 30, 2015
keywords: sidebar, accordion, yaml, iteration, for loop, navigation, attributes, conditional filtering
summary: "The sidebar and top navigation bar read their values from yml files. The navigation components are one of the most unique parts of this theme, since the navigation components are only included if they meet all of the product, audience, version, etc., values as specified in the project settings. Understanding how the sidebar works is critical to successfully using this theme."
series: "Getting Started"
weight: 6
---

{% include custom/mydoc/getting_started_series.html %}

## Understand how the sidebar works

In the \_data folder, the mydoc_sidebar.yml files contains the sidebar items for the theme. These list items (which are in YAML format) form your main navigation, and all pages in your project must appear here to be included in the PDF or the URL generator. Both the PDF and the URL generator (mydoc_urls.txt) iterate over the pages listed in the mydoc_sidebar.yml file to produce their output.
 
As a best practice, do the following with the sidebar:
 
* List all pages in your project somewhere in the sidebar. 
* As soon as you create a new page, add it to your sidebar (so you don't forget about the page). 
* Copy and paste the existing YAML chunks (then customize them) to get the formatting right.

YAML is a markup that uses spacing and hyphens instead of tags. YAML is a superset of JSON, so you can convert from YAML to JSON and vice versa equivalently.

There are certain values in the sidebar file coded to match the theme's code. These values include the main level names (`entries`, `subcategories`, `items`, `thirdlevel`, and `thirdlevelitems`). If you change these values in the sidebar file, the navigation won't display. (As long as you follow the sample with mydoc_sidebar.yml, you should be fine.)

At a high level, the sidebar data structure looks like this:

```yaml
entries
  subcategories
    items
      thirdlevel
        thirdlevelitems
```

Within these levels, you add your content. You can only have two levels in the sidebar. Here's an example:

```
Introduction
 -> Getting started
 -> Features
 -> Configuration 
	-> Options
	-> Automation
```

"Introduction" is a heading &mdash; it's the first level. Beneath it are Getting started and Features &mdash; these sub-items for the first level. 

Configuration is a heading announcing a second level. Below it are Options and Automation &mdash; these are on the second level.

You can't add more than two levels. In general, it's a best practice not to create more than two levels of navigation anyway, since it creates a paralysis of choice for the user. 

(If you need deeper sublevels, I recommend creating different sidebars for different pages, which is logic that I haven't coded into the theme but which could probably be added fairly easily. Additionally, if you wanted to create a third level, you could do so by following the same pattern as the second level and customizing a few things. However, the theme is not coded to support additional levels.)
 
The code in the theme's sidebar.html file (in the \_includes folder) iterates through the items in the mydoc_sidebar.yml file using a Liquid `for` loop and inserts the items into HTML. Iterating over a list in a data file to populate HTML is a common technique with static site generators. 

What I've added in this theme is some special logic that checks if the sidebar items meet the right attribute conditions. As a result, the sidebar.html file has code that looks like this:

{% raw %}
```liquid
 {% include custom/conditions.html %}
    {% for entry in sidebar %}
    {% for subcategory in entry.subcategories %}
        {% if subcategory.audience contains audience and subcategory.product contains product and subcategory.platform contains platform and subcategory.version contains version and subcategory.output contains "web" %}
```
{% endraw %}

Only if the sidebar item contains the right `audience`, `product`, `platform`, `version`, and `output` attributes does the item get included in the sidebar navigation. 

This means you will have just one sidebar data file for all the outputs in a single project. Different projects will use different sidebar data files, but all outputs for a single project will use the same sidebar data file. (This allows you to do single sourcing.)

If you look at the code above, you'll see that `audience`, `product`, `platform`, and `version` are defined generally. In sidebar.html, there are lines like `subcategory.audience contains audience`.

This is where the conditions.html file (inside \_includes) comes into play. `audience` is a variable defined in the conditions.html file. If you open up conditions.html, you'll see something like this:

{% raw %}
```liquid
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

`audience` is a variable set to `writers` for the mydoc_writers project. Therefore anywhere `audience` appears, `writers` gets inserted in its place. 

When the sidebar.html code runs `subcategory.audience contains audience`, it's saying that the subcategory item must have an attribute called `audience`, and the value for audience must contain `writers`. 

All of the attributes (which are defined in the conditions.html file) must be met in order to display in the navigation. The attributes must be present on both the heading and items under that heading.

However, note that the `output` attribute is a bit different. With this attribute, you just list whether you want a `web` or `pdf` output (or both, usually). For both, you just write `web, pdf`.

The logic in the sidebar is multi-step and somewhat complex, but you're also doing something truly sophisticated. You're instructing a static site generator to conditionally include certain information while using the same source files (not just the same sidebar data file, but the same sidebar.html file). 

Fortunately, once you set it up, you don't need to think about the underlying logic that's processing. You just make sure you're putting the right attributes on your sidebar items.

## Recognize the frontmatter in the sidebar

The first section in the sidebar subcategory list is a special frontmatter section that you should pretty much leave alone (except for changing the attribute values). It looks like this:

```yaml
  - title:
    audience: writers, designers
    platform: all
    product: all
    version: all
    output: pdf
    type: frontmatter
    items:
    - title:
      url: /titlepage.html
      audience: writers, designers
      platform: all
      product: all
      version: all
      output: pdf
      type: frontmatter
    - title:
      url: /tocpage.html
      audience: writers, designers
      platform: all
      product: all
      version: all
      output: pdf
      type: frontmatter

```

The only values you should change here are the values for the `audience`, `platform`, `product,` and `version`. 

These frontmatter pages are used in producing the PDF. This part will grab the titlepage.html and tocpage.html content in the theme's root directory. (If you're not publishing PDF, you can remove this section.)

Note that the output is `pdf` only for these frontmatter pages. They are specific to the PDF output only.


To learn more about the sidebar, see {{site.data.mydoc.mydoc_urls.mydoc_sidebar_navigation.link}}.

{% include custom/mydoc/getting_started_series_next.html %}