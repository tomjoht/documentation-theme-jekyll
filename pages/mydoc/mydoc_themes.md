---
title: Themes
tags: [publishing]
keywords: themes, styles, colors, css, fonts, customize
last_updated: November 8, 2026
summary: "The theme's colors and sizes are set with CSS variables at the top of css/theme.css. To customize them, override the variables in css/customstyles.css, which loads last, so your changes survive theme updates."
sidebar: mydoc_sidebar
permalink: mydoc_themes.html
folder: mydoc
---

{% include note.html content="The [gem-based theme](https://jekyllrb.com/docs/themes/) approach is not yet integrated into this theme, so it doesn't work with `remote_theme` either." %}

## How the stylesheets fit together

The \_includes/head.html file loads these stylesheets in order:

1.  **css/bootstrap.min.css**: Bootstrap 5.
2.  **css/fontawesome-\*.min.css**: Font Awesome 7 icons, plus compatibility files for Font Awesome 4 class names.
3.  **css/syntax.css**: Colors for syntax highlighting in code samples.
4.  **css/theme.css**: The theme's layout and component styles.
5.  **css/customstyles.css**: Your own styles. This file is empty except for comments.

Because customstyles.css loads last, any rule you put there overrides the theme. Keep your changes in customstyles.css rather than editing theme.css. That way, when you update the theme, you can replace theme.css without losing your changes.

## Change the colors

The colors are CSS variables defined at the top of css/theme.css:

```css
:root {
    --theme-accent: #e47911;       /* sidebar icons, hover states, summary border */
    --theme-accent-hover: #c8650a;
    --theme-link: #0066c0;         /* links */
    --theme-link-hover: #004b8d;
    --theme-text: #222;
    --theme-heading: #333;
    --theme-navbar-bg: #ffffff;    /* top navigation background */
    --theme-sidebar-bg: #f7f7f7;   /* sidebar background */
    --theme-box-bg: #f7f7f7;       /* mini-TOC and other boxes */
    --theme-border: #dedede;
    --theme-code-bg: #f6f8fa;
    ...
}
```

To change a color, redefine its variable in css/customstyles.css. For example, this gives the theme a green accent and darker links:

```css
:root {
    --theme-accent: #2e7d32;
    --theme-link: #1b5e9e;
}
```

You only need to list the variables you want to change.

## Change fonts and font sizes

The theme uses Bootstrap's default system font stack, which shows each operating system's standard interface font. The size of the body text on content pages is set by a variable:

```css
:root {
    --theme-content-font-size: 17px;
    --theme-content-line-height: 1.6;
    --theme-sidebar-font-size: 14px;
}
```

To change the font for the whole site, set Bootstrap's font variable in css/customstyles.css:

```css
:root {
    --bs-body-font-family: "Source Sans 3", "Helvetica Neue", Arial, sans-serif;
}
```

If the font is a web font, such as one from [Google Fonts](https://fonts.google.com/), add its `<link>` tag to \_includes/head.html above the other stylesheets. Keep in mind that a web font loaded from another server won't display when someone views the site offline. For offline use, download the font files into a folder such as fonts, and declare them with `@font-face` in customstyles.css.

## Change the logo and title

The top navigation shows the `topnav_title` and `topnav_subtitle` values from \_config.yml next to a book icon. To use your own logo instead of the icon, set `topnav_logo` to the path of an image file, such as `images/logo.svg`. The footer logo is set separately with `company_logo`.

## Upgrading from version 7

Version 7 and earlier used Bootstrap 3 and offered two color files, theme-blue.css and theme-green.css. Those files no longer exist. If you customized them, move your color choices into the variables above. If you added rules to the old customstyles.css, copy them into the new customstyles.css, but check them first, since many of the old rules targeted Bootstrap 3 class names that no longer exist.

{% include links.html %}
