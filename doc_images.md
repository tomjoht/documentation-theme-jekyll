---
title: Images
tags: [formatting]
keywords: images, screenshots, vectors, svg, markdown syntax
last_updated: August 12, 2015
summary: "You embed images using traditional HTML or Markdown syntax for images. Unlike pages, you can store images in subfolders (in this theme). This is because when pages reference the images, the references are always as subpaths, never requiring the reference to move up directories."
---
{% include linkrefs.html %} 

You embed an image the same way you embed other files or assets: you put the file into a folder, and then link to that file. 

Put images inside the `images` folder in your root directory. You can create subdirectories inside this directory. Although you could use Markdown syntax for images, the HTML syntax is probably easier:

{% raw %}
```html
<img title="my sample page" src="images/jekyll.png" />
```
{% endraw %}

And the result:

<img title="my sample image" src="images/jekyll.png">

Here's the same Markdown syntax:

```
![My sample page](images/jekyll.png)
```

And the result:

![My sample page](images/jekyll.png)


## SVG Images

You can also embed SVG graphics. If you use SVG, you need to use the HTML syntax so that you can define a width/container for the graphic. Here's a sample embed:

```html
<img src="images/helpapi.svg" style="width: 650px;"/>
```

Here's the result:

<img src="images/helpapi.svg" style="width: 650px;"/>

SVG images will expand to the size of their artboard, so you can either set the artboard the right size when you create the graphic in Illustrator, or you can set an inline style that confines the size to a certain width as shown in the code above.

