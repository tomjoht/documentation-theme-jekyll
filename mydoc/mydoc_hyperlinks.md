---
title: Links
audience: writer, designer
tags: [formatting, navigation]
keywords: links, hyperlinks, cross references, related links, relationship tables
summary: "When creating links, you can use standard HTML or Markdown formatting. Note that this approach is susceptible to errors and broken links, so check your outputs for broken links."
last_updated: March 20, 2016
sidebar: mydoc_sidebar
permalink: /mydoc_hyperlinks/
---

## Create an external link

When linking to an external site, use Markdown formatting because it's simplest:

```
[Google](http://google.com)
```

If you need to use HTML, use the normal syntax:

```html
<a href="http://google.com">Google</a>
```

## Linking to internal pages

When linking to internal pages, you can use this same syntax:

```
[Sample]({{ "/page" | prepend: site.baseurl }})
```

OR

```html
<a href="{{ "/page" | prepend: site.baseurl }}">page</a>
```

I find that using the HTML formatting is easiest. Store the code in a shortcut in aText to populate it easily. 

## Avoiding broken links

In general, avoid broken links and outdated titles in links by doing the following:

* Where possible, avoid using the exact titles in link names. For example, if you write, see the <a href="{{ "/mydoc_hyperlinks/" | prepend: site.baseurl}}">Links</a> page, this title is likely to become more outdated than if you were to write, learn how to <a href="{{ "/mydoc_hyperlinks/" | prepend: site.baseurl}}">manage links</a>.
* Use a broken link checker on your site output to see if links are broken.
* Generate a PDF, since the PDF tends to highlight broken links more forcefully.

## Other methods for managing links

You can also adopt an indirect-reference systems for managing links. This involves storing the link text in YAML syntax.
 
If you want to try this method, look in the root directory. The urls.txt file contains the same code as the table of contents (but without the conditional qualifiers), duplicated for each of the sidebars. The code iterates through every page listed in the table of contents sidebars (as well as the top navigation menus) and creates an output that looks like this for each link: 

```yaml
mydoc_introduction:
  title: "Introduction"
  url: "mydoc_introduction"
  link: "<a href='/mydoc_introduction/'>Introduction</a>"
```

From the site output folder (in \_site), open urls.txt and observe that it is properly populated (blank spaces between entries doesn't matter). Then manually copy the contents from the urls.txt and insert it into the \_data/urls.yml file in your project folder. 

Because the urls.txt is produced from the table of contents, you ensure that the same titles and URLs used in your table of contents and top navigation will also be used in your inline links. 
 
To create a link in a topic, just reference the appropriate value in the urls.yml file, like this:

{% raw %}
```html
{{site.data.urls.mydoc_introduction.link}}
```
{% endraw %}

This will insert the following into your topic:

```html
<a href='/mydoc_getting_started/'>Getting started</a>
```

You don't need to worry whether you can use Markdown syntax when inserting a link this way, because the insertion is HTML. 

To insert a link in the context of a phrase, you can use this syntax:

{% raw %}
```html
After downloading the theme, you can [get started in building the theme]({{site.data.urls.mydoc_getting_started.url}}).
```
{% endraw %}

This leverages Markdown syntax. If you're in an HTML file or section, use this:

{% raw %}
```html
<p>After downloading the theme, you can <a href="{{site.data.urls.mydoc_getting_started.url}}">get started in building the theme</a>.</p>
```
{% endraw %}

Note that the `url` value accesses the URL for the page only, whereas `link` gets the title and url in a link format.

You shouldn't have to copy the contents from the urls.txt file into your YAML data source too often &mdash; only when you're creating new pages. 

By using this approach, you're less likely to end up with broken links.

{{site.data.alerts.tip}} To avoid having to remember this long syntax, use a text macro program like <a href="https://itunes.apple.com/us/app/atext/id488566438?mt=12">aText</a>. {{site.data.alerts.end}}

## Always make sure your TOC page is accurate

You should treat your sidebar data files (in /_data/sidebars) with a lot of care. Every time you add a page to your site, make sure it's listed in your sidebar file (or in your top navigation). If you don't have pages listed in your sidebar file, they won't be included in the urls.txt file, and as your site grows, it will be harder to recognize pages that are absent from the TOC.

Because all the pages are stored in the root directory, the list of files can grow really long. I typically find pages by navigating to the page in the preview server, copying the page name (e.g., mydoc_hyperlinks), and then pressing **Shift + Shift** in WebStorm to locate the page.
 
This is the only sane way to locate your pages when you have hundreds of pages in your root directory. If the page isn't listed in your TOC, it will be difficult to navigate to it and find it.

## Checking for broken links

Another way to ensure you don't have any broken links in your output is to [generate a PDF]({{site.data.urls.mydoc_generating_pdfs.url}}). When you generate a PDF, look for the following two problems in the output:

* page 0
* see .

Both instances indicate a broken link. The "page 0" indicates that Prince XML couldn't find the page that the link points to, and so it can't create a cross reference. This may be because the page doesn't exist, or because the anchor is pointing to a missing location.

If you see "see ." it means that the reference (for example, {% raw %}`{{mylink...}}`{% endraw %} doesn't actually refer to anything. As a result, it's simply blank in the output. 

{{site.data.alerts.note}} To keep Prince XML from trying to insert a cross reference into a link, add <code>class="noCrossRef"</code> to the link. {{site.data.alerts.end}}
