---
title: Release notes 8.0
tags: [getting_started]
keywords: release notes, announcements, what's new, new features, bootstrap 5, upgrade
last_updated: November 8, 2026
summary: "Version 8.0 of the Documentation theme for Jekyll redesigns the theme on Bootstrap 5 and Font Awesome 7. The new design is based on idratherbewriting.com, with a light top navigation, a gray sidebar that stays in view and slides out on small screens, breadcrumbs, and colors you can change with CSS variables."
sidebar: mydoc_sidebar
permalink: mydoc_release_notes_80.html
folder: mydoc
---

## New design

The theme has a new look, based on the design of [I'd Rather Be Writing](https://idratherbewriting.com):

* A white top navigation bar with the site title, an optional subtitle, and an optional logo (`topnav_title`, `topnav_subtitle`, and `topnav_logo` in \_config.yml).
* A gray sidebar with the search box at the top. Folders show orange plus and minus icons, and the current page is in bold.
* On large screens, the sidebar stays in view as you scroll. On screens narrower than 992 pixels, it slides out from the left when you tap the sidebar button in the top navigation.
* Breadcrumbs above each page title, built automatically from the page's position in its sidebar. Turn them off with `breadcrumbs: false`.
* The last-updated date and the Edit me link appear together below the page title.
* A "Contents" box for the mini-TOC, rounded tag links, and a simpler footer.

## Bootstrap 5 and Font Awesome 7

The theme now uses Bootstrap 5.3.8 (up from 3.4.1) and Font Awesome 7.3.1 (up from 4.7). Both are still stored in the theme, so the site works offline. jQuery 3.7.1 stays, since the sidebar's navgoco plugin needs it, and the jQuery cookie plugin is gone, since nothing uses it anymore.

## Colors you can change in one place

The theme's colors and sizes are CSS variables at the top of the new css/theme.css file. To change them, redefine the variables in css/customstyles.css, which is now an empty file for your own rules and loads last. See [Themes][mydoc_themes].

## Other changes

* Search uses exact matching instead of fuzzy matching, which returned too many results, and the results appear in a dropdown under the search box.
* Tooltips and popovers use Bootstrap 5's `data-bs-toggle` and `data-bs-title` attributes. The old `data-toggle` and `data-original-title` attributes still work.
* The FAQ layout uses the Bootstrap 5 accordion, and the knowledge-base layout and product landing pages use cards.
* DataTables is updated to version 2.
* The page markup includes a skip link, `aria-current` on the current page in the sidebar and top navigation, and labels on the icon buttons, for better accessibility.

## Upgrading from version 7

Version 8.0 changes most of the files in \_layouts, \_includes, css, and js. If you've customized the theme, the safest approach is to start from a fresh copy of version 8.0 and move your content and settings into it:

1.  Copy your pages, posts, images, and \_data files (sidebars, topnav, tags, glossary) into the new copy.
2.  Copy your \_config.yml settings into the new \_config.yml. The new settings are `topnav_subtitle`, `topnav_logo`, and `breadcrumbs`.
3.  If you changed colors in theme-blue.css or theme-green.css, set the same colors with the variables described in [Themes][mydoc_themes]. Those two files no longer exist.
4.  If you added rules to the old customstyles.css, copy only your own rules into the new customstyles.css, and check them, since many Bootstrap 3 class names no longer exist.
5.  Update any Bootstrap 3 markup in your pages. The most common changes are:

    | Bootstrap 3 | Bootstrap 5 |
    |-------------|-------------|
    | `data-toggle`, `data-target`, `data-dismiss` | `data-bs-toggle`, `data-bs-target`, `data-bs-dismiss` |
    | `label label-default`, `label label-primary`, ... | `badge text-bg-secondary`, `badge text-bg-primary`, ... |
    | `panel panel-default`, `panel-heading`, `panel-body` | `card`, `card-header`, `card-body` |
    | `btn-default` | `btn-light border` or `btn-outline-secondary` |
    | `col-xs-6` | `col-6` |
    | `pull-left`, `pull-right` | `float-start`, `float-end` |
    | `glyphicon glyphicon-*` | A Font Awesome icon, such as `fa-solid fa-download` |

    Nav tabs need the most changes. See [Navtabs][mydoc_navtabs] for the new markup.

Font Awesome 4 class names, such as `fa fa-info-circle`, keep working through Font Awesome's compatibility files, so you don't have to change your icons right away. See [Icons][mydoc_icons].

{% include links.html %}
