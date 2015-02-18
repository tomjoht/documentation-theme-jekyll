---
title: Building a Jekyll theme
permalink: /building_jekyll_themes/
---

If you want to build a Jekyll theme to match your company site, basically take the HTML from your company site, clean it up so there is no content on the page, change that content to a placeholder tag called {{content}}, and then save it in your _layouts folder as default.html. 

In your configuration file, define that page post types use this layout by default:

```
defaults:
  -
    scope:
      path: ""
      type: "pages"
    values:
      layout: "print"
      comments: true
```