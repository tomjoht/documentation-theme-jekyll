---
title: Links
audience: writer, designer
tags: [formatting, navigation]
keywords: links, hyperlinks, cross references, related links, relationship tables
summary: "When creating links, although you can use standard HTML or Markdown, a better way to handle links is to store them as captured variables in an include file, and then reference the capture keywords for the links. This way you can update titles in one place, more easily identify broken links, and better manage your links. This approach is simliar to the keyref-style links in DITA."
last_updated: August 12, 2015
---
{% include linkrefs.html %} 

## Link strategies

One of the more difficult parts of a documentation site is keeping all the internal links accurate and valid. Although there are many ways to create links, I'll just describe what I've found to work well.

## Create an external link

When linking to an external site, use Markdown formatting:

```
[Google](http://google.com)
```

If you need to use HTML, use the normal syntax:

```html
<a href="http://google.com">Google</a>
```

## Linking to internal pages

When linking to internal pages, you could use this same syntax:

```
[Sample](sample.html)
```

OR

```html
<a href="sample.html">Sample</a>
```

However, what happens when you change the page's title or link? Jekyll doesn't automatically pull in the page's title when you create links.

In my experience, coding links like this results in a lot of broken links.

## Managed links

For internal links, I've found that it's a best practice to store the link in an internal file so that I can easily update all references to the link.

In this theme, the \_includes folder contains a links_doc.html file where the capture tags are stored. For each link, I create the follow pair of capture tags:

```html
{%raw%}
{% capture sample %}<a href="sample.html">Sample</a>{% endcapture %}
{% capture sample_i %}<a href="sample.html">{% endcapture %}
{% endraw %}
```

The linksref.html file includes the links_doc.html, so when you add `{% raw %}{% include linkrefs.html %}{% endraw %}` at the top of a page, it includes all of the link variables captured here.

To insert a link to sample, do this:

```liquid
{% raw %}
{{sample}}
{% endraw %}
```

If you want to insert the link with custom anchor text, use this: 

```liquid
{% raw %}
See the {{sample_i}}sample page here{{end_i}}.
{% endraw %}
```

Make sure that the links_doc.html file also includes this capture at least once:

```
{% raw %}
{% capture end_i %}</a>{% endcapture %}
{% endraw %}
```

Otherwise, your link won't close.

## Relative link paths

The site is coded with relative links. There aren't any permalinks, urls, or baseurls. The folder structure you see in the project directory is the same folder directory that gets built in the site output.

Author all pages in your root directory. This greatly simplifies linking. However, when you're linking to images, files, or other content, you can put them in subfolders. 

For example, to link to a file stored in files/doc/myguide.pdf, you would use "files/doc/myguide.pdf" as the link. 

Why not put pages into subfolders? If you put a page into a subfolder, then links to the stylesheets, JavaScript, and other sources will fail. On those sub-folder pages, you'd need to use `../` to move up a level in the directory. But if you have some pages in some folders, others in sub-sub-folders, and others in the root, trying to guess which files should contain `../` or `../../` or nothing at all and which shouldn't will be a nightmare.

Jekyll gets around some of this link path variation by using `baseurl` and including code that prepends the `baseurl` before a link. This converts the links into absolute rather than relative links.

With absolute links, the site only displays at the `baseurl` you configured. This is problematic for tech docs because you usually need to move files around from one folder to another based on versions you're archiving or when you're moving your documentation from draft to testing to production folders.

## Limitations with links

One of the shortcomings in this theme is that your links_doc.html file and your sidebar.yml file aren't generated from the same source. If you change a link title, you have to change it in both of these locations. 

Another limitation is that a link to the page never gets the title of the page automatically.

If you have solutions for either of these issues, please let me know.

