---
title: Links
permalink: /links/
---

## Create a link

There are several ways to create links: Markdown, HTML, or keyref-style.

## Markdown links

Markdown link pointing to an external site:

```
[Google](http://google.com)
```
Markdown link pointing to an internal site:

{% raw %}

```
[Syntax Highlighting]({{ "/syntax_highlighting" | prepend: site.baseurl }})
```
{% endraw %}

## HTML links

HTML link pointing to an external site:

{% raw %}
```
<a href="{{ "http://idratherbewriting.com" }}">I'd Rather Be Writing</a>
```
{% endraw %}

HTML link pointing to an internal site:

{% raw %}
```
<a href="{{ "/syntax_highlighting" | prepend: site.baseurl }}">Syntax Highlighting</a>
```
{% endraw %}

## Keyref-style links

You can also store a link in a reuse file so it's easy to reuse the link. This method allows you to reuse the link. This method is somewhat similar to the keyref linking technique used in DITA.

First, inside data/links.yml file, add the following:
    
```
overview:
 title: Syntax highlighting
 url: /syntax_highlighting/
```
This is YML syntax. There is one space before the `title` field, and one space before the `url` field. This space puts the content at another level in from `overview`.
    
Then do the following to insert a link: 

{% raw %}
```
`[{{ site.data.links.syntax_highlighting.title }}][1]`

[1]: {{ site.data.links.syntax_highlighting.url }}
```
{% endraw %} 

This is the Markdown style of linking. The `[1]` allows you to put the link in the footer, so that you're not cluttering up your content with too much link data.

You could also use this same method using HTML: 

{% raw %}
```
`<a href="{{ site.data.links.syntax_highlighting.url }}">{{ site.data.links.syntax_highlighting.title}}</a>`
```
{% endraw %} 

I realize the code for the link looks long and bulky. However, there's really not a simpler way around it if you want to manage link references indirectly like this. 

Note that with any content you add to your data file, you can get to it by going to `site.data.[filename]`. The `url` is one level deeper than `syntax_highlighting`, so you get to it through the dot notation. 

If you ever change the permalink, you can just update your links file to change the permalink, and all references pointing to the keyword you're using will be updated. 

Note that even though you may group pages into subfolders, when you reference a page, you reference it by the permalink regardless of the subfolder it happens to be in. So even if you have formatting/syntax_highlighting, you link to it with `syntax_highlighting` instead of `formatting/syntax_highlighting` because that's the topic's permalink. Jekyll iterates through all pages in the page namespace to locate one that contains the matching permalink. 
