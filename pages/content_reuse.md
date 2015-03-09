---
title: Content reuse
permalink: /content_reuse/
---

## Include re-used components

To reuse content, store it in the notes.yml file in the _data folder. Use yml syntax, following the example shown in the file.

## Insert a callout or alert

A number of callouts and alerts are available through what might be called "shortcodes" (to borrow a term from WordPress). In the _data/callouts.yml file, I created various callouts and alerts from Bootstrap styles and Font Awesome images. Browse the file to see what's available:

To insert a callout or alert, just include the following:

{% raw %}
```
{{site.data.callouts.calloutdanger}}
<h4>This is a warning</h4>whatever you do, do not trip while getting off a skyscraper's viewpoint platform.
{{site.data.callouts.end}}
{% endraw %}
```

Use the name of the callout or alert you want. You can see sample styles on the {{alerts}} page.

You can add more callouts or alerts to the file as needed. Just follow the format shown in the callouts.yml file. All of the styles need to have a closing `div` tag, so I created just one called {% raw %}`{{site.data.callouts.end}}`{% endraw %}.

## Add conditional filtering

You can do conditional filtering on a page using Liquid tags. Here's a simple way to filter content based on whether the user has a Mac or PC:

In your _data/options.yml file, create a key-value pair such as `audience: mac`. Then use an `if-elsif` statement to render the conditional logic:

{% raw %}
```
{% if site.data.options.audience == "mac" %}
The mac audience should see this...
{% elsif site.data.options.audience == "pc" %}
The pc audience should see this ...
{% endif %}
```
 {% endraw %}

If you have different outputs, you can create different toggles. All the files inside _data are accessible by using {% raw %}`{{site.data.options.audience}}` {% endraw %}, where `options` is the name of the file inside the _data folder you're accessing, and `audience` is the key in the key-value pair in the file.

If you set options in your configuration file, you can access them with a shorter syntax: {% raw %}`{{site.audience}}` {% endraw %}. However, note that to see any changes to your configuration file, you'll need to restart the Jekyll server (by pressing Ctrl+C to stop the server, and then use your up arrow to toggle to your previous build command, and then press Return).

## Embed a page inside another page

You can embed a page inside another page through a couple of different methods. You can create an include. Put the file inside the reuse folder, and then use a tag like this:

{% raw %}
```
{% include_relative reuse/mypage.html %}
```
{% endraw %}

Alternative, you can add an ID tag to a page's frontmatter, and then get the page using this method:

{% raw %}
{% for page in site.pages %}
{% for id in page.id %}
{% if page.id == site.homepage_id %}
{{page.content}}
{% endif %}
{% endfor %}
{% endfor %}
``` 
{% endraw %}

This is how the index.html file in the root gets the homepage. 

## Page-level variables

You can create custom variables in your frontmatter like this: 

```
---
title: Page-level variables
permalink: /page_level_variables/
thing1: Joe
thing2: Dave
---
```

You can then access the values in those custom variables using the `page` namespace, like this:


{% raw %}
```
thing1: {{page.thing1}}
thing2: {{page.thing2}}
```
{% endraw %}


