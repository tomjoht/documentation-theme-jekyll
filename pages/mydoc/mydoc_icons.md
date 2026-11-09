---
title: Icons
tags: [formatting]
keywords: font icons, buttons, images, vectors, font awesome, glyphicons
last_updated: July 16, 2016
summary: "You can integrate font icons through the Font Awesome and Glyphical Halflings libraries. These libraries allow you to embed icons through their libraries delivered as a link reference. You don't need any image libraries downloaded in your project."
sidebar: mydoc_sidebar
permalink: mydoc_icons.html
folder: mydoc
---

## Font icon options

The theme includes [Font Awesome 7](https://fontawesome.com/icons) (the free icon set). Bootstrap 5 doesn't include an icon font, so Glyphicons, which came with Bootstrap 3 in earlier versions of the theme, are no longer available. The Font Awesome files are stored in the theme (css/fontawesome-all.min.css and the webfonts folder), so the icons work offline.

## External icons

When you link to an external site, like [Jekyll](https://jekyllrb.com), an icon appears after the link. The rule that adds the icon is in css/theme.css:

```css
/* External link icon */
.post-content a[href^="http://"]::after,
.post-content a[href^="https://"]::after {
    font-family: "Font Awesome 7 Free";
    font-weight: 900;
    content: "\f35d"; /* up-right-from-square */
    font-size: 0.7em;
    padding-left: 4px;
    display: inline-block;
    text-decoration: none;
}
```

To leave the icon off a single link, add the `noCrossRef` or `no_icon` class to it. To remove the icon everywhere, add this rule to css/customstyles.css:

```css
.post-content a[href^="http://"]::after,
.post-content a[href^="https://"]::after {
    content: none;
}
```

## See Font Awesome icons available

Go to the [Font Awesome icon library](https://fontawesome.com/search?ic=free) to see the available icons. Filter the search to free icons, since the theme includes only the free set.

Each icon needs a style class and an icon class. Most free icons use the solid style (`fa-solid`), some also come in the regular style (`fa-regular`), and logos use the brands style (`fa-brands`):

```html
<i class="fa-solid fa-camera"></i>
<i class="fa-regular fa-envelope"></i>
<i class="fa-brands fa-github"></i>
```

<i class="fa-solid fa-camera"></i>
<i class="fa-regular fa-envelope"></i>
<i class="fa-brands fa-github"></i>

You can adjust an icon's size by adding `fa-lg`, `fa-2x`, `fa-3x`, and so forth, up to `fa-10x`. As vector icons, they scale crisply at any size.

Here's an example of how to scale up a camera icon:

```html
<i class="fa-solid fa-camera-retro"></i> normal size (1x)
<i class="fa-solid fa-camera-retro fa-lg"></i> fa-lg
<i class="fa-solid fa-camera-retro fa-2x"></i> fa-2x
<i class="fa-solid fa-camera-retro fa-3x"></i> fa-3x
<i class="fa-solid fa-camera-retro fa-4x"></i> fa-4x
<i class="fa-solid fa-camera-retro fa-5x"></i> fa-5x
```

Here's what they render to:

<i class="fa-solid fa-camera-retro"></i> 1x
<i class="fa-solid fa-camera-retro fa-lg"></i> fa-lg
<i class="fa-solid fa-camera-retro fa-2x"></i> fa-2x
<i class="fa-solid fa-camera-retro fa-3x"></i> fa-3x
<i class="fa-solid fa-camera-retro fa-4x"></i> fa-4x
<i class="fa-solid fa-camera-retro fa-5x"></i> fa-5x

If an icon is decorative, add `aria-hidden="true"` so that screen readers skip it. If the icon carries meaning on its own (for example, an icon-only button), give the surrounding element an `aria-label` instead.

## Icons from earlier versions of the theme

Earlier versions of the theme used Font Awesome 4, with classes such as `fa fa-info-circle`. The theme also loads Font Awesome's v4 compatibility files, so those older class names still display the right icons, and so do custom CSS rules that use `font-family: FontAwesome`. You don't have to update your content right away. However, use the new class names for new content, since a few v4 icons were renamed or removed. See [Upgrading from version 4](https://docs.fontawesome.com/web/setup/upgrade/upgrade-from-v4) in the Font Awesome documentation for the full list of changes.

Glyphicons (`<span class="glyphicon glyphicon-...">`) don't have a compatibility layer. Replace each one with a similar Font Awesome icon. For example, `glyphicon glyphicon-download-alt` becomes `fa-solid fa-download`.

## Icons inside alerts

You can use Font Awesome icons inside other elements. Here I'm using a Font Awesome icon inside a Bootstrap alert:

```html
<div class="alert alert-danger" role="alert"><i class="fa-solid fa-circle-exclamation" aria-hidden="true"></i> <b>Warning: </b>This is a special warning message.</div>
```

Here's the result:

<div class="alert alert-danger" role="alert"><i class="fa-solid fa-circle-exclamation" aria-hidden="true"></i> <b>Warning: </b>This is a special warning message.</div>

The notes, tips, warnings, etc., are pre-coded with Font Awesome and stored in the alerts.yml file. That file includes the following:

{% raw %}
```yaml
tip: '<div class="alert alert-success" role="alert"><i class="fa-solid fa-square-check" aria-hidden="true"></i> <b>Tip: </b>'
note: '<div class="alert alert-info" role="alert"><i class="fa-solid fa-circle-info" aria-hidden="true"></i> <b>Note: </b>'
important: '<div class="alert alert-warning" role="alert"><i class="fa-solid fa-triangle-exclamation" aria-hidden="true"></i> <b>Important: </b>'
warning: '<div class="alert alert-danger" role="alert"><i class="fa-solid fa-circle-exclamation" aria-hidden="true"></i> <b>Warning: </b>'
end: '</div>'

callout_danger: '<div class="bs-callout bs-callout-danger">'
callout_default: '<div class="bs-callout bs-callout-default">'
callout_primary: '<div class="bs-callout bs-callout-primary">'
callout_success: '<div class="bs-callout bs-callout-success">'
callout_info: '<div class="bs-callout bs-callout-info">'
callout_warning: '<div class="bs-callout bs-callout-warning">'

hr_faded: '<hr class="faded"/>'
hr_shaded: '<hr class="shaded"/>'
```
{% endraw %}

However, the recommended way to insert a tip, note, warning, or important alert is with these includes:

```liquid
{% raw %}{% include note.html content="Add your note here." %}{% endraw %}
```

```liquid
{% raw %}{% include tip.html content="Add your tip here." %}{% endraw %}
```

```liquid
{% raw %}{% include important.html content="Add your important info here." %}{% endraw %}
```

```liquid
{% raw %}{% include warning.html content="Add your warning here." %}{% endraw %}
```

Here's the result:

{% include note.html content="Add your note here." %}

{% include tip.html content="Here's my tip." %}

{% include important.html content="This information is very important." %}

{% include warning.html content="If you overlook this, you may die." %}

The color scheme is the default colors from Bootstrap. You can modify the icons or colors as needed. See [Alerts][mydoc_alerts] for more details.

## Creating your own combinations

You can innovate with your own combinations. Here's a similar approach with a file download icon:

```html
<div class="alert alert-success" role="alert"><i class="fa-solid fa-download fa-lg" aria-hidden="true"></i> This is a special tip about some file to download....</div>
```

And the result:

<div class="alert alert-success" role="alert"><i class="fa-solid fa-download fa-lg" aria-hidden="true"></i> This is a special tip about some file to download....</div>

Grab the right class name from the [Font Awesome icon library](https://fontawesome.com/search?ic=free) and then implement it by following the pattern shown previously.

{% include links.html %}
