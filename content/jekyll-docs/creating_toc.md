---
title: Creating a table of contents
permalink: /creating_toc/
---

The table of contents (TOC) on the left reads data from the navigation/nav.yml file and displays it on the site. With this setup, the formatting is separate from the display. This allows for the same theme to be used to publish multiple sites. Each project has its own yml file. The configuration file defines the location of the yml file that the sidebar reads. This setup is probably the most ingenious thing about this whole theme (the setup is not particular to this theme.)

## Repurposing the theme

When you have a website that functions as a help system, you get trapped into the problem of separating navigation links from the layout files so that the same layout can be used for different projects. If you were to directly include the links in the sidebar and other theme files, you would have to swap out a different sidebar entirely for each new project.

With this approach, each project has its own data files. The configuration file can define the source of the data files with this option: 

```
data_source: navigation/jekyll-doc
```

This theme depends on some assumptions. First is that each configuration file defines a data source location where it will access the TOC navigation and other options. The second is that the data files be named nav.yml and options.yml. 

## The two data files

The nav.yml contains the links for the sidebar and top navigation. options.yml contains other theme options, such as the code for Disqus (a commenting feature), Google Analytics, and more. 

## YML structure

The nav.yml file is structured using YML syntax. This is a human-readable format that depends on tab spacing to define different levels for the content. 

When you add your TOC items to the sidebar, pay special attention to the format of the jekyll-doc nav.yml file and simply replicate it. Here's a sample of the sidebar code:

```
entries:
- title: Sidebar
  subcategories:
    - title: Getting started
      items:
        - title: Alerts
          url: /alerts/
        - title: Build arguments
          url: /build_arguments/
    - title: Publishing
```

This first section is Getting Started, and it has two pages inside it: Alerts and Build arguments. Each item has a title and URL. 

The sidebar code will iterate through each grouping of items and pull out the title and URL and put them inside formatting for the theme. If the page URl matches the current page, then an `active` class gets applied.

{% raw %}

```liquid
{% for entry in site.data.nav.entries %}
  
  {% for subcategory in entry.subcategories %}
    <li><a href="#">{{ subcategory.title }}</a>
    <ul>
    {% for item in subcategory.items %}
      {% if page.url contains item.url %}
      <li class="active"><a href="{{item.url | prepend: site.baseurl}}" class="active">{{item.title}}</a></li>
    {% else %}
      <li><a href="{{item.url | prepend: site.baseurl}}">{{item.title}}</a></li>
    {% endif %}
    {% endfor %}
    </ul>
    </li>
  {% endfor %}
{% endfor %}
```
{% endraw %}


It's important for the data references in the theme to match up with the location of the data files for the project. You can't simply change `site.data.nav` to `site.data.mynav` without breaking the theme. In this case, `site.data.nav` refers to the location of the yml file. `site` is the global namespace, `data` is the data folder as defined in the configuration file, and `nav` is the filename inside the `data` folder's location.

The YML files must be named nav.yml and options.yml for each of your projects, but the folder these files are in varies by project. The folder location where data is stored is defined in the configuration file. 

## Navgoco

There's a lot to getting a functional TOC. I used a jQuery plugin called [Navgoco](http://apps.komposta.net/jquery/navgoco/demo/) for this. Navgoco uses cookies to remember the last page the user was on (so that when the page refreshes, the TOC doesn't return to the default state). Additionally, navgoco also incorporates the jQuery accordion feature so that expanding one section collapses the others (and hence saves visual space).

## Accordion

If you want to disable the accordion feature, in the options.yml file, change `true` to `false`. Without the accordion effect, each section can expand without any auto-collapsing of other sections. If you disable the accordion, a section at the bottom of the TOC will appear that says Expand All or Collapse All.
