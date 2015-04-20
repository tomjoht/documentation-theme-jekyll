---
title: Knowledge-base homepage
permalink: /kb_layout/
tags: special-layouts
---

This shows a sample layout for a knowledge base. Each square could link to a tag archive page. 


<div class="row">
          <div class="col-md-4"><a href="{{ "/tag-getting-started" | prepend: site.baseurl }}"><img src="//placehold.it/300x300" class="img-responsive"></a></div>
          <div class="col-md-4"><a href="{{ "/tag-overview" | prepend: site.baseurl }}"><img src="//placehold.it/300x300" class="img-responsive"></a></div>
          <div class="col-md-4"><a href="{{ "/tag-single-sourcing" | prepend: site.baseurl }}"><img src="//placehold.it/300x300" class="img-responsive"></a></div>
</div>
<p>&nbsp;</p>
<div class="row">
          <div class="col-md-4"><a href="{{ "/tag-publishing" | prepend: site.baseurl }}"><img src="//placehold.it/300x300" class="img-responsive"></a></div>
          <div class="col-md-4"><a href="{{ "/tag-special-layouts" | prepend: site.baseurl }}"><img src="//placehold.it/300x300" class="img-responsive"></a></div>
          <div class="col-md-4"><a href="{{ "/tag-formtting" | prepend: site.baseurl }}"><img src="//placehold.it/300x300" class="img-responsive"></a></div>
</div>
        
## Linking to non-tag archive pages

If you don't want to link to a tag archive index, you could link to a page with code like this:
{% raw %}
```html
Here are all pages tagged with getting_started:

<ul>
{% assign counter = '0' %}
{% for page in site.pages %}
{% for tag in page.tags %}
{% if tag == "getting-started" and counter < '25' %}
{% capture counter %}{{ counter | plus:'1' }}{% endcapture %}
<li><a href="{{ page.permalink | prepend: site.baseurl }}">{{page.title}}</a></li>
{% endif %}
{% endfor %}
{% endfor %} 
</ul>
```
{% endraw %}