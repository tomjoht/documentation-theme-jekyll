---
title: News
permalink: /news/
---

{% assign counter = '0' %}
{% for post in site.posts %}
{% for tag in post.tags %}
{% if tag == "news" %}
<li><a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a> ({{ post.date | date: "%b %-d, %Y" }})</li>
<div class="summary">{{post.summary}}</div>
{% endif %}
{% endfor %}
{% endfor %}