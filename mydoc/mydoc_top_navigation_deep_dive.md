---
title: Top navigation
tags: 
  - navigation
keywords: "custom menu, custom_menu, pop-out, frameescape, frame escape, top nav bar, topnav"
last_updated: "November 30, 2015"
summary: "The top navigation provides some additional features involving a custom menu and pop-out link that you can customize."
---

{{site.data.alerts.note}} For basic information about configuring the top navigation, see {{site.data.mydoc.mydoc_urls.mydoc_top_navigation.link}}. This section gets into the top navigation in more depth. {{site.data.alerts.end}}
## Custom Menu

It's common to publish multiple sites. If you want to link the multiple together, you could simply list links to the other doc sites in a drop-down menu configured in the topnav_dropdowns section in the topnav_doc.yml file. However, suppose you want to do something more fancy.

Included in the topnav.html file is an include to /doc/custom_menu.html. The code in custom_menu.html is as follows:

{% raw %}
```html
<li class="dropdown">
    <a href="#" class="dropdown-toggle otherProgLangs" data-toggle="dropdown">Custom Menu<b class="caret"></b></a>
    <ul class="dropdown-menu">
        <li {% if site.audience == "writers" %}class="dropdownActive"{% endif %}><a href="{% if page.homepage == true or page.switch == false %}../mydoc_writers/">Writer docs</a> {% else %} ../mydoc_writers{{page.url}}">Writer docs</a>{% endif %}</li>

<li {% if site.audience == "designers" %}class="dropdownActive"{% endif %}><a href="{% if page.homepage == true or page.switch == false %}../mydoc_designers/">Designer docs</a> {% else %} ../mydoc_designers{{page.url}}">Designer docs</a>{% endif %}</li>

</ul>
</li>
```
{% endraw %}

{{site.data.alerts.note}} In the theme, the link to the custom_menu.html include in the \_includes/topnav.html file is currently commented out. This is because this feature only works when you have multiple outputs hosted on the same server. 

Github Pages, where I'm publishing this theme, allows only one output per Github Pages directory. So rather than removing this custom_menu feature from the theme, I've just commented it out so that it won't appear broken in the demo.{{site.data.alerts.end}}

The current doc site is highlighted. If you select another doc site, the site switches to that doc site and goes to the same page on that doc site. This way, if you have a task such as "Configuring the license" in several different programming languages, users can switch to other programming languages to see the same page.

You need to have both the designers and writers sites deployed on a web server to see this in action. Once deployed, browse to any page in the navigation. Then go to the **Custom Menu** and select the **Writers** site. You'll go to the exact same page but on the Writers site.

If your current page doesn't have an equivalent in your other outputs, then put this in the frontmatter of the page:

```
switch: false
```

This Custom Menu may not be something you want, and if so, just remove the include from the sidebar.html file. But if you're outputting multiple sites, it may be something valuable. You will need to customize the previous code sample to be specific to your project names.

## Pop-out link

The topnav.html file also has an include to frameescape.html (which is also commented out). What does this file do? If the site is embedded inside a frame, a link on the top navigation bar appears that says Pop-out, and it will open the site in a new window. 

In most cases, you'll want to simply remove this include. I added this because some of my doc sites are delivered through a Salesforce Community and are embedded inside another page in a small area. This pop-out link is a way of liberating the site from these embedded page scenarios. If your site isn't embedded in an iframe, the Pop-out link doesn't appear. (Also, because it is commented out, it won't appear.) You can remove this part of the theme.