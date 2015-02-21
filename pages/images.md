---
layout: page
title: Images
permalink: /images/
tags: formatting
---
{% include_relative reuse/variables.html %}

For images, create an images folder and put it in your root Jekyll directory. You can create subfolders inside the images directory. 


## Markdown image

Here's how you reference an image in Markdown:

{% comment %}
{% raw %}

```
![Sample Wiki Image]({{ "{{site.baseurl}}/images/web/samplewiki.png" | prepend: site.baseurl }})
```

{% endraw %}
{% endcomment %}



## HTML image

Here's how you reference the image in HTML: 

{% comment %}
{% raw %}
```
{% raw %}
<img src="{{ "/images/web/samplewiki.png" | prepend: site.baseurl }}">
```
{% endraw %}
{% endcomment %}

```
some code
```


