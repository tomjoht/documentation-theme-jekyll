---
title: Top navigation
tags: [navigation]
keywords: bootstrap, lists, drop-down, drop down navigation, top nav bar, topnav
last_updated: August 12, 2015
summary: "The top navigation provides either single links or a drop-down menu. There are some other features, such as a feedback email, custom menu, and popout link."
---
{% include linkrefs.html %}

## Changing the top navigation

The top navigation reads from the \_data/topnav_doc.yml file. There are two *separate* sections:

* `topnav`
* `topnav_dropdowns`

Items in the `topnav` section are rendered as single links. In contrast, items in the `topnav_dropdowns` section are rendered as a drop-down menu.

## The Feedback email

If you click the Feedback link, it inserts the link to the current page along with a subject header and body. The topnav.html file contains an include to feedback.html. This file contains the JavaScript that gets the current page URL and inserts it into the message body.

You configure the email in the configuration file with this property: `site.feedback_email`.

## Custom Menu

It's common to publish multiple sites. If you want to link them together, you could simply list links to the other doc sites in a drop-down menu configured in the topnav_dropdowns section in the topnav_doc.yml file. However, suppose you want to do something more fancy.

Included in the topnav.html file is an include to /doc/customMenu.html. The code in customMenu.html is as follows:

```
<li {% if site.audience == "writers" %}class="dropdownActive"{% endif %}><a href="{% if page.homepage == true or page.switch == false %}../doc_writers/{{site.suffix}}">Writer docs</a> {% else %} ../doc_writers{{page.url}}">Writer docs</a>{% endif %}</li>

<li {% if site.audience == "designers" %}class="dropdownActive"{% endif %}><a href="{% if page.homepage == true or page.switch == false %}../doc_designers/{{site.suffix}}">Designer doc</a> {% else %} ../doc_designers{{page.url}}">Designer docs</a>{% endif %}</li>
```

The current doc site is highlighted. If you select another doc site, the site switches to that doc site and goes to the same page on that doc site. This way, if you have a task such as "Configuring the license" in several different programming languages, users can switch to other programming languages to see the same page.

You need to have both the designers and writers sites deployed on a web server to see this in action. Go to the following link: <a href="http://idratherbetellingstories.com/documentation-theme-jekyll/doc_designers/" target="_blank">idratherbetellingstories.com/documentation-theme-jekyll/doc_designers/</a>.

Browse to any page in the navigation. Then go to the **Custom Menu** and select the **Writers** site. You'll go to the exact same page but on the Writers site.

If your current page doesn't have an equivalent in your other outputs, then put this in the frontmatter of the page:

```
switch: false
```

This Custom Menu may not be something you want, and if so, just remove the include from the sidebar.html file. But if you're outputting multiple sites, it may be something valuable.

## Pop-out link

The top navigation bar also has an include to frameescape.html. If the site is embedded inside a frame, a link on the top navigation bar appears that says Pop-out, and it will open the site in a new window. 

In most cases, you'll want to simply remove this include. I added this because some of my doc sites are delivered through a Salesforce Community and are embedded inside another page in a small area. This pop-out link is a way of liberating the site from these embedded page scenarios. If your site isn't embedded in an iframe, the Pop-out link is removed.


