---
layout: page
title: Adding a blog section
permalink: /add_blog/
tags: layout
--- 

To add blog entries, you add files to your _posts directory. The titles must be in yyyy-mm-dd-postname.md format. This is because Jekyll sorts them by date based on the file name. 

Here's the code for adding a blog. Basically you get the latest posts. 


{% comment %}

```liquid
{% for post in site.posts %}
{{ post.date | date: "%b %-d, %Y" }}
{{ post.title }}
{% endfor %}
```

{% endcomment %}


Here's the same content with some styling around it:

{% comment %}

```html
<h1 class="page-heading">Posts</h1>
<ul class="post-list">
    {% for post in site.posts %}
      <li>
        <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>
        <h2>
          <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
        </h2>
      </li>
  </ul>
  {% endfor %}

<p class="rss-subscribe">subscribe <a href="{{ "/feed.xml" | prepend: site.baseurl }}">via RSS</a></p>
```

{% endcomment %}



## Result

Here's the result:

<h1 class="page-heading">Posts</h1>
<ul class="post-list">
    {% for post in site.posts %}
      <li><a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }} ({{ post.date | date: "%b %-d, %Y" }})</a></li>
    {% endfor %}
</ul>

<p class="rss-subscribe">subscribe <a href="{{ "/feed.xml" | prepend: site.baseurl }}">via RSS</a></p>

## Adding limits

You can also add a limit to the `for` loop. You must also specify the tags namespace that you're running the loop in:

{% comment %}

```liquid
{% for post in site.tags.news limit:2  %}
    //do something
  {% endfor %}
```
{% endcomment %}

If you were to just write `site.posts`, then it would limit the iterations to just 2 for overall posts.

