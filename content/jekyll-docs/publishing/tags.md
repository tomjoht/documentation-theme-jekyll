---
title: Tags
permalink: /tags/
tags: layout
---

You can add tags to your front matter, and then query and pull the posts by those tags. 

Here's an example of using tags in front matter: 

```
---
layout: page
title: 2.0 Release Notes
permalink: /release_notes_2_0/
tags: release_notes
---
```

Note that you put the tags on separate lines, using the hyphen. This convention follows YAML formatting. 

Now let's say you want to get all pages that have these tags. You could use a `for` loop to look through all of the posts and get pages that have a specific tag:


{% raw %}
```liquid
{% for page in site.pages limit: 5 %}
{% for tag in page.tags %}
{% if tag == "squirrels" %}
<li><a href="{{ page.permalink | prepend: site.baseurl }}">{{page.title}}</a></li>
<div class="summary">{{page.summary}}</div>
{% endif %}
{% endfor %}
{% endfor %}
```
{% endraw %}

Notice that I added a `limit` parameter. This restricts the number of results (I'm not sure what the order of retrieval is for pages. I assume for posts it's the latest posts, but for pages it's probably alphabetical.)


You could also run the same logic with posts, using the post namespace instead of the page namespace:


{% raw %}
```liquid
<ul>
{% for post in site.posts limit: 3 %}
{% for tag in post.tags %}
{% if tag == "news" %}
<li><a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a> ({{ post.date | date: "%b %-d, %Y" }})</li>
<div class="summary">{{post.summary}}</div>
{% endif %}
{% endfor %}
{% endfor %}
</ul>
```

This example includes a data for each post.

Note that you can add multiple tags per page. When you do this, separate each item with a hyphen, like this:

```
---
layout: page
title: 2.0 Release Notes
permalink: /release_notes_2_0/
tags: 
- release_notes
- news
---
```

You can also use an `or` operator to look through posts and get multiple categories:

```liquid
{% raw %}
<pre>
{% for page in site.pages limit: 5 %}
{% for tag in page.tags %}
{% if tag == "release_notes" or tag == "news" %}
<li><a href="{{ page.permalink | prepend: site.baseurl }}">{{page.title}}</a></li>
<div class="summary">{{page.summary}}</div>
{% endif %}
{% endfor %}
{% endfor %}
```
{% endraw %}

However, I don't quite have the logic here correct. Currently if a page has both tags, it will appear twice in the list, because presumably the statement iterates through the page content and finds a match for each tag condition. 