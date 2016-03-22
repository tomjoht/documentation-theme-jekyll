---
title: Getting started
tags: [getting_started]
sidebar: mydoc_sidebar
---


## Make sure you can build a vanilla Jekyll site first

To get up and running with this theme, make sure you can build a vanilla jekyll site first. See the [Jekyll docs](http://jekyllrb.com/).

If you're in Windows, you might want to [install Jekyll using Chocolately](https://www.google.com/search?q=install+jekyll+using+chocolately).

## Build this theme

1. Download the theme from the [Github repo for the Jekyll doc theme](https://github.com/tomjohnson1492/documentation-theme-jekyll).
2. Delete the Gemfile and Gemfile.lock files in the theme (unless you're planning to publish on Github Pages. If that's the case, see <a href="{{ "/mydoc_publishing_github_pages" | prepend: site.baseurl }}">Publishing on Github Pages</a>.
3. Customize the values in the \_config.yml file following the documentation included in that file).
3. Build the site using the usual Jekyll command: `jekyll serve`.

## Configuring the theme

There are several products in this theme. Each product uses a different sidebar. This is the essence of what makes this theme unique -- different sidebars for different product documentation. The idea is that when users are reading documentation for a specific product, the sidebar navigation should be specific to that product. The top navigation remains the same, because it allows users to navigate across products. But the sidebar navigation adapts to the product.

## Where to store your documentation topics

Store your files for each product inside subfolders following the pattern shown in the theme. For example, product1, product2, etc. You can store your topics inside sub-subfolders to your heart's content. When Jekyll builds your site, it will pull the topics into the root directory and use the permalink for the URL.

## Configuring the sidebar

Because each product uses a different sidebar, you'll need to set up your sidebars. There's a file inside \_includes/custom called "sidebarconfigs.html". This file controls which sidebar gets associated with which product.

The sidebarconfigs.html file uses simple `if elsif` logic to set a variable that the sidebar.html file uses to read the sidebar data file. The code in sidebarconfigs.html looks like this:

{% raw %}
```liquid
{% if page.sidebar == "home_sidebar" %}
{% assign sidebar = site.data.sidebars.home_sidebar.entries %}

{% elsif page.sidebar == "product1_sidebar" %}
{% assign sidebar = site.data.sidebars.product1_sidebar.entries %}

{% elsif page.sidebar == "product2_sidebar" %}
{% assign sidebar = site.data.sidebars.product2_sidebar.entries %}

{% elsif page.sidebar == "mydoc_sidebar" %}
{% assign sidebar = site.data.sidebars.mydoc_sidebar.entries %}

{% elsif page.sidebar == "tags_sidebar" %}
{% assign sidebar = site.data.sidebars.tags_sidebar.entries %}

{% else %}
{% assign sidebar = site.data.sidebars.home_sidebar.entries %}
{% endif %}
```
{% endraw %}

In each page's frontmatter, you must specify the sidebar you want that page to use. Here's an example of the page frontmatter showing the sidebar property:

```
---
title: Alerts
tags: [formatting]
keywords: notes, tips, cautions, warnings, admonitions
last_updated: March 20, 2016
summary: "You can insert notes, tips, warnings, and important alerts in your content. These notes are stored as shortcodes made available through the linksrefs.hmtl include."
sidebar: mydoc_sidebar
permalink: /mydoc_alerts/
---
```

The `sidebar: mydoc_sidebar` refers to the \_data/sidebars/mydoc_sidebar.yml file.

If no sidebar assignment is found in the page frontmatter, the default sidebar (specified by the `else` statement) will be shown: `site.data.sidebars.home_sidebar.entries`.

Note that your sidebar can only have 2 levels. Given that each product has its own sidebar, this depth should be sufficient. Deeper nesting goes against usability recommendations.

## Sidebar syntax

The sidebar data file uses a specific YAML syntax that you must follow. Follow the sample pattern shown:

```yaml
- title: Overview
output: web, pdf
items:
- title: Mydoc home
url: /mydoc_landing_page/
output: web
```

Each heading must contain a title and output property. Each item must contain a title, url, and output property.

The two outputs available are web and pdf. (Even if you aren't publishing PDF, you still need to specify `output: web`).

The YAML syntax depends on exact spacing, so make sure you follow the pattern shown in the sample sidebars. See my [YAML tutorial](mydoc_yaml_tutorial) for more details about how YAML works.

To accommodate the title page and table of contents in PDF outputs, each product sidebar must list these pages before any other:

```yaml
- title:
output: pdf
type: frontmatter
items:
- title:
url: /titlepage/
output: pdf
type: frontmatter
- title:
url: /tocpage/
output: pdf
type: frontmatter
```

Leave the output as `output: pdf` so that they don't appear in the web output.

## Page frontmatter

When you write pages, include this same frontmatter in each page:

```yaml
---
title: "Some title"
tags: [sample1, sample2]
keywords: keyword1, keyword2, keyword3
last_updated: Month day, year
summary: "optional summary here"
sidebar: sidebar name
permalink: /yoururl/
---
```

(If you're using Webstorm, you can set up a template to auto-populate this code when you create a new file.)

For titles, surrounding the title in quotes is optional, but if you have a colon in the title, you must surround the title with quotation marks.

Keywords get populated into the metadata of the page for SEO.

Tags must be defined in your \_data/tags.yml list. You also need a corresponding tag file inside the tags folder that follows the same pattern as the other tag files shown in the tags folder. (Jekyll wont auto-create these tag files.)
```

If you don't want the mini-TOC to show on a page (such as for the homepage or landing pages), add `toc: false` in the frontmatter.

## Configure the top navigation

The top navigation bar's menu items are set through the _data/topnav.yml file. Use the top navigation bar to provide links for navigating from one product to another, or to navigate to external resources.

For external URLs, use `external_url` in the item property, as shown in the example topnav.yml file. For internal links, use `url` as usual.

Note that the topnav has two sections: topnav and topnav_dropdowns. The topnav section contains single links, while the topnav_dropdowns section contains dropdown menus. The two sections are independent of each other.

## Generating PDF

If you want to generate PDF, you'll need a license for [Prince XML](http://www.princexml.com/). You will also need to [install Prince](http://www.princexml.com/doc/installing/).  You can generate PDFs by product (but not for every product on the site combined together into one massive PDF). Prince will work even without a license, but it will imprint a small Prince image on the first page.

Open up the css/printstyles.css file and customize the email address (`youremail@domain.com`) that is listed there. This email address appears in the bottom left footer of the PDF output. You'll also need to create a PDF configuration file following the examples shown in the pdfconfigs folder, and also customize some build scripts following the same pattern shown in the root: pdf-product1.sh

See the section on [generating PDFs](mydoc_generating_pdfs) for more details about setting the theme up for this output.

## Blogs / News

For blog posts, create your markdown files in the \_posts folder following the sample formats. Post file names always begin with the date (YYYY-MM-DD-title).

The news/news.html file displays the posts, and the news_archive.html file shows a yearly history of posts. In documentation, you might use the news to highlight product features outside of your documentation, or to provide release notes and other updates.

## Markdown

This theme uses Kramdown markdown. Kramdown is similar to Github-flavored Markdown, except that when you have text that intercepts list items, the spacing of the intercepting text must align with the spacing of the first character after the space of a numbered list item.


## Other instructions

For other details in working with the theme, see the various sections in the sidebar.



