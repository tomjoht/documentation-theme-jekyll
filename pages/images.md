---
title: Images
permalink: /images/
---

Put images inside the `images` folder in your root directory. You can create subdirectories inside this directory.

Markdown image: 

{% raw %}
```
![Sample Wiki Image]({{ "{{site.baseurl}}/images/samplewiki.png" | prepend: site.baseurl }})
```
{% endraw %}

HTML image:

{% raw %}
```
<img src="{{ "/images/samplewiki.png" | prepend: site.baseurl }}">
```
{% endraw %}


## Samples

HTML syntax:

<img  title="my sample image" src="{{ "/images/jekyll-doc/sample.png" | prepend: site.baseurl }}">

Markdown syntax:

![My sample image]({{ "/images/jekyll-doc/sample.png" | prepend: site.baseurl }})
