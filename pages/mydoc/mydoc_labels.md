---
title: Labels
tags: [formatting]
keywords: labels, buttons, bootstrap, api methods
last_updated: July 3, 2016
summary: "Labels are just a simple Bootstrap component that you can include in your pages as needed. They represent one of many Bootstrap options you can include in your theme."
sidebar: mydoc_sidebar
permalink: mydoc_labels.html
folder: mydoc
---

## About labels
Labels might come in handy for adding button-like tags next to elements, such as POST, DELETE, UPDATE methods for endpoints. Bootstrap 5 calls these badges. You can use any classes from Bootstrap in your content.

```html
<span class="badge text-bg-secondary">Default</span>
<span class="badge text-bg-primary">Primary</span>
<span class="badge text-bg-success">Success</span>
<span class="badge text-bg-info">Info</span>
<span class="badge text-bg-warning">Warning</span>
<span class="badge text-bg-danger">Danger</span>
```

<span class="badge text-bg-secondary">Default</span>
<span class="badge text-bg-primary">Primary</span>
<span class="badge text-bg-success">Success</span>
<span class="badge text-bg-info">Info</span>
<span class="badge text-bg-warning">Warning</span>
<span class="badge text-bg-danger">Danger</span>

Add the `rounded-pill` class for rounded badges:

```html
<span class="badge rounded-pill text-bg-success">GET</span>
<span class="badge rounded-pill text-bg-primary">POST</span>
<span class="badge rounded-pill text-bg-danger">DELETE</span>
```

<span class="badge rounded-pill text-bg-success">GET</span>
<span class="badge rounded-pill text-bg-primary">POST</span>
<span class="badge rounded-pill text-bg-danger">DELETE</span>

You can have a label appear within a heading simply by including the span tag in the heading. However, you can't mix Markdown syntax with HTML, so you'd have to hard-code the heading ID for the auto-TOC to work.

{% include note.html content="In earlier versions of the theme, which used Bootstrap 3, labels used classes such as `label label-default`. Those classes don't exist in Bootstrap 5, so change them to `badge text-bg-secondary` and so on." %}

For more options, see [Badges](https://getbootstrap.com/docs/5.3/components/badge/) in the Bootstrap documentation.

{% include links.html %}
