---
title: Links
permalink: /links/
audience: writer, designer
tags: [formatting, navigation]
last_updated: 
summary: 
---
{% include linkrefs.html %} 

## Create a link

There are several ways to create links: Markdown, HTML, or keyref-style. I'll recommend the simplest way to create links:

## Markdown links

Markdown link pointing to an external site:

```
[Google](http://google.com)
```
## HTML links

HTML link pointing to an internal site:

{% raw %}
```
<a href="{{ "/syntax_highlighting" | prepend: site.baseurl }}">Syntax Highlighting</a>
```
{% endraw %}

## Re-using links

For internal links, it's a best practice to store the link in an internal file so that you can easily update all references to the link. 

In this theme, the includes folder contains a linkrefs.html file where the capture tags are stored:

{%raw%}
```html
{% capture supported_features %}<a href="{{"/supported_features" | prepend: site.baseurl}}">Supported Features</a>{% endcapture %}
```
{%endraw%}

Anything between the capture tags is inserted when you use capture variable. 

To insert a link to the above, you would just add this in your content. First put the linksrefs.html include below your frontmatter:

{%raw%}
```html
{% include linkrefs.html %}
```
{%endraw%}

Then insert the variable from your captured link:

{%raw%}
```
For more information, see {{supported_features}}.
```
{%endraw%}


If you ever change the link, all references pointing to {{supported_features}} will automatically be updated. It's also easy to do a find and replace operation looking for "{{supported_features}}".

## Folder paths irrelevant

Even though you may group pages into subfolders, when you reference a page, you reference it by the permalink regardless of the subfolder it happens to be in. So even if you have formatting/syntax_highlighting, you link to it with `syntax_highlighting` instead of `formatting/syntax_highlighting` because that's the topic's permalink. Jekyll iterates through all pages in the page namespace to locate one that contains the matching permalink. 
