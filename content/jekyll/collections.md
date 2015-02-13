---
title: Test page 123
permalink: /test123/
layout: page
tags: gettingStarted
category: monsters
---

this is a test123 page. 

## Page Collection

{{site.bikes}}

## for loop

     {% assign counter = '0' %}
{% for page in site.bikes %}
{% for tag in page.tags %}
{% if tag == "hybrid" and counter < '2' %}
{% capture counter %}{{ counter | plus:'1' }}{% endcapture %}
<li><a href="{{ page.permalink | prepend: site.baseurl }}">{{page.title}}</a></li>
  {% endif %}
                {% endfor %}
                {% endfor %} 

## another way
<ul>
                {% for page in site.bikes limit:2 %}
      <li><a href="{{ page.permalink | prepend: site.baseurl }}">{{page.title}}</a></li>

{% endfor %}
</ul>