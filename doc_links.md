---
title: Links
audience: writer, designer
tags: [formatting, navigation]
last_updated: 
summary: 
---
{% include linkrefs.html %} 

## Link strategy

One of the more difficult parts of a documentation site is keeping all the internal links accurate and valid. Although there are many ways to create links, I'll just describe what I've found to work well.

## Create an external link

When linking to an external site, use Markdown formatting:

```
[Google](http://google.com)
```

If you need to use HTML, use the normal syntax:

```
<a href="http://google.com">Google</a>
```

## Linking to internal pages

When linking to internal pages, you could use this same syntax:

```
[Sample](sample.html)
```

OR

```
<a href="sample.html">Sample</a>
```

However, what happens when you change the page's title or link? In my experience, coding links like this results in a lot of broken links.

## Managed links

For internal links, it's a best practice to store the link in an internal file so that you can easily update all references to the link. 

In this theme, the includes folder contains a links_doc.html file where the capture tags are stored:

```html
{%raw%}
{% capture sample %}<a href="sample.html">Sample</a>{% endcapture %}
{% capture sample_i %}<a href="sample.html">{% endcapture %}
{% endraw %}
```

The linksref.html file includes the links_doc.html, so when you add `{% raw %}{% include linkrefs.html %}{% endraw %}` at the top of a page, it includes all of the link variables. 

To insert a link to sample, do this:

```
{{sample}}
```

If you want to insert the link with custom anchor text, use this: 

```
See the {{sample_i}}sample page here{{end_i}}.
```

Sometimes you want to refer to the page's full title while other times you want to link running text within your sentence.

Make sure that the links_doc.html file also includes this at least once:

```
{% capture end_i %}</a>{% endcapture %}
```

Otherwise, your link won't close.

## Relative link paths

The site is coded with relative links. There aren't any permalinks, urls, or baseurls. The folder structure you see in the project directory is the same folder directory that gets built in the site output.

Author all pages in your root directory. This greatly simplifies linking. However, when you're linking to images, files, or other content, you can put them in subfolders. 

For example, to link to a file stored in files/doc/myguide.pdf, you would use "files/doc/myguide.pdf" as the link. 

Why not put pages into subfolders? If you put a page into a subfolder, then links to the stylesheets, JavaScript, and other sources will fail. On those sub-folder pages, you'd need to use ../ to move up a level in the directory. But if you have some pages in some folders, others in sub-sub-folders, and others in the root, then trying to guess which files should contain ../ and which shouldn't will be a nightmare.

Jekyll gets around some of this by using baseurl and including code that prepends the baseurl before a link. This converts the links into absolute rather than relative links. With absolute links, the site only displays at the baseurl you configured. This is problematic for tech docs because you usually need to move files around from one folder to another based on versions you're archiving or how you're publishing your documentation from draft to testing to production folders.

## Limitations with links

One of the shortcomings in this theme is that your links_doc.html file and your sidebar.yml file aren't generated from the same source. If you change a link title, you have to change it in both of these locations. 

Another limitation is that a link to the page never gets the title of the page automatically. 

