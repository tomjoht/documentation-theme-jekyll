---
title: Sidebar navigation
tags: [navigation]
keywords: sidebar, toc, table of contents, navigation
last_updated: August 12, 2015
summary: "The sidebar and top navigation bar read their values from yml files. The navigation components are one of the most unique parts of this theme, since the navigation components are only included if they meet all of the product, audience, version, etc., values as specified in the project settings."
---
{% include linkrefs.html %} 

## Sidebar overview

To configure the sidebar, edit the values in the \_data/sidebar_doc.yml file. Follow the example  in this theme. Note that YML spacing is picky. Each new level is two spaces indented. I usually just keep a template that shows all three levels and then copy and paste from it as needed.

## Sidebar levels

You can add three levels of nesting in the sidebar nav. For example, three levels looks like this:

```
Introduction
 -> Getting started
 -> Features
 -> Configuration 
	-> Options
	-> Automation
```

You can't add more than three levels. In general, it's a best practice not to create more than three levels of navigation anyway, since it creates a paralysis of choice for the user.

If you need deeper sublevels, I recommend creating different sidebars for different pages, which is logic that I haven't coded into the theme but which could probably be added fairly easily.

## External links

If you want the URL to point to an external site, use `external_url` instead of `url` in the data file. Then just enter the full HTTP URL. When you use `external_url`, the sidebar.html will apply this logic:

```html
{% raw %}
{% if item.external_url %}
<li><a href="{{item.external_url}}" target="_blank">{{subcategory.title}}</a></li>
{% endraw %}
```             

{% if site.audience == "designers" %}
## How it works
The values in the sidebar_doc.yml file are coded to match the logic in includes/sidebar.html. 

Each of the items in the sidebar needs to have the attributes shown here:

```yaml
- title: Getting started
  url: /doc_getting_started.html
  audience: writers, designers
  platform: all
  product: all
  version: all
```

The audience, platform, product, and version are specified in the includes/custom/conditions.html file:

```liquid
{% raw %}
{% if site.project == "doc" %}
{% assign audience = "designers" %}
{% assign sidebar = site.data.sidebar_doc.entries %}
{% assign topnav = site.data.topnav_doc.topnav %}
{% assign topnav_dropdowns = site.data.topnav_doc.topnav_dropdowns %}
{% assign version = "all" %}
{% assign product = "all" %}
{% assign platform = "all" %}
{% assign link = "custom/doc/links_doc.html" %}
{% assign projectTags = site.data.tags_doc.allowed-tags %}
{% assign searchGroup = "doc" %}
{% endif %}
{% endraw %}
```

Additionally, note how some assignments are set here as well. The conditions.html file set things like `sidebar = site.data.sidebar_doc.entries`. 

When the sidebar.html file runs the logic, it includes these statements: 

```liquid
{% raw %}
{% include custom/conditions.html %}

{% for entry in sidebar %}
...
{% endraw %}
```

The assignment of the `sidebar` value through the conditions.html file means this is really what's happening:


```liquid
{% raw %}
{% include custom/conditions.html %}

{% for entry in site.data.sidebar_doc.entries %}
{% endraw %}
```

Since different projects will use different data files, I had to make the logic run using the standard `sidebar` variable, but change the meaning of that variable based on the project.

# Sidebar accordion
The configuration file (configs/config_writers.yml) file includes a value (`sidebar_accordion`) that lets you choose whether to use the accordion feature in the sidebar or not. The accordion feature collapses other sections when a section is opened, which conserves space on the screen. Put `true` or `false` for the value.

## Sidebar fixed or moving

If you scroll up, the sidebar usually remains fixed in place. This is so that users can keep the context of the table of contents in place while they move down the page.

However, if the user's viewport is really small, you don't want the TOC to remain fixed in place because expanding one section may extend past what is visible. In the js/customscripts.js file, I inserted some logic to check the viewport size. 

```js
$( document ).ready(function() {

    //
    var h = $(window).height();
    console.log (h);
    if (h > 800) {
        $( "#mysidebar" ).attr("class", "nav affix");
    }
    // activate tooltips. although this is a bootstrap js function, it must be activated this way in your theme.
    $('[data-toggle="tooltip"]').tooltip({
        placement : 'top'
    });

});
```

The script says, if the height of the viewport is greater than 800px, then insert `affix` class, which makes the nav bar fixed as your scroll. If you have a lot of nav items, this fixed position may not work for you.

For example, if your sidebar has a lot of items and the fixed position makes it so the user can't see all the items when expanded, you may want to adjust the height. If viewing the sidebar is ap roblem, increase the height value from `800` to `1000` or more.

## Navgoco foundation

The sidebar uses the [Navgoco jQuery plugin](https://github.com/tefra/navgoco) as its basis. Why not use Bootstrap? Navgoco provides a few features that I couldn't find in Bootstrap:

* Navgoco sets a cookie to remember the user's position in the sidebar. If you refresh the page, the cookie allows the plugin to remember the state.
* Navgoco inserts an `active` class based on the navigation option that's open. This is essential for keeping the accordion open.
* Navgoco includes the expand and collapse features of a sidebar.

In short, the sidebar has some complex logic here. I've integrated Navgoco's features with the sidebar.html and sidebar_doc.yml to build the sidebar. It's probably the most impressive part of this theme. (Other themes usually aren't focused on creating hierarchies of pages, but this kind of hierarchy is important in a documentation site.)

## Highlighting the active item

Here's how the highlighting of the currently viewed page works. In the sidebar.html file, you'll see this:

```liquid
{% raw %}
 {% elsif page.url == item.url %}
   <li class="active"><a href="{{item.url | replace: "/",""}}">{{item.title}}</a></li>
{% endraw %}
```
                   
The `page.url` is a universal Jekyll tag that returns the end path of the page, prepended with `/`. For example, `/sample.html`. If this `page.url` matches the `item.url` specified in the sidebar_doc.yml file, then an `active` class gets applied.

Note that I've added a filter to the item.url in the sidebar.html file: 

```liquid
{% raw %}
{{item.url | replace: "/",""}}
{% endraw %}
```

Ideally, in the sidebar_doc.yml file, you could just write the URL you want to go to: `sample.html` instead of `/sample.html`. However, page.url always returns the forward slash before the URL. In order to match the page.url with the item.url, you have to use the forward slash before item.url in the doc_sidebar.yml file. 

However, if you set up your relative link as `/sample.html` instead of `sample.html`, then the browser will go to the directory root instead of any baseurl.

For example, if your site is deployed at http://mydomain.com/doc/, then going to `/sample.html` in the link will take you to `http://mydomain.com/sample.html` instead of `http://mydomain.com/doc/sample.html`.

In contrast, going to `sample.html` in the link will take you to `http://mydomain.com/doc/sample.html`. Hence the filter to remove the forward slash in the link.

That logic handles the highlighting of the active item, but in order for the sidebar to remain open, the parent level needs to also have the `active` class. To accomplish this, I inserted this script below the sidebar code in the sidebar.html file:

```js
<script>$("li.active").parents('li').toggleClass("active");</script>
```

This script has to come *after* the sidebar code. Otherwise, if placed inside customscripts.js, the script runs before the sidebar code runs and the class never gets inserted.

{% endif %}
