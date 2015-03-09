---
title: Tags
permalink: /tags/
---

## Tag a page and retrieve pages with specific tags

You can add tags to pages by adding `tags` in the frontmatter, like this:

```
---
title: 2.0 Release Notes
permalink: /release_notes_2_0/
tags: release_notes
---
```

To get 5 pages with a specific tag, you can use this code:

{% raw %}
```
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

{{site.data.callouts.calloutdanger}}<b>Note:</b> Avoid using too many `for` loops. Each `for` loop you add increases the build time with Jekyll. This is why so many of the reuse components are inside data files rather than stored as includes in an HTML file.{{site.data.callouts.end}}
