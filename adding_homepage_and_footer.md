---
title: Adding a homepage and footer
permalink: /adding_homepage_and_footer/
---

Because you may be creating multiple outputs from the same source files, this theme separates out the homepage and footer. 

For your homepage, put `id: homepage` in the frontmatter of a page (make sure only one page in the project has it -- exclude any others). The footer is pulled in through the `id: footer` in the frontmatter. Again, make sure only one file in the project has this id in the frontmatter.

## How Jekyll processes the footer

By default, Jekyll looks for the index.html page in the root directory and uses this as the homepage. However, if you have 5 different projects, your homepage will project have 5 different versions. You could use the same homepage and add some conditional tags to it. But currently the index.html file looks like this:

{% raw %}
```
{% for page in site.pages %}
{% for id in page.id %}
{% if page.id == site.homepage_id %}
{{page.content}}
{% endif %}
{% endfor %}
{% endfor %} 
```
{% endraw %}

It looks for the page with the id of `homepage_id` and uses it for the homepage. If this setup isn't what you want, then just put your homepage content in the index file directly.