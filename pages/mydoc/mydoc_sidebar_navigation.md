---
title: Sidebar Navigation
tags: [getting_started]
last_updated: July 3, 2016
keywords: sidebar, accordion, yaml, iteration, for loop, navigation, attributes, conditional filtering
summary: "The sidebar navigation uses a jQuery component called Navgoco. The sidebar is a somewhat complex part of the theme that remembers your current page, highlights the active item, stays in view as you scroll, slides out on small screens, and more. This page explains a bit about how the sidebar was put together."
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

The js/customscripts.js file calls the `.navgoco` method on the `#mysidebar` element, which the \_includes/sidebar.html file builds.

There are some options to set within the `.navgoco` method. The only noteworthy option is `accordion`. This option makes it so when you expand a section, the other sections collapse. It's a way of keeping your navigation controls condensed.

The value for `accordion` is a Boolean (`true` or `false`). By default, the `accordion` option is set as `true`. If you don't want the accordion, set it to `false`.

To add **Collapse All** and **Expand All** links at the top of the sidebar, set `sidebar_expand_controls: true` in \_config.yml. These links work with or without the accordion.

If someone expands every folder in a long sidebar, the sidebar scrolls on its own, so the bottom stays reachable.

## Fixed position sidebar

On large screens, the sidebar stays in view as the user scrolls down the page. This uses the CSS `position: sticky` rule in css/theme.css. If the sidebar is taller than the browser window, it scrolls independently of the page, so the bottom of the sidebar is always reachable.

## Sidebar on small screens

On screens narrower than 992 pixels, the sidebar is hidden, and a sidebar button appears in the top navigation bar. Tapping the button slides the sidebar in from the left as a Bootstrap [offcanvas](https://getbootstrap.com/docs/5.3/components/offcanvas/) panel. The search box moves with it, since it sits at the top of the sidebar.

On large screens, the **Nav** button in the top navigation hides and shows the sidebar, which gives the content the full width of the page.

## Opening sidebar links into external pages

In the attributes for each sidebar item, if you use `external_url` instead of `url`, the theme will insert the link into an `a href` element that opens in a blank target.

For example, the sidebar.html file contains the following code:

{% raw %}
```liquid
{% if folderitem.external_url %}
    <li class="item"><a title="{{folderitem.title}}" href="{{folderitem.external_url}}" target="_blank" rel="noopener">{{folderitem.title}}</a></li>
```
{% endraw %}

You can see that the `external_url` is a condition that applies a different formatting. Although this feature is available, I recommend putting any external navigation links in the top navigation bar instead of the side navigation bar.

## Sidebar item highlighting

The sidebar.html file inserts a `current` class into the sidebar item when the `url` attribute in the sidebar data file matches the page URL. A short script then adds the `active` class to the folders that contain the current item, which tells navgoco to open them.

For example, the sidebar.html file contains the following code:

{% raw %}
```liquid
{% elsif page.url == folderitem.url %}
   <li class="item current"><a title="{{folderitem.title}}" href="{% include link.html url=folderitem.url %}" aria-current="page">{{folderitem.title}}</a></li>
```
{% endraw %}

If the `page.url` matches the `folderitem.url`, then the `current` class gets applied. If not, the `current` class does not get applied.

The `page.url` in Jekyll is a site-wide variable. If you insert {% raw %}`{{page.url}}`{% endraw %} on a page, it will render as follows: {{page.url}}. The `url` attribute in the sidebar item must match the page URL in order to get the `current` class applied.

This is why the `url` value in the sidebar data file looks something like this:

```yaml
    - title: Understanding how the sidebar works
      url: /mydoc_understand_sidebar.html
      output: web, pdf
```

The `url` value must match the page's permalink, with a slash at the beginning. It doesn't include the folder where you store the source file, because the permalink (not the source folder) determines the page's URL. If a page's permalink includes a folder, such as `/product1/overview.html`, use the same value for `url`. The link.html include then turns the URL into a relative link for the current page.

Now the page.url and the item.url can match and the `current` class can get applied. The folder that contains the current item then opens when the page loads.

{% include links.html %}
