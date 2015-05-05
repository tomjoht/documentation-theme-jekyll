---
title: Tags
permalink: /tags/
audience: writer, designer
tags: []
keywords: 
audience: 
last_updated: 
summary: 
---
{% include linkrefs.html %} 

You can add tags to pages by adding `tags` in the frontmatter, like this:

```
---
title: 2.0 Release Notes
permalink: /release_notes_2_0/
tags: overview, getting-started
---
```

To prevent tags from getting out of control and inconsistent, first make sure the tag appears in the tags.yml file. If it's not there, the tag you add to a page won't be read.

Additionally, you must create a tag archive page similar to the other pages inside the pages/tag-archive folder. This theme doesn't auto-create tag archive pages. 

For simplicity, make all your tags single words (connect them with hyphens if necessary).

{% if site.audience == "designer" %}
## Retrieving pages for a specific tag

If you want to retrieve pages outside of a particular tag-archive page, you could use this code:

{% raw %}
```html
{% for page in site.pages limit: 5 %}
{% for tag in page.tags %}
{% if tag == "release_notes" %}
<li><a href="{{ page.permalink | prepend: site.baseurl }}">{{page.title}}</a></li>
<div class="summary">{{page.summary}}</div>
{% endif %}
{% endfor %}
{% endfor %}
```
{% endraw %}

Tags will be sorted in alphabetical order.

{{warning}} Avoid using too many `for` loops. Each `for` loop you add increases the build time with Jekyll. This is why so many of the reuse components are inside data files rather than stored as includes in an HTML file.{{end}}

{% endif %}