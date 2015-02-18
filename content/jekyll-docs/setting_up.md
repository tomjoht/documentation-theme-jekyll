---
title: Setting up the theme
permalink: /setting_up/
layout: page
tags: getting_started
---


## Origins of the theme

I forked this theme from [Shiori](https://github.com/ellekasai/shiori). Because Shiori is Bootstrap-based, I felt it made a good starting point.

I then used a [Bootply template](http://www.bootply.com/) that includes Affix left sidebar + scrollspy.

You can use any Bootstrap and Font Awesome components in the theme.


## Prerequisites

Honestly, I'm not even sure what utilites are pre-installed on a Mac. I recommend downloading XCode from the app store, since it seems to provide a lot of the dependencies. 

Then make sure you have [Rubygems](https://rubygems.org/pages/download).

If you run into a dependency issue that I should list here, let me know. 

## Set up Jekyll

See the [Quick Start instructions on Jekyllrb](http://jekyllrb.com/) for installing Jekyll. These instructions are Mac-based, and I don't have much experience installing Jekyll on Windows.

1. Download this theme.
2. From Terminal, `cd` to the folder.
3. Type `jekyll serve`.

You should see a Jekyll server URL to see the site.

## Configuration

By default, Jekyll uses the _config.yml file when building the site. It then builds the site in the same folder and puts it in a directory called `_site`. 

However, this approach doesn't work well when you're generating multiple sites from the same jekyll files. Fortunately, you can pass arguments to the `jekyll serve` command. 

Here's a sample:

```
jekyll serve --config config_web.yml --destination ../jekyllbuilds/site_web
```

The `--config` parameter lets you specify a different configuration file from the default. Here I'm specifying the config_web.yml file.

The `--destination` parameter lets you specify a different output directory. Here I'm specifying the build directory to be in ../jekyllbuilds/site_web. This is one folder outside of the Jekyll folder. This is key because if you have two projects running at the same time, and one builds inside the Jekyll folder, Jekyll will detect a change and automatically start building the other project -- back and forth in an infinite loop.

Because it's tiresome to type these configuration and destination parameters each time, I put these build commands inside a shell script file. Look in web.sh and you'll see this simple command. 

Now rather than building Jekyll by typing `jekyll serve`, you can build it by typing `. web.sh`. This launches the shell script that executes the command. 

If you only have one Jekyll site, it's probably not worth it to customize the Jekyll build scripts. But if you do have multiple sites, I definitely recommend customizing the web.sh file and using that instead.

Note that if you create a new .sh file, it probably won't have the right permissions for Terminal to execute it. To change permissions, `cd` to the file and then run this command: `sudo chmod +x web.sh`, where web.sh is the name of your shell script.

## Sidebar

In traditional help systems, there's a static sidebar that remains persistent for every page. This approach is inefficient when you have a large number of TOC items, many of which are irrelevant to the content the user is viewing. 

This theme takes a different approach. The sidebar on each page is a dynamically generated table of contents based on the headings on the page the viewer sees. The table of contents is auto-built by an auto-TOC generator script called [jekyll-table-of-contents](https://github.com/ghiculescu/jekyll-table-of-contents). This plugin looks for instances of headings and constructs a list, linking to each heading. 

Scrollspy is a Bootstrap feature that dynamically highlights the current heading you're viewing as you scroll. Scollspy requires that each heading's ID attribute match the jump TOC ID attributes. Coding this manually would be very tedious, so this is why I'm using the auto-TOC generator. (For more on ScrollSpy, see [this post](http://idratherbewriting.com/2015/01/20/implementing-scrollspy-with-jekyll-to-auto-build-a-table-of-contents/) I wrote.)

In order for the dynamic TOC highlighting to work, first, with your pages, use Markdown as your file format and use `##` or `###` to denote the heading level. In Markdown syntax, `## Section 1` would create an `h2` element called "Section 1." Three pounds signs makes an h3. 

The Markdown processer configured in the config file is [Redcarpet](https://github.com/vmg/redcarpet). If you look in the config file, you'll see:

```
markdown: redcarpet

redcarpet:
  extensions: ["no_intra_emphasis", "fenced_code_blocks", "autolink", "tables", "with_toc_data"]
```

One of the Redcarpet extensions is "with_toc_data." It's critical that you configure Redcarpet to use this extension because it means ID attributes will be dynamically inserted into the heading levels built by the auto-TOC generator. When the auto-TOC generator renders the TOC, it will include these ID attributes, and with this match of IDs between the TOC and the page headings, Scrollspy's dynamic highlighting will work. 

Just remember:

- Make sure you configure the redcarpet extensions in your configuration file as shown in the code sample above.
- Use Markdown formatting for your pages, particularly with the headings.

Note that your files must use an `.md` extension to be processed as Markdown. You can use HTML in a Markdown page, but you can't use Markdown in an HTML page.

If you look in the theme files, the sidebar gets inserted in the sidebar.html template. All you will mostly see in that file is the following:

```html
<div id="toc"></div>
```

The [jekyll-table-of-contents plugin](https://github.com/ghiculescu/jekyll-table-of-contents) simply requires you to reference the toc.js file, which you can see at the bottom of default.html. This script triggers when the `toc` id loads on a page. If you remove this div ID, the TOC generator won't know where to append the TOC, so it won't appear. 



## Homepage routing

I've taken a different approach with the homepage. This Pinterest style layout is facilitated by a JavaScript library called [Shuffle js](http://vestride.github.io/Shuffle/). Shuffle will make various panels fit together nicely on a page, and it will allow you to dynamically filter or reorder the panels. 

The panels are styled through Bootstrap. 

When Jekyll builds a site, the default.html contains a placeholder called `{{content}}`. Jekyll looks for an index.html or index.md file in your root directory to insert into this placeholder. 

In this theme's root directory, you'll see index.html. This file just does some routing. If you had just one project, you could put your homepage here directly. But I'm assuming you might have several different projects, and the homepage navigation will differ for each project. So the logic here routes to the correct homepage based on a value in the configuration file. 

Here's the logic in index.html:

{% comment %}
{% raw %}
```liquid
{% if site.audience == "adtruth" %}
{% include_relative /content/adtruth/home_adtruth.html %}

{% elsif site.audience == "web" %}
{% include_relative /content/web/home_web.html %}

{% else %}
{% include_relative /content/basicproject/home_basicproject.html %}
{% endif %}
```
{% endraw %}
{% endcomment %}

The language here is Liquid. It allows you to execute programming logic directly on the page. `site.audience` accesses a value set in the site namespace, which refers to content in your configuration file. If you look in the configuration file, you'll see this:

```
# audience: web
```

The `#` before a line comments it out. If you were to uncomment the line, then this statement would evaluate differently. 

The logic is basic if-else-else logic common to nearly every programming language. It says, If the value for site.audience is adtruth, use the home_adtruth.html file. However, if the value is web, use the home_web.html file. If neither of these conditions exists, use home_basicproject.html.

The include tag normally looks in the _includes directory. But to separate out files into different content folders that can be easily excluded from builds, I put the homepage files inside of the content directory. 

Because I'm including a file not part of the _includes directory, I use the `include_relative` command. This command uses the relative directory to look for the include. Interestingly enough, and for reasons I don't entirely understand, even though the file is buried two subdirectories deep inside /content/web, it is still considered part of the relative directory. I believe this is because when Jekyll builds the site, it pulls the pages out into the root directory rather than leaving them inside a subdirectory. This is not necessarily the case with other files.

## Homepage content


The homepage consists of various panels. Here's a sample:

{% comment %}
{% raw %}

```html
<div class="col-xs-6 col-sm-4 col-md-4" data-groups='["configuration"]'>

             <div class="panel panel-default">
               <div class="panel-heading">Configuration on Mac</div>
               <div class="panel-body">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sit amet nisi eget quam laoreet interdum. Aenean eu varius velit. 
               <ul>
                {% assign counter = '0' %}
                {% for page in site.pages %}
                {% for tag in page.tags %}
                {% if tag == "configuration" and counter < '5' %}
                {% capture counter %}{{ counter | plus:'1' }}{% endcapture %}
                  <li><a href="{{ page.permalink | prepend: site.baseurl }}">{{page.title}}</a></li>
                {% endif %}
                {% endfor %}
                {% endfor %} 
                </ul>
               </div>
            </div>

    </div>
```
{% endraw %}
{% endcomment %}

You can copy and paste this same panel, or remove the panels, as desired. However, make sure you grab all the div tags.

The panel uses Bootstrap styling.  If you change the panel class, you can control the panel's color. Here are the color options:

class | color
-------|------
danger | red
info | blue
default | gray
warning | yellow
success | green
primary | depends on theme color

The sample homepage shows a variety of colors. The logic contains a for loop that looks for tags on pages and lists the pages containing the tags in a list. 

In this example, it looks for all pages that have the tag "configuration" and lists the first five it finds. The counter feature stops the for loop from processing after it reaches five. You can change the tag and counter as desired. 

The top of the homepage contains various buttons that act as filters:

```html
     <div class="filter-options">
      <button class="btn btn-default" data-group="getting_started">Getting started</button>
      <button class="btn btn-default" data-group="news">News</button>
      <button class="btn btn-default" data-group="implementation">Implementation</button>
      <button class="btn btn-default" data-group="configuration">Configuration</button>
      <button class="btn btn-default" data-group="troubleshooting">Troubleshooting</button>
      <button class="btn btn-default" data-group="analytics">Analytics</button>

    </div>  
```

These filters specify the data group for the panels. For example, the data-group that equals configuratoin corresponds to the data-group value on panels with the same value. When you click the Configuration button, the Shuffle.js script filters out any panels that don't have this data-group value. You should configure the data-group values on your homepage.

When you create a page, you can easily add it to the list here using `tags` in the frontmatter, like this:

```
---
layout: page
title: Configuring ACME
permalink: /configuring_acme/
tags: configuration
---
```

By adding `tags: configuration` in the frontmatter if a page, Jekyll will find this page when it runs the for loop looking for pages with the tag `configuration` and will automatically add it in the panel. 


## Setting up tag archives

The counter on the homepage limits each for loop to five results, but in a help system, as you add more and more knowledge base articles or other documentation pages to the help system, you may have 20+ articles for a particular category. In order to generate archive-based pages that show all items assigned to that category...


## Two categories

If a page applies to more than one category, use brackets in define the multiple tags, like this: 

```
[tags: configuration, troubleshooting]
```

Alternatively, write it like this:

```
tags: 
- configuration
-troubleshooting
```

But don't write it like this:

```
tags: configuration, troubleshooting
```

