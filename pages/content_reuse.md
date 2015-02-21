---
title: Content reuse
permalink: /content_reuse/
---
{% include_relative reuse/variables.html %}

## Include re-used components

To include any content from your reuse directory, you must add this on each page:

{% raw %}
```
{% include_relative reuse/variables.html %}
```
{% endraw %}

Unfortunately, there's not a way to automatically include this reference on every Jekyll page. This file includes all callouts, links, and notes, and makes them available to you on the page. It won't insert the content from each of these files -- it just makes the variables in scope.

## Insert a callout or alert

A number of callouts and alerts are available through what might be called "shortcodes" (to borrow a term from WordPress). In the pages/reuse/callouts.html file, I created various callouts and alerts from Bootstrap styles and Font Awesome images. Browse the file to see what's available:

To insert a callout or alert, just include the following:

{% raw %}
```
{{calloutdanger}}
<h4>This is a warning</h4>whatever you do, do not trip while getting off a skyscraper's viewpoint platform.
{{end}}
{% endraw %}
```

Use the name of the callout or alert you want. You can see sample styles on the {{alerts}} page.

You can add more callouts or alerts to the file as needed. Just follow the format shown in the callouts.html file. All of the styles need to have a closing `div` tag, so I created just one called {% raw %}`{{end}}`{% endraw %}.

Note that if you use any component from the reuse folder, you must add the include to the reuse file on the page where you're using it:

{% raw %}
```
{% include_relative reuse/variables.html %}
```
{% endraw %}


## Reuse a note

You can create notes that you re-use. In the pages/reuse.html file, add something like this:

{% raw %}
```
{% capture warning_message %}
Lock the door before you leave the building.
{% endcapture %}
```
{% endraw %}

Then use {% raw %}```{{ warning_message }}```{% endraw %} where you want to embed it.

As with other components from reuse, remember to add {% raw %}`{% include_relative reuse/variables.html %}`{% endraw %} on the page where you're reusing content.

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


