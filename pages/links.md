---
layout: page
title: Links
permalink: /links/
tags: formatting
---

{% include_relative reuse/variables.html %}

I think this is right...


[My helpful screenshot]({{ site.baseurl }}/assets/screenshot.jpg)

<a href="{{ site.baseurl }}/assets/screenshot.jpg"> My Helpful screenshot</a>

## Links to external sites

To make a link to an external site, use Markdown syntax like this: 

```
[Google](http://google.com)
```

You can also organize links like this: 

```
[Google][goog].
```

Put the reference at the bottom of your page: 

```
[goog]: http://google.com
```

## Basic internal links

For internal links, use Jekyll tags. Here's a basic Jekyll link that leverages Markdown syntax:

```
[Syntax Highlighting]({{ "/tutorial_syntax_highlighting" | prepend: site.baseurl }})
```

The links point to the permalink. Jekyll doesn't automatically grab the page title.

You can also use HTML: 

```html
<a href="{{ "/tutorial_syntax_highlighting" | prepend: site.baseurl }}">Syntax Highlighting</a>
```


## Keyref style links

You can also create keyref style links. This is a bit more involved. By keyref, I'm referring to key references in DITA, where a key points to a link as defined somewhere in your code. If you want to change all instances of the link, you just change the key. The key essentially acts as a variable pointing to the link. 

To add to the complexity here, we want to grab the page title for the link automatically. (Jekyll doesn't really get the page title except by iterating through all pages and looking for a match.)

In the _includes folder, create a file called links.html. (There's no need for frontmatter.)

In this file, add the following for each link: 

{% comment %}
{% raw %}
```liquid
{% capture demo %}
{% for page in site.pages %}
  {% if page.id == 123 %}
[{{ page.title }}]({{ page.url | prepend: site.baseurl }})
{% break %}
  {% endif %}
{% endfor %}
{% endcapture %}
```
{% endraw %}
{% endcomment %}

On your page (anywhere), add an include as follows: 


{% comment %}
{% raw %}
```liquid
{% include links.html %}
```
{% endraw %}
{% endcomment %}


In the front matter of your page, add a custom variable called `id` like this:

```
---
layout: page
title: "Demo Page"
permalink: /demo/
id: 123
---
```

To reference the link on the page, just add this:

{% comment %}
{% raw %}
```liquid
{{ demo }}
```
{% endraw %}
{% endcomment %}

Note that instead of looking at the `id` in the front matter, you could also look for the permalink, using this logic:

{% comment %}
{% raw %}
```
 {% if page.permalink == '/demo/' %}
 {% endif %}
```
{% endraw %}
{% endcomment %}

However, if you change the permalink, the link will break. Using a random ID is probably better.

Note that if you don't want to automatically grab the page ID, you can just write the logic like this:

{% comment %}
{% raw %}
```liquid
{% capture demo %}<a href={{ '/demo' | prepend: site.baseurl }}>Demo</a>{% endcapture %}
```
{% endraw %}
{% endcomment %}

However, if you change your page title from Demo to Demonstration, the links will still say "Demo."

## Notes

I could not find a way to insert the include to links.html into a page template rather than inserting it into each individual page. Whenever I included it into a _layouts file, it never gets recognized.



