---
layout: page
title: Icons
permalink: /icons/
tags: getting_started
---

The theme has two font icon sets integrated: Font Awesome and Glyphicons Halflings. The latter is part of Bootstrap, while the former is independent. I downloaded both font icon sets to the theme so that if the site is rendered for offline use, it won't be dependent on a cloud-based font to download.

## See Font Awesome icons available

Go to the [Font Awesome library](http://fortawesome.github.io/Font-Awesome/icons/)

The Font Awesome icons seem smarter because you can adjust their size by simply adding `fa-2x`, `fa-3x` and so forth as a class to the icon to adjust their size to two times or three times the original size. As vector icons, they scale crisply at any size.

Here's an example of how to scale up a camera icon:

```html
<i class="fa fa-camera-retro"></i> normal size (1x)
<i class="fa fa-camera-retro fa-lg"></i> fa-lg
<i class="fa fa-camera-retro fa-2x"></i> fa-2x
<i class="fa fa-camera-retro fa-3x"></i> fa-3x
<i class="fa fa-camera-retro fa-4x"></i> fa-4x
<i class="fa fa-camera-retro fa-5x"></i> fa-5x
```

Here's what they render to:

<i class="fa fa-camera-retro"></i> 1x
<i class="fa fa-camera-retro fa-lg"></i> fa-lg
<i class="fa fa-camera-retro fa-2x"></i> fa-2x
<i class="fa fa-camera-retro fa-3x"></i> fa-3x
<i class="fa fa-camera-retro fa-4x"></i> fa-4x
<i class="fa fa-camera-retro fa-5x"></i> fa-5x

With Font Awesome, you always use the `i` tag with the appropriate class. You also implement `fa` as a base class first. You can use font awesome icons inside other elements. Here I'm using a Font Awesome class inside a Bootstrap alert:

```html
<div class="alert alert-info" role="alert"><i class="fa fa-exclamation-circle fa-lg"></i> This is a special alert message.</div>
```

Here's the result:

<div class="alert alert-info" role="alert"><i class="fa fa-exclamation-circle fa-lg"></i> This is a special alert message.</div>

Here's a similar approach with a check square:

```html
<div class="alert alert-success" role="alert"><i class="fa fa-check-square-o fa-lg"></i> This is a special success message.</div>
```

<div class="alert alert-success" role="alert"><i class="fa fa-check-square-o fa-lg"></i> This is a special success message.</div>


Grab the right class name from the [Font Awesome library](http://fortawesome.github.io/Font-Awesome/icons/) and then implement it by following the example shown for that icon.


## Glyphicon icons available

Go to the [Glyphicons library](http://getbootstrap.com/components/#glyphicons). 

Glyphicons work similarly to Font Awesome. Although the Glyphicon library doesn't provide the scalable classes like Font Awesome, there's a [StackOverflow trick](http://stackoverflow.com/questions/24960201/how-do-i-make-glyphicons-bigger-change-size) I implemented that makes the icons behave in a similar way. I added the following to the stylesheet:

```css
.gi-2x{font-size: 2em;}
.gi-3x{font-size: 3em;}
.gi-4x{font-size: 4em;}
.gi-5x{font-size: 5em;}
```

Now you just add `gi-5x` or whatever to change the size of the font icon:

```html
<span class="glyphicon glyphicon-globe gi-5x"></span>
```

And here's the result:

<span class="glyphicon glyphicon-globe gi-5x"></span>

Glypicons use the `span` element instead of `i` to attach their classes. 

Here's an example:

```html
<span class="glyphicon glyphicon-download"></span>
```

<span class="glyphicon glyphicon-download"></span>

And magnified:

```html
<span class="glyphicon glyphicon-download gi-3x"></span>
```

<span class="glyphicon glyphicon-download gi-3x"></span>

You can also put glyphicons inside other elements:

```html
<div class="alert alert-danger" role="alert">
  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
  <b>Error:</b> Enter a valid email address
</div>
```

<div class="alert alert-danger" role="alert">
  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
  <b>Error:</b> Enter a valid email address
</div>

These type of alerts might be fine for one-liners, but with longer notes, the solid color takes up a bit of space:

```html
<div class="alert alert-info" role="alert"><span class="glyphicon glyphicon-question-sign"></span> This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. </div>
```

<div class="alert alert-info" role="alert"><span class="glyphicon glyphicon-question-sign"></span> This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. </div>

This is most likely why the Bootstrap site uses the alert style instead of this style for their notes.


## Implementing short codes

We can implement short codes for common alerts. 

In the variables.html file, add the following:

{% raw %}
```html
{% capture warning %}
<div class="alert alert-danger" role="alert"><i class="fa fa-exclamation"></i>
{% endcapture %}
```
{% endraw %}

And: 

{% raw %}
```html
{% capture endwarning %}
</div>
{% endcapture %}
```
{% endraw %}

Then include a reference to the variables file on your page:

{% raw %}
```
{% include variables.html %}
```
{% endraw %}

Now use your tags:

{% raw %}
```liquid
{{warning}}Make sure you lock the safe before you close the shop.{{endwarning}}
```
{% endraw %}

Here's the result: 

{% include variables.html %}

{{warning}}Make sure you lock the safe before you close the shop.{{endwarning}}


After coming up with some standard colors and icons, package up all of this code into your variables file and just worry about the liquid tags.

