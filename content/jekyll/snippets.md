---
layout: page
title: "Snippets"
permalink: /snippets/
tags: [reuse, layout]

---


I'm still adding content to this page....

Essentially, once you set up a snippet in your variables file, it's as easy as adding the following to include them on your page:

{% raw %}
<pre>
{% include variables.html %}
dsc: {{dsc}}
sec: {{ sec }}
</pre>
{% endraw %}

{% include variables.html %}

## More examples


version: {{ version }}





You must use version {{ version }} of the software.