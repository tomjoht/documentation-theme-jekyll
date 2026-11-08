---
title: Links
audience: writer, designer
tags: [formatting, navigation]
keywords: links, hyperlinks, cross references, related links, relationship tables
summary: "When creating links, you can use standard HTML or Markdown formatting. However, you can also implement an automated approach to linking that makes linking much less error-prone (meaning less chances of broken links in your output) and requiring less effort."
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

If you change the file name, you'll have to update all of your links.

## Automated links {#automatedlinks}

The theme can also build the links for you from your sidebar and top navigation files. The links.html file in \_includes loops through every sidebar listed under `sidebars` in \_config.yml, plus the topnav file, and writes a Markdown reference for each URL it finds.

To use it, add this line at the bottom of the page:

```liquid
{% raw %}{% include links.html %}{% endraw %}
```

Then link to any page in a sidebar by using its file name without the extension as a Markdown reference:

```
[Icons][mydoc_icons]
```

For a sidebar URL of `/mydoc_icons.html`, the reference name is `mydoc_icons`. If the URL is in a subfolder, such as `/product1/overview.html`, the slashes are removed from the reference name, so the reference is `product1overview`. If the sidebar URL includes an anchor, such as `/mydoc_icons.html#bootstrap`, keep the `.html` in the name: `[Bootstrap icons][mydoc_icons.html#bootstrap]`.

This approach has two advantages. First, a link to a page that isn't in any sidebar won't resolve. Kramdown leaves the brackets in the output as plain text, so you can find broken links by searching the built site for `][`. Second, when you rename a page, you update its URL in one place, the sidebar, and all the links follow.

## Links from pages in subfolders

The theme writes all of its links and asset paths relative to the current page, so the site works under any `baseurl` and when you open the built files directly from your computer. Pages can live in subfolders. For example, a page with `permalink: /product1/install/overview.html` gets `../../` added in front of its stylesheets, scripts, sidebar links, and automated links.

Links that you write by hand in Markdown aren't changed. If you write `[Icons](mydoc_icons.html)` on a page in a subfolder, the browser looks for the file in that subfolder. Use the automated links above, or write the relative path yourself, such as `[Icons](../../mydoc_icons.html)`.

{% include links.html %}
