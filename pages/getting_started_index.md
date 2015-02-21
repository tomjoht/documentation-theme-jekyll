---
title: Getting Started index
permalink: /getting_started_index/
---

Here are all pages tagged with getting_started:

<ul>
{% assign counter = '0' %}
{% for page in site.pages %}
{% for tag in page.tags %}
{% if tag == "getting_started" and counter < '25' %}
{% capture counter %}{{ counter | plus:'1' }}{% endcapture %}
<li><a href="{{ page.permalink | prepend: site.baseurl }}">{{page.title}}</a></li>
{% endif %}
{% endfor %}
{% endfor %} 
</ul>
