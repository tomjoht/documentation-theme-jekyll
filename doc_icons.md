---
title: Icons
tags: [formatting]
keywords: font icons, buttons, images, vectors, font awesome, glyphicons
last_updated: August 12, 2015
summary: "You can integrate font icons through the Font Awesome and Glyphical Halflings libraries. These libraries allow you to embed icons through their libraries delivered as a link reference. You don't need any image libraries downloaded in your project."
---
{% include linkrefs.html %} 

## Font icon options
The theme has two font icon sets integrated: Font Awesome and Glyphicons Halflings. The latter is part of Bootstrap, while the former is independent. Font icons allow you to insert icons drawn as vectors from a CDN (so you don't have any local images on your own site).

## See Font Awesome icons available

Go to the [Font Awesome library](http://fortawesome.github.io/Font-Awesome/icons/) to see the available icons.

The Font Awesome icons allow you to adjust their size by simply adding `fa-2x`, `fa-3x` and so forth as a class to the icon to adjust their size to two times or three times the original size. As vector icons, they scale crisply at any size.

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
<div class="alert alert-danger" role="alert"><i class="fa fa-exclamation-circle"></i> <b>Warning: </b>This is a special warning message.
```

Here's the result:

<div class="alert alert-danger" role="alert"><i class="fa fa-exclamation-circle fa-lg"></i> This is a special warning message.</div>

The notes, tips, warnings, etc., are pre-coded with Font Awesome and stored in the linkrefs.html file in `capture` tags. That file includes the following:

{% raw %}
```html
{% capture tip %}<div class="alert alert-success" role="alert"><i class="fa fa-check-square-o"></i> <b>Tip: </b>{% endcapture %}
{% capture note %}<div class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note: </b>{% endcapture %}
{% capture important %}<div class="alert alert-warning" role="alert"><i class="fa fa-warning"></i> <b>Important: </b>{% endcapture %}
{% capture warning %}<div class="alert alert-danger" role="alert"><i class="fa fa-exclamation-circle"></i> <b>Warning: </b>{% endcapture %}
{% capture end %}</div>{% endcapture %}
```
{% endraw %}

This means you can insert a tip, note, warning, or important alert simply by using these tags:

{% raw %}
```
{{note}} Add your note here. {{end}}
```
{% endraw %}

Here's the result:

{{note}} Add your note here. {{end}}

{{tip}} Here's my tip. {{end}}

{{important}} This information is very important.{{end}}

{{warning}} If you overlook this, you may die. {{end}}

The color scheme is the default colors from Bootstrap. You can modify the icons or colors as needed.

## Creating your own combinations

You can innovate with your own combinations. Here's a similar approach with a file download icon:

```html
<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> This is a special tip about some file to download....</div>
```

And the result:

<div class="alert alert-success" role="alert"><i class="fa fa-download fa-lg"></i> This is a special tip about some file to download....</div>


Grab the right class name from the [Font Awesome library](http://fortawesome.github.io/Font-Awesome/icons/) and then implement it by following the pattern shown previously.

If you want to make your fonts even larger than the 5x style, add a custom style to your stylesheet like this:

```css
.fa-10x{font-size:1700%;}
```

Then any element with the attribute `fa-10x` will be enlarged 1700%.

## Glyphicon icons available

Glyphicons work similarly to Font Awesome. Go to the [Glyphicons library](http://getbootstrap.com/components/#glyphicons) to see the icons available. 

Although the Glyphicon Halflings library doesn't provide the scalable classes like Font Awesome, there's a [StackOverflow trick](http://stackoverflow.com/questions/24960201/how-do-i-make-glyphicons-bigger-change-size)  to make the icons behave in a similar way. This theme's stylesheet (customstyles.css) includes the following to the stylesheet:

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

Here's another example:

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

## Callouts

The previously shown alerts might be fine for short messages, but with longer notes, the solid color takes up a bit of space. In this theme, you also have the option of using callouts, which are pretty common in Bootstrap's documentation but surprisingly not offered as an explicit element. Their styles have been copied into this theme, in a way similar to the alerts:

```html
<div class="bs-callout bs-callout-info">
 This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. </div>
```

<div class="alert alert-info" role="alert"><span class="glyphicon glyphicon-question-sign"></span> This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. This is a special info message. </div>

And here's the shortcode:

{% raw %}
```
{{callout_info}}<div class="bs-callout bs-callout-info">{{end}}
{% endraw %}
```

You can use any of the following:
{% raw %}
```
{{callout_danger}} 
{{callout_default}} 
{{callout_primary}} 
{{callout_success}} 
{{callout_info}} 
{{callout_warning}} 
```
{% endraw %}

Callouts are explained in a bit more detail here: {{doc_alerts}}.

