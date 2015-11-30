---
title: Tags
audience: writer, designer
tags: [navigation]
last_updated: November 30, 2015
keywords: tags, navigation, buttons, links, association
summary: "Tags provide another means of navigation for your content. Unlike the table of contents, tags can show the content in a variety of arrangements and groupings. Implementing tags in this Jekyll theme is somewhat of a manual process."
---


## Add a tag to a page
You can add tags to pages by adding `tags` in the frontmatter with values inside brackets, like this:

```
---
title: 2.0 Release Notes
permalink: /release_notes_2_0/
tags: [formatting, single_sourcing]
---
```

## Tags overview

{{site.data.alerts.note}} With posts, tags have a namespace that you can access with <code>posts.tags.tagname</code>, where <code>tagname</code> is the name of the tag. You can then list all posts in that tag namespace. But pages don't off this same tag namespace, so you could actually use another key instead of <code>tags</code>. Nevertheless, I'm using the same <code>tags</code> name here.{{site.data.alerts.end}}


To prevent tags from getting out of control and inconsistent, first make sure the tag appears in the \date/tags_doc.yml file. If it's not there, the tag you add to a page won't be read. I added this check just to make sure I'm using the same tags consistently and not adding new tags that don't have tag archive pages.


{{site.data.alerts.note}} Unlike with WordPress, you have to build out the functionality for tags so that clicking a tag name shows you all pages with that tag. Tags in Jekyll are much more manual.{{site.data.alerts.end}}


Additionally, you must create a tag archive page similar to the other pages named tag_{tagname}.html folder. This theme doesn't auto-create tag archive pages.

For simplicity, make all your tags single words (connect them with hyphens if necessary).

## Setting up tags

Tags have a few components.

1. First make sure you configure a few details in the conditions.html file. In particular, see this setting:
	{% raw %}
	```liquid
	{% assign projectTags = site.data.tags_doc.allowed-tags %}
	```
	{% endraw %}
	
	The tags_doc name must correspond with how you label your tags file. Here, "doc" should be your project name.
	
2. In the \_data file, add a yml file similar to tags_doc.yml. The YML file lists the tags that are allowed:
	
	```json
	allowed-tags:
	  - getting_started
	  - overview
	  - formatting
	  - publishing
	  - single_sourcing
	  - special_layouts
	  - content types
	```
	
3. Create a tag archive file for each tag in your tags_doc.yml list. Name the file like this: tag_getting_started.html, where doc is your project name. (Again, tags with multiple words need hyphens in them.)
	
	Each tag archive file needs only this:
	
	{% raw %}
	```liquid
	---
    title: "Getting Started Pages"
    tagName: getting_started
    ---
    {% include taglogic.html %}
    ```
    {% endraw %}

	{{site.data.alerts.note}}In the \_includes/mydoc folder, there's a taglogic.html file. This file (included in each tag archive file) has common logic for getting the tags and listing out the pages containing the tag in a table with summaries or truncated excerpts. You don't have to do anything with the file &mdash; just leave it there because the tag archive pages reference it.{{site.data.alerts.end}}

5. Adjust button color or tag placement as desired. 
	
	By default, the \_layouts/page.html file will look for any tags on a page and insert them at the bottom of the page using this code:

	{% raw %}
	```
<div class="tags">
    {% if page.tags != null %}
    <b>Tags: </b>
    {% include custom/conditions.html %}
    {% for tag in page.tags %}
    {% if projectTags contains tag %}
    <a href="tag_{{tag}}.html" class="btn btn-info navbar-btn cursorNorm" role="button">{{page.tagName}}{{tag}}</a>
    {% endif %}
    {% endfor %}
    {% endif %}
</div>
	```
	{% endraw %}
	
Because this code appears on the \_layouts/page.html file by default, you don't need to do anything. However, if you want to alter the placement or change the button color, you can do so.
	
You can change the button color by changing the class on the button from `btn-info` to one of the other button classes bootstrap provides. See {{site.data.mydoc.mydoc_urls.mydoc_labels.link}} for more options on button class names.

## Retrieving pages for a specific tag

If you want to retrieve pages outside of a particular tag_archive page, you could use this code:

{% raw %}
```liquid
Getting started pages: 
<ul>
{% for page in site.pages %}
{% for tag in page.tags %}
{% if tag == "getting_started" %}
<li><a href="{{page.url | prepend: '..'}}">{{page.title}}</a></li>
{% endif %}
{% endfor %}
{% endfor %} 
</ul>
```
{% endraw %}

Here's how that code renders: 

Getting started pages:
<ul>
{% for page in site.pages %}
{% for tag in page.tags %}
{% if tag == "getting_started" %}
<li><a href="{{page.url | prepend: '..'}}">{{page.title}}</a></li>
{% endif %}
{% endfor %}
{% endfor %}
</ul>

If you want to sort the pages alphabetically, you have to apply a `sort` filter:

```liquid
{% raw %}
Getting started pages:
<ul>
{% assign sorted_pages = (site.pages | sort: 'title') %}
{% for page in sorted_pages %}
{% for tag in page.tags %}
{% if tag == "getting_started" %}
<li><a href="{{page.url | prepend: '..'}}">{{page.title}}</a></li>
{% endif %}
{% endfor %}
{% endfor %} 
</ul>
{% endraw %}
```

Here's how that code renders:

Getting started pages:
<ul>
{% assign sorted_pages = (site.pages | sort: 'title') %}
{% for page in sorted_pages %}
{% for tag in page.tags %}
{% if tag == "getting_started" %}
<li><a href="{{page.url | prepend: '..'}}">{{page.title}}</a></li>
{% endif %}
{% endfor %}
{% endfor %}
</ul>

## Efficiency
Although the tag approach here uses `for` loops, these are somewhat inefficient on a large site. Most of my tech doc projects don't have hundreds of pages (like my blog does). If your project does have hundreds of pages, this `for` loop approach with tags is going to slow down your build times. 

Without the ability to access pages inside a universal namespace with the page type, there aren't many workarounds here for faster looping. 

With posts (instead of pages), since you can access just the posts inside `posts.tag.tagname`, you can be a lot more efficient with the looping. 

Still, if the build times are getting long (e.g., 1 or 2 minutes per build), look into reducing the number of `for` loops on your site.

## Empty tags?

If your page shows "tags:" at the bottom without any value, it could mean a couple of things:

* You're using a tag that isn't specified in your allowed tags list in your tags.yml file.
* You have an empty `tags: []` property in your frontmatter.

If you don't want tags to appear at all on your page, remove the tags property from your frontmatter.

## Remembering the right tags

Since you may have many tags and find it difficult to remember what tags are allowed, I recommend creating a template that prepopulates all your frontmatter with all possible tags. Then just remove the tags that don't apply. 

See {{site.data.mydoc.mydoc_urls.mydoc_webstorm_text_editor.link}} for tips on creating file templates in WebStorm.

