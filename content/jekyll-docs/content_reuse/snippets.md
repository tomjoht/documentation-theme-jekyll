---
layout: page
title: "Snippets"
permalink: /snippets/
tags: [reuse, layout]

---

To create a snippet, which is a re-used note or chunk of content, open the notes.html file in the _includes directory. Add a new note like this:

{% raw %}
```
{% capture save_warning %}
Please remember to save your work!!!
{% endcapture %}
```
{% endraw %}

On the page where you want to include it, first include the include file like this:

{% raw %}
```
{% include notes.html %}
```
{% endcapture %}


To embed the note, add curly braces around the keyword: 

```
{{ save_warning }}
```
Spaces are optional. 

If there isn't an included reference, the page will just be blank rather than throwing an error.

In the Jekyll-doc theme, I created an include called `{% include variables.html %}` that includes the notes.html, callouts.html, and links.html.

When you include your variables.html file in a topic, it doesn't automatically insert all of this content. Doing so would clutter up search. Instead, you just make the variables available to the page.

One thing I have yet to figure out is how to include a file by default in every page.