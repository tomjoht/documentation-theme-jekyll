---
title: Sidebar Navigation
tags: [getting_started]
last_updated: November 30, 2015
keywords: sidebar, accordion, yaml, iteration, for loop, navigation, attributes, conditional filtering
summary: "The sidebar navigation uses a jQuery component called Navgoco. The sidebar is a somewhat complex part of the theme that remembers your current page, highlights the active item, stays in a fixed position on the page, and more."
---

{{site.data.alerts.note}} For basic information about configuring the sidebar navigation, see {{site.data.mydoc.mydoc_urls.mydoc_configure_sidebar.link}}. This section gets into the top sidebar navigation in more depth.{{site.data.alerts.end}}

When you set up your project, you configured the sidebar following the instructions in {{site.data.mydoc.mydoc_urls.mydoc_configure_sidebar.link}}. In this topic, I dive deeper into other aspects of the sidebar.

## Navgoco foundation

The sidebar uses the [Navgoco jQuery plugin](https://github.com/tefra/navgoco) as its basis. Why not use Bootstrap? Navgoco provides a few features that I couldn't find in Bootstrap:

* Navgoco sets a cookie to remember the user's position in the sidebar. If you refresh the page, the cookie allows the plugin to remember the state.
* Navgoco inserts an `active` class based on the navigation option that's open. This is essential for keeping the accordion open.
* Navgoco includes the expand and collapse features of a sidebar.

In short, the sidebar has some complex logic here. I've integrated Navgoco's features with the sidebar.html and sidebar_doc.yml to build the sidebar. It's probably the most impressive part of this theme. (Other themes usually aren't focused on creating hierarchies of pages, but this kind of hierarchy is important in a documentation site.)

## Accordion sidebar feature

As mentioned in the previous section, the theme uses the [Navgoco sidebar](http://www.komposta.net/article/navgoco). The sidebar.html file (inside the _includes folder) contains the `.navgoco` method called on the `#mysidebar` element. 

There are some options to set within the `.navgoco` method. The only noteworthy option is `accordion`. This option makes it so when you expand a section, the other sections collapse. It's a way of keeping your navigation controls condensed. 

The value for `accordion` is a Boolean (`true` or `false`). By default, the `accordion` option is set as `true`. If you don't want the accordion, set it to `false`. Note that there's also a block of code near the bottom of sidebar.html that is commented out. Uncomment out that section to have the Collapse all and Expand All buttons appear. 

There's a danger with setting the accordion to `false`. If you click Expand All and the sidebar expands beyond the dimensions of the browser, users will be stuck. When that happens, it's hard to collapse it. As a best practice, leave the sidebar's accordion option set to `true`.

## Fixed position sidebar

The sidebar has one other feature &mdash; this one from Bootstrap. If the user's viewport is tall enough, the sidebar remains fixed on the page. This allows the user to scroll down the page and still keep the sidebar in view.

In the customsscripts.js file in the js folder, there's a function that adds an `affix` class if the height of the browser window is greater than 800 pixels. If the browser's height is less than 800 pixels, the `nav affix` class does not get inserted. As a result, the sidebar can slide up and down as the user scrolls up and down the page.

Depending on your content, you may need to adjust `800` pixel number. If your sidebar is so long that having it in a fixed position makes it so the bottom of the sidebar gets cut off, increase the `800` pixel number here to a higher number.

## Opening sidebar links into external pages

In the attributes for each sidebar item, if you use `external_url` instead of `url`, the theme will insert the link into an `a href` element that opens in a blank target. 

For example, the sidebar.html file contains the following code:

{% raw %}
```liquid
{% if item.external_url %}
    <li><a href="{{item.external_url}}" target="_blank">{{subcategory.title}}</a></li>
    {% elsif page.url == item.url %}
```
{% endraw %}

You can see that the `external_url` is a condition that applies a different formatting. Although this feature is available, I recommend putting any external navigation links in the top navigation bar instead of the side navigation bar. 

## Sidebar item highlighting

The sidebar.html file inserts an `active` class into the sidebar element when the `url` attribute in the sidebar data file matches the page URL. 

For example, the sidebar.html file contains the following code:

{% raw %}
```liquid
    {% elsif page.url == item.url %}
    <li class="active"><a href="{{item.url | prepend: ".."}}">{{item.title}}</a></li>
    {% else %}
    <li><a href="{{item.url | prepend: ".."}}">{{item.title}}</a></li>
    {% endif %}
```
{% endraw %}

If the `page.url` matches the `item.url`, then an `active` class gets applied. If not, the `active` class does not get applied. 

The `page.url` in Jekyll is a site-wide variable. If you insert {% raw %}`{{page.url}}`{% endraw %} on a page, it will render as follows: {{page.url}}. The `url` attribute in the sidebar item must match the page URL in order to get the `active` class applied. 

This is why the `url` value in the sidebar data file looks something like this:

```yaml
    - title: Understanding how the sidebar works
      url: /mydoc/mydoc_understand_sidebar.html
      audience: writers, designers
      platform: all
      product: all
      version: all
      output: web, pdf   
```

Note that the url includes the project folder where the file is stored.

Now the page.url and the item.url can match and the `active` class can get applied. With the `active` class applied, the sidebar section remains open.
