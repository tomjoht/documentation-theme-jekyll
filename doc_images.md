---
title: Images
audience: writer, designer
tags: formatting
keywords: 
last_updated: 
summary: 
---
{% include linkrefs.html %} 

You embed an image the same way you embed other files or assets: you put the file into a folder, and then link to that file. 

## Images
Put images inside the `images` folder in your root directory. You can create subdirectories inside this directory. Although you could use Markdown syntax for images, the HTML syntax is probably easier:

{% raw %}
```html
<img title="my sample page" src="images/jekyll.png" />
```
{% endraw %}

Here's a sample:

<img title="my sample image" src="images/jekyll.png">

## SVG Images

You can also embed SVG graphics. Here's a sample embed:

```html
<img src="images/helpapi.svg" style="width: 650px;"/>
```

Here's the result:

<img src="images/helpapi.svg" style="width: 650px;"/>

SVG images will expand to the size of their artboard, so you can either set the artboard the right size when you create the graphic in Illustrator, or you can set an inline style that confines the size to a certain width as shown in the code above.

