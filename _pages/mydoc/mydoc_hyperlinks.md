---
title: Links
audience: writer, designer
tags: [formatting, navigation]
keywords: links, hyperlinks, cross references, related links, relationship tables
summary: "When creating links, you can use standard HTML or Markdown formatting. Note that this approach is susceptible to errors and broken links, so check your outputs for broken links."
last_updated: July 3, 2016
sidebar: mydoc_sidebar
permalink: mydoc_hyperlinks.html
folder: mydoc
---

## Create an external link

When linking to an external site, use Markdown formatting because it's simplest:

```
[Google](http://google.com)
```

## Linking to internal pages

When linking to internal pages, you can manually link to the pages like this:

```
[Icons](mydoc_icons.html)
```

However, if you change the file name, you'll have to update all of your links. It's much easier to use Automated Links, as described in the next section.

## Automated links {#automatedlinks}

This method for automated links creates a master list of all links in a Markdown reference format based on entries in your sidebar table of contents.

With this Automated links method, make sure all your pages are referenced in a sidebar or topnav data file (inside \_data > sidebars). If they're not in a sidebar or top nav (such as links to headings on a page), list them in the `otherlinks.yml` file (which is in the \_data folder).

The links.html file (in \_includes) will iterate through all your sidebars and create a list of reference-style markdown links. This feature works like magic.

To implement managed links:

1.  In your \_config.yml file, list each sidebar in the `sidebars` property &mdash; except for the otherlinks.yml file. (Do not list it here, since there's a different script that parses through its content.)
    
    ```yaml
    sidebars:
    - home_sidebar
    - mydoc_sidebar
    - product1_sidebar
    - product2_sidebar
    ```
    
2.  At the bottom of each topic, include the links.html file:

    ```
    {% raw %}{% include links.html %}{% endraw %}
    ```
    
3.  To link to a topic, use reference-style Markdown links, with the referent using the file name (without the file extension). For example:

    ```
    See the [Icon][mydoc_icons] file.
    ```

    Here's the result:

    See the [Icon][mydoc_icons] file.

    If the link doesn't render, check to make sure the page is correctly listed in the sidebar.

## Automated links to headings on pages {#bookmarklinks}

If you're linking to the specific heading from another page, first give the heading an ID:

```
## Some heading {#someheading}
```

Then add a property into the otherlinks.yml file in your \_data folder:

```yaml
    - title: Some link bookmark
      exact_url: mydoc_pages.html#someheading
      ref: mydocpages_pages-someheading
      
```

And reference it like this:

```
This is [Some link][mydocpages_pages-someheading].
```


{% include links.html %}
