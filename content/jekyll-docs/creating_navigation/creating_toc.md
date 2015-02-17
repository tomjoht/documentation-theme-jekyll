---
title: Creating a table of contents
permalink: /creating_toc/
---

The table of contents (TOC) on the left reads data from the settings/[project name]/nav.yml file and displays it on the site. With this setup, the formatting is separate from the display. This allows for the same theme to be used to publish multiple sites. 

Each project has its own YML file. The configuration file defines the location of the yml file that the sidebar reads.

```
data_source: settings/jekyll-doc
```

This theme depends on some assumptions. The first assumption is that each configuration file defines a data source location where it will access the nav.yml and options.yml file. In the _config.yml file, the data source is set as `settings`. The second is that the data files be named nav.yml and options.yml. 

## The two data files

The nav.yml contains the links for the sidebar and top navigation. options.yml contains other theme options, such as the code for Disqus (a commenting feature), Google Analytics, and more. 

## YML structure

The nav.yml file is structured using YML syntax. Similar to JSON, YML is a human-readable format that depends on tab spacing to define different levels for the key-value pairs. 

When you add your TOC items to the sidebar, pay special attention to the format of the jekyll-doc nav.yml file and simply replicate it. Here's a sample of the sidebar code:

```
entries:
- title: Sidebar
  subcategories:
    - title: Formatting
      items:
        - title: Alerts
          url: /alerts/
        - title: Build arguments
          url: /build_arguments/
    - title: Publishing
```

This first section is Formatting, and it has two pages inside it: Alerts and Build arguments. Each item has a title and URL. 

The sidebar code will iterate through each grouping of items and pull out the title and URL and put them inside formatting for the theme. If the page URl matches the current page, then an `active` class gets applied. 

It's important for the data references in the theme to match up with the location of the data files for the project. You can't change nav.yml to mynav.yml without breaking the theme, because there are certain placeholders in the theme that depend on the filename being called nav.yml. Same with options.yml.

## Navgoco

For the TOC, this theme uses a jQuery plugin called [Navgoco](http://apps.komposta.net/jquery/navgoco/demo/). Navgoco optionally uses cookies to remember the last page the user was on (so that when the page refreshes, the TOC doesn't return to the default state). Additionally, navgoco also incorporates the jQuery accordion feature so that expanding one section collapses the others (and hence saves visual space).

## Accordion

If you want to disable the accordion feature, in the options.yml file, change `true` to `false` for the accordion setting. Without the accordion effect, each section can expand without any auto-collapsing of other sections (you may or may not want this effect, depending on how many items you have in your TOC). If you disable the accordion, a section at the bottom of the TOC will appear that says Expand All or Collapse All. This section is hidden if the accordion is enabled because Expand All is incompatible with the accordion functionality.
