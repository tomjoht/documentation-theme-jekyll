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
[Sample]({{ "/permalink" | prepend: site.baseurl }})
```

OR

```html
<a href="{{ "/permalink" | prepend: site.baseurl }}">page</a>
```

## Managed Links

You can also adopt an indirect-reference systems for managing links. This "managed links" approach involves storing the link text in YAML syntax.
 
Look at the urls.txt file in the root directory. The urls.txt file contains more or less the same code as the table of contents (but without the conditional qualifiers). A `for` loop runs each of the product sidebars listed in the frontmatter through the url generator. 

The code iterates through every page listed in the table of contents sidebars (as well as the top navigation menus) and creates an output that looks like this for each link: 

```yaml
mydoc_introduction:
  title: "Introduction"
  url: "mydoc_introduction"
  link: "<a href='/mydoc_introduction/'>Introduction</a>"
```

In the frontmatter for urls.txt, add the name of each of your sidebars, like this:

```yaml
---
layout: none
search: exclude
sidebar:
- mydoc_sidebar
- product1_sidebar
- product2_sidebar
---
```

From the site output folder (in \_site), open urls.txt and observe that it is properly populated (blank spaces between entries doesn't matter). Then either manually copy the contents from the urls.txt and insert it into the \_data/urls.yml file in your project folder. Or just run the urls-update.sh file:

```
. urls-update.sh
```

This will move and rename the file through a script.

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

You don't need to worry whether you can use Markdown syntax when inserting a link this way, because the code that gets inserted is HTML. 

To insert a link in the context of a phrase, you can use this syntax:

{% raw %}
```html
After downloading the theme, you can [get started in building the theme]({{site.data.urls.mydoc_getting_started.url}}).
```
{% endraw %}

Note that `.url` is used instead of `.link` when using customized text links like this.

If you're in HTML and can't use Markdown, then use the following code: 

{% raw %}
```html
<p>After downloading the theme, you can <a href="{{site.data.urls.mydoc_getting_started.url}}">get started in building the theme</a>.</p>
```
{% endraw %}

The `url` value accesses the URL for the page only, whereas `link` gets the title and url in a link format.

You shouldn't have to transfer the contents from the urls.txt file into your YAML data source too often &mdash; only when you're creating new pages.
 
I also added a simple script called "run.sh" that performs the urls-update.sh command prior to running Jekyll serve, so you can kill two birds with one stone.

Note that for the index.html file, which doesn't have a permalink, this file is not included in the urls.txt generation. The frontmatter in the index.md file (`type: homepage`) triggers an exclusion from urls.txt because the empty name makes the yaml file invalid. To link to the homepage, just refer users to the root url of your site {% raw %}(`{{site.url}}` or `{{site.url}}{{site.baseurl}}`{% endraw %}).

Overall, by using managed links, you're less likely to end up with broken links.

## Bookmark links to sections on other pages

Suppose you want to link to a specific section on another page. First make sure you name the section title with something table. Although Kramdown automatically adds ID tags to heading elements, if you change the heading title, the ID will likewise change. Therefore it's best to manually specify the section titles you plan to link to.

Here's how you specify an ID for a heading in Kramdown:

```
## My heading {#myheading}
```

Link to it using this syntax:


```
[{{site.data.urls.your-page-permalink.title}}]({{site.data.urls.your-page-permalink.url | append: "#myheading"}})
```

Or using HTML:

```
<a href="{{site.data.urls.your-page-permalink.url | append: "#myheading"}}">{{site.data.urls.your-page-permalink.title}}</a>
```

Granted, this is somewhat long, but it's the only way to continue to leverage the automated links from urls.yaml. You want to avoid manually referencing links since they are much more prone to break when you specify them that way. 

However, I'm not too worried about this lengthy syntax because I think linking to sections on pages is somewhat fragile anyway. When you're editing sections, you generally don't know what URLs you have pointing to that section. The custom ID tag on that section is the best reminder that you are linking to the section.

## Bookmark links to sections on the same page

If you're just linking to a section on the same page, the syntax is simple:

```
[My heading](#myheading)
```

## How to tell what links point to a page

There's no automated way to tell what links you have pointing to a page. This is one of the shortcomings of static site generators. The only way is to search your project for the page title. This is simple in Webstorm (Cmd + Shift + F), and it's one of the reasons I like Webstorm. 

If you change a page title, you generally want to search in your project and update all references to the page to the new page name. You can do this easily through the Global Replace command (Cmd + Shift + R).


## Always make sure your TOC page is accurate

You should treat your sidebar data files (in /_data/sidebars) with a lot of care. Every time you add a page to your site, make sure it's listed in your sidebar file (or in your top navigation). If you don't have pages listed in your sidebar file, they won't be included in the urls.txt file, and as your site grows, it will be harder to recognize pages that are absent from the TOC.

Because all the pages are stored in the root directory, the list of files can grow really long. I typically find pages by navigating to the page in the preview server, copying the page name (e.g., mydoc_hyperlinks), and then pressing **Shift + Shift** in WebStorm to locate the page.
 
This is the only sane way to locate your pages when you have hundreds of pages in your root directory. If the page isn't listed in your TOC, it will be difficult to navigate to it and find it.

## Checking for broken links

One way to ensure you don't have any broken links in your output is to [generate a PDF]({{site.data.urls.mydoc_generating_pdfs.url}}). When you generate a PDF, look for the following two problems in the output:

* page 0
* see .

Both instances indicate a broken link. The "page 0" indicates that Prince XML couldn't find the page that the link points to, and so it can't create a cross reference. This may be because the page doesn't exist, or because the anchor is pointing to a missing location.

If you see "see ." it means that the reference (for example, {% raw %}`{{mylink...}}`{% endraw %} doesn't actually refer to anything. As a result, it's simply blank in the output. 

{{site.data.alerts.note}} To keep Prince XML from trying to insert a cross reference into a link, add <code>class="noCrossRef"</code> to the link. {{site.data.alerts.end}}

## Avoiding broken links

In general, avoid broken links and outdated titles in links by doing the following:

* Where possible, avoid using the exact titles in link names. For example, if you write, see the <a href="{{ "/mydoc_hyperlinks/" | prepend: site.baseurl}}">Links</a> page, this title is likely to become more outdated than if you were to write, learn how to <a href="{{ "/mydoc_hyperlinks/" | prepend: site.baseurl}}">manage links</a>.
* Use a broken link checker on your site output to see if links are broken.
* Generate a PDF, since the PDF tends to highlight broken links more forcefully.