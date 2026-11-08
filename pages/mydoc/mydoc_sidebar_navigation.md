---
title: Sidebar Navigation
tags: [getting_started]
last_updated: July 3, 2016
keywords: sidebar, accordion, yaml, iteration, for loop, navigation, attributes, conditional filtering
summary: "The sidebar navigation uses a jQuery component called Navgoco. The sidebar is a somewhat complex part of the theme that remembers your current page, highlights the active item, stays in a fixed position on the page, and more. This page explains a bit about how the sidebar was put together."
sidebar: mydoc_sidebar
permalink: mydoc_sidebar_navigation.html
folder: mydoc
---

## Navgoco foundation

The sidebar uses the [Navgoco jQuery plugin](https://github.com/tefra/navgoco) as its basis. Why not use Bootstrap? Navgoco provides a few features that I couldn't find in Bootstrap:

* Navgoco can set a cookie to remember which folders the user opened. (The theme turns this option off with `save: false`, because the saved state conflicts with highlighting the current page.)
* Navgoco inserts an `active` class based on the navigation option that's open. This is essential for keeping the accordion open.
* Navgoco includes the expand and collapse features of a sidebar.

In short, the sidebar has some complex logic here. I've integrated Navgoco's features with the sidebar.html and sidebar data files to build the sidebar. It's probably the most impressive part of this theme. (Other themes usually aren't focused on creating hierarchies of pages, but this kind of hierarchy is important in a documentation site.)

## Accordion sidebar feature

The \_layouts/default.html file calls the `.navgoco` method on the `#mysidebar` element, which the \_includes/sidebar.html file builds.

There are some options to set within the `.navgoco` method. The only noteworthy option is `accordion`. This option makes it so when you expand a section, the other sections collapse. It's a way of keeping your navigation controls condensed.

The value for `accordion` is a Boolean (`true` or `false`). By default, the `accordion` option is set as `true`. If you don't want the accordion, set it to `false`.

To add **Collapse All** and **Expand All** links at the bottom of the sidebar, set `sidebar_expand_controls: true` in \_config.yml. These links work with or without the accordion.

Be careful with a long sidebar, though. If the sidebar is in a fixed position (see the next section) and someone expands every folder, the bottom of the sidebar can extend past the browser window, where it's hard to reach.

## Fixed position sidebar

The sidebar has one other feature &mdash; this one from Bootstrap. If the user's viewport is tall enough, the sidebar remains fixed on the page. This allows the user to scroll down the page and still keep the sidebar in view.

In the customscripts.js file in the js folder, there's a function that adds an `affix` class if the height of the browser window is greater than 800 pixels. If the browser's height is less than 800 pixels, the `nav affix` class does not get inserted. As a result, the sidebar can slide up and down as the user scrolls up and down the page.

Depending on your content, you may need to adjust `800` pixel number. If your sidebar is so long that having it in a fixed position makes it so the bottom of the sidebar gets cut off, increase the `800` pixel number here to a higher number.

## Opening sidebar links into external pages

In the attributes for each sidebar item, if you use `external_url` instead of `url`, the theme will insert the link into an `a href` element that opens in a blank target.

For example, the sidebar.html file contains the following code:

{% raw %}
```liquid
{% if folderitem.external_url %}
    <li><a href="{{folderitem.external_url}}" target="_blank" rel="noopener">{{folderitem.title}}</a></li>
```
{% endraw %}

You can see that the `external_url` is a condition that applies a different formatting. Although this feature is available, I recommend putting any external navigation links in the top navigation bar instead of the side navigation bar.

## Sidebar item highlighting

The sidebar.html file inserts an `active` class into the sidebar element when the `url` attribute in the sidebar data file matches the page URL.

For example, the sidebar.html file contains the following code:

{% raw %}
```liquid
{% elsif page.url == folderitem.url %}
   <li class="active"><a title="{{folderitem.title}}" href="{% include link.html url=folderitem.url %}">{{folderitem.title}}</a></li>
```
{% endraw %}

If the `page.url` matches the `folderitem.url`, then an `active` class gets applied. If not, the `active` class does not get applied.

The `page.url` in Jekyll is a site-wide variable. If you insert {% raw %}`{{page.url}}`{% endraw %} on a page, it will render as follows: {{page.url}}. The `url` attribute in the sidebar item must match the page URL in order to get the `active` class applied.

This is why the `url` value in the sidebar data file looks something like this:

```yaml
    - title: Understanding how the sidebar works
      url: /mydoc_understand_sidebar.html
      output: web, pdf
```

The `url` value must match the page's permalink, with a slash at the beginning. It doesn't include the folder where you store the source file, because the permalink (not the source folder) determines the page's URL. If a page's permalink includes a folder, such as `/product1/overview.html`, use the same value for `url`. The link.html include then turns the URL into a relative link for the current page.

Now the page.url and the item.url can match and the `active` class can get applied. With the `active` class applied, the sidebar section remains open.

{% include links.html %}
