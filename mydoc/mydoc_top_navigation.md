---
title: 7. Configure the top navigation
tags: 
  - navigation
keywords: "bootstrap, lists, drop-down, drop down navigation, top nav bar, topnav"
last_updated: "November 30, 2015"
summary: "The top navigation provides either single links or a drop-down menu. There are some other features, such as a feedback email, custom menu, and popout link."
series: "Getting Started"
weight: 7
---

{% include custom/mydoc/getting_started_series.html %}

## Changing the top navigation

The top navigation reads from the \_data/mydoc/mydoc_topnav_doc.yml file. There are two *separate* sections in the mydoc_topnav_doc.yml file:

* `topnav`
* `topnav_dropdowns`

Items in the `topnav` section are rendered as single links. In contrast, items in the `topnav_dropdowns` section are rendered as a drop-down menu. You can't mix up the order of single links and drop-down links. The single links appear on the left, and the drop-down menus appear on the right.

## The Feedback email

If you click the Feedback link in the default theme, you'll see that it inserts the link to the current page along with a subject header and body. The topnav.html file contains an include to feedback.html. The feedback.html file contains the JavaScript that gets the current page URL and inserts it into the message body.

You configure the email in the configuration file through this property: `site.feedback_email`.

## External links

If you want the URL to point to an external site, use `external_url` instead of `url` in the data file. Then just enter the full HTTP URL. When you use `external_url`, the sidebar.html will apply this logic:

{% raw %}
```html
{% if item.external_url %}
<li><a href="{{item.external_url}}" target="_blank">{{subcategory.title}}</a></li>
```
{% endraw %}

## No links in topnav get included in the PDF

The way the PDF file is currently set up, only the links in the sidebar get included in the PDF. None of the links in the top nav get included in the PDF. 

It wouldn't be hard to iterate through the top navigation bar and included the content in the PDF as well, but I think it's a best practice to put content links in the sidebar, and to put external links/resources in the top navigation.

If people open the site in a small browser, the top navigation will compress to a "hamburger." There's not a ton of room for adding links in this space.

Also note that the drop-down menus have one level only.

