---
title: More general info
permalink: /general_info/
---
{% include_relative reuse/variables.html %}

## Specify a particular page layout

The configuration file sets the default layout for pages as the page layout, which you can see inside the layouts/page.html file. You can create other layouts inside the layouts folder. You can then specify that the page use that particular layout by adding `layout: mylayout.html` in the page's frontmatter. 

## Tag a page and retrieve pages with specific tags

You can add tags to pages by adding `tags` in the frontmatter, like this:

```
---
title: 2.0 Release Notes
permalink: /release_notes_2_0/
tags: release_notes
---
```

To get 5 pages with a specific tag, you can use this code:

{% raw %}
```
{% for page in site.pages limit: 5 %}
{% for tag in page.tags %}
{% if tag == "release_notes" %}
<li><a href="{{ page.permalink | prepend: site.baseurl }}">{{page.title}}</a></li>
<div class="summary">{{page.summary}}</div>
{% endif %}
{% endfor %}
{% endfor %}
```
{% endraw %}

Tags will be sorted in alphabetical order.

## Kill a server

Sometimes the preview server seems to hang. If you ever try to build your Jekyll site and you get a message saying that the server is already running or something, you can kill the server process using these commands:

`ps aux | grep jekyll`

Find the PID (looks like "22298")

Then type `kill -9 22298` where "22298" is the PID.

## Blast a warning to users

If you want to blast a warning to users on every page, add some text to the layouts/page.html page above the toc reference, like this:

```html
<div class="bs-callout bs-callout-warning"><b>Note:</b> This note will appear on every page in the site. </div>
```

Every page using the page layout (all, by defaut) will show this message.

## Build on Github

If you clone this repository, you can build it on another Github repository. However, each repository reads the default _config.yml file in the root directory, so the approach for putting each configuration file inside the configuration file will need to be modified.

## Context-sensitive help

The search file looks in a repository created by a JSON file called search.json. You can use this same repository to deliver context-sensitive help to an application. Just create a page for the help text you want, and then point developers to the search.json file in the output. 

Most likely, you'll want to create a secondary search.json file in the root directory and add an `if` clause to control what pages are included in the JSON file.
