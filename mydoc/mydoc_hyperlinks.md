---
title: Links
audience: writer, designer
tags: [formatting, navigation]
keywords: links, hyperlinks, cross references, related links, relationship tables
summary: "When creating links, although you can use standard HTML or Markdown, this approach is usually susceptible to a lot of errors and broken links. There's a URL generator that will facilitate linking to other pages in ways that ensures the links won't break."
last_updated: November 30, 2015
---

## Link strategies

One of the more difficult parts of a documentation site is keeping all the internal links accurate and valid. When you're single sourcing, you usually have multiple documentation outputs that include certain pages for certain audiences. Orphan links are a common problem to avoid. 

Although there are many ways to create links, I'll just describe what I've found to work well.

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

For internal links, I've found that it's a best practice to store the link in a YAML file that is derived from the table of contents. 

The theme has a file called urls_mydoc.txt. This file contains the same code as the table of contents (but without the conditional qualifiers). It iterates through every page listed in the table of contents sidebar (as well as the top navigation menus) and creates an output that looks like this for each link: 

```yaml
mydoc_getting_started:
  title: "Getting started with this theme"
  url: "mydoc_getting_started.html"
  link: "<a href='mydoc_getting_started.html'>Getting started with this theme</a>"
```

From the site output folder (in ../doc_outputs), open urls_mydoc.txt and observe that it is properly populated (blank spaces between entries doesn't matter). Then manually copy the contents from the mydoc_urls.txt and insert it into the \_data/mydoc/mydoc_urls.yml file in your project folder. 

Because the urls.txt is produced from the table of contents, you ensure that the same titles and URLs used in your table of contents and top navigation will also be used in your inline links. 
 
To create a link in a topic, just reference the appropriate value in the urls.yml file, like this:

{% raw %}
```html
{{site.data.mydoc.mydoc_urls.mydoc_getting_started.link}}
```
{% endraw %}

This will insert the following into your topic:

```html
<a href='mydoc_getting_started.html'>Getting started with this theme</a>
```

You don't need to worry whether you can use Markdown syntax when inserting a link this way, because the insertion is HTML. 

To insert a link in the context of a phrase, you can use this syntax:

{% raw %}
```html
After downloading the theme, you can [get started in building the theme]({{site.data.mydoc.mydoc_urls.mydoc_getting_started.url}}).
```
{% endraw %}

This leverages Markdown syntax. If you're in an HTML file or section, use this:

{% raw %}
```html
<p>After downloading the theme, you can <a href="{{site.data.mydoc.mydoc_urls.mydoc_getting_started.url}}">get started in building the theme</a>.</p>
```
{% endraw %}

Note that the `url` value accesses the URL for the page only, whereas `link` gets the title and url in a link format.

You shouldn't have to copy the contents from the urls.txt file into your YAML data source too often &mdash; only when you're creating new pages. 

By using this approach, you're less likely to end up with broken links.

{{site.data.alerts.tip}} To avoid having to remember this long syntax, use a text macro program like <a href="https://itunes.apple.com/us/app/atext/id488566438?mt=12">aText</a>. {{site.data.alerts.end}}

## Always make sure your TOC page is accurate

You should treat your sidebar_doc.yml file with a lot of care. Every time you add a page to your site, make sure it's listed in your sidebar_doc.yml file (or in your top navigation). If you don't have pages listed in your sidebar_doc.yml file, they won't be included in the urls_mydoc.txt file, and as your site grows, it will be harder to recognize pages that are absent from the TOC.

Because all the pages are stored in the root directory, the list of files can grow really long. I typically find pages by navigating to the page in the preview server, copying the page name (e.g., mydoc_hyperlinks), and then pressing **Shift + Shift** in WebStorm to locate the page.
 
 This is the only sane way to locate your pages when you have hundreds of pages in your root directory. If the page isn't listed in your TOC, it will be difficult to navigate to it and find it.

## Checking for broken links

Another way to ensure you don't have any broken links in your output is to [generate a PDF]({{site.data.mydoc.mydoc_urls.mydoc_generating_pdfs.url}}). When you generate a PDF, look for the following two problems in the output:

* page 0
* see .

Both instances indicate a broken link. The "page 0" indicates that Prince XML couldn't find the page that the link points to, and so it can't create a cross reference. This may be because the page doesn't exist, or because the anchor is pointing to a missing location.

If you see "see ." it means that the reference (for example, {% raw %}`{{mylink...}}`{% endraw %} doesn't actually refer to anything. As a result, it's simply blank in the output. 

{{site.data.alerts.note}} To keep Prince XML from trying to insert a cross reference into a link, add <code>class="noCrossRef"</code> to the link. {{site.data.alerts.end}}

## Relative link paths

The site is coded with relative links. There aren't any permalinks, urls, or baseurls. The folder structure you see in the project directory is the same folder directory that gets built in the site output.

Author all pages in your root directory. This greatly simplifies linking. However, when you're linking to images, files, or other content, you can put these assets into subfolders. 

For example, to link to a file stored in files/doc/whitepaper.pdf, you would use "files/doc/whitepaper.pdf" as the link. 

Why not put pages too into subfolders? If you put a page into a subfolder, then links to the stylesheets, JavaScript, and other sources will fail. On those sub-folder pages, you'd need to use `../` to move up a level in the directory to access the stylesheets, JavaScript, etc. But if you have some pages in folders on one level, others in sub-sub-folders, and others in the root, trying to guess which files should contain `../` or `../../` or nothing at all and which shouldn't will be a nightmare.

Jekyll gets around some of this link path variation by using `baseurl` and including code that prepends the `baseurl` before a link. This converts the links into absolute rather than relative links.

With absolute links, the site only displays at the `baseurl` you configured. This is problematic for tech docs because you usually need to move files around from one folder to another based on versions you're archiving or when you're moving your documentation from draft to testing to production folders.

## Limitations with links

One of the shortcomings in this theme is that the link titles in the sidebar and inline links don't necessarily have to match the titles specified on each page. You have to manually keep the page titles in sync with the titles listed in the sidebar and top navigation. Although I could potentially get rid of the titles key in the article topic, it would make it more difficult to know what page you're editing.
