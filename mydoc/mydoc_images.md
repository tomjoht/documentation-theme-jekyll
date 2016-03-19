---
title: Images
tags: [formatting]
keywords: images, screenshots, vectors, svg, markdown syntax
last_updated: March 20, 2016
summary: "You embed images using traditional HTML or Markdown syntax for images. Unlike pages, you can store images in subfolders (in this theme). This is because when pages reference the images, the references are always as subpaths, never requiring the reference to move up directories."
sidebar: mydoc_sidebar
permalink: /mydoc_images/
---

You embed an image the same way you embed other files or assets: you put the file into a folder, and then link to that file. 

Put images inside the `images` folder in your root directory. You can create subdirectories inside this directory. Although you could use Markdown syntax for images, the HTML syntax is probably easier:

{% raw %}
```html
<img title="my sample page" src="{{ "/images/jekyll.png" | prepend: site.baseurl }}" />
```
{% endraw %}

And the result:

<img title="my sample image" src="{{ "/images/jekyll.png" | prepend: site.baseurl }}">

Here's the same Markdown syntax:

{% raw %}
```
![My sample page]({{ "/images/jekyll.png" | prepend: site.baseurl }})
```
{% endraw %}

And the result:

![My sample page]({{ "/images/jekyll.png" | prepend: site.baseurl }})

{{site.data.alerts.tip}} I recommend storing this format into a shortcut editor such as aText. This way when you want to insert an image, just type something like jimg and the shortcut editor will automatically type the code.{{site.data.alerts.end}}

## Figure captions

If you want to add a figure caption, you can do so using standard `figure` HTML tags:

{% raw %}
```html
<figure><img title="my sample page" src="{{ "/images/jekyll.png" | prepend: site.baseurl }}" /><figcaption>Your caption</figcaption></figure>
```
{% endraw %}

Here's the result:

<img title="my sample page" src="{{ "/images/jekyll.png" | prepend: site.baseurl }}" />
<figcaption>Your caption</figcaption></figure>

## SVG Images

You can also embed SVG graphics. If you use SVG, you need to use the HTML syntax so that you can define a width/container for the graphic. Here's a sample embed:

```html
<img src="{{ "/images/helpapi.svg" | prepend: site.baseurl }}" style="max-width: 600px;" />
```

Here's the result:

<img src="{{ "/images/helpapi.svg" | prepend: site.baseurl }}" style="max-width: 600px;" />

SVG images will expand to the size of their container, so you have to specify it here. The previous syntax isn't well supported in IE, so you would be better off using the `object` element like this:

{% raw %}
```html
<div style="max-width:600px;"><object type="image/svg+xml" data="{{ "/images/helpapi.svg" | prepend: site.baseurl }}">Your browser does not support SVG</object>
</div>
```
{% endraw %}

Here's the same code with `figure` elements:

{% raw %}
```html
<div style="max-width:600px;"><figure><object type="image/svg+xml" data="{{ "/images/helpapi.svg" | prepend: site.baseurl }}">Your browser does not support SVG</object><figcaption>This is your caption</figcaption></figure>
</div>
```
{% endraw %}

And the result: 

<div style="max-width:400px;"><figure><object type="image/svg+xml" data="{{ "/images/helpapi.svg" | prepend: site.baseurl }}">Your browser does not support SVG</object><figcaption>This is your caption</figcaption></figure></div>

Also, if you're working with SVG graphics, note that Firefox does not support SVG fonts. In Illustrator, when you do a Save As with your AI file and choose SVG, to preserve your fonts, in the Font section, select "Convert to outline" as the Type (don't choose SVG in the Font section).

Also, remove the check box for "Use textpath element for text on a path". And select "Embed" rather than "Link." The following screenshot shows the settings I use. Your graphics will look great in Firefox.

![Essential options for SVG with Illustrator]({{ "/images/illustratoroptions.png" | prepend: site.baseurl }})



