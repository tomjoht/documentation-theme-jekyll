---
title: Themes
tags: [publishing]
keywords: themes, styles, colors, css
last_updated: July 3, 2016
summary: "You can choose between two different themes (one green, the other blue) for your projects. The theme CSS is stored in the CSS folder and configured in the configuration file for each project."
sidebar: mydoc_sidebar
permalink: mydoc_themes.html
folder: mydoc
---

{% include note.html content="The [gem-based theme](https://jekyllrb.com/docs/themes/) approach is not yet integrated into this theme, so it doesn't work with `remote_theme` either." %}

## Theme options
You can choose a green or blue theme, or you can create your own. In the css folder, there are two theme files: theme-blue.css and theme-green.css. These files have the most common CSS elements extracted in their own CSS file. Just change the hex colors to the ones you want.

In the \_includes/head.html file, change the theme stylesheet to the one you want the output to use. See this line:

```html
<link rel="stylesheet" href="{% raw %}{{ root }}{% endraw %}css/theme-blue.css">
```

To switch to the green theme, change `theme-blue.css` to `theme-green.css`.

## Change fonts and font sizes

The theme doesn't use Sass, so there's no \_sass folder to edit. Instead, put your font rules in css/customstyles.css, which loads after Bootstrap and overrides it. The base font size is set at the top of that file:

```css
body {
    font-size: 15px;
}
```

To change the font for the whole site, add a `font-family` to the same rule. Headings inherit Bootstrap's font unless you set them too:

```css
body, h1, h2, h3, h4, h5, h6 {
    font-family: "Source Sans Pro", "Helvetica Neue", Arial, sans-serif;
}
```

If the font is a web font, such as one from [Google Fonts](https://fonts.google.com/), add its `<link>` tag to \_includes/head.html above the other stylesheets. Keep in mind that a web font loaded from another server won't display when someone views the site offline. For offline use, download the font files into the fonts folder and declare them with `@font-face` in customstyles.css.

## Theme differences
The differences between the themes is fairly minimal. The main navigation bar, sidebar, buttons, and heading colors change color. That's about it.

In a more sophisticated theming approach, you could use Sass files to generate rules based on options set in a data file, but I kept things simple here.

{% include links.html %}
