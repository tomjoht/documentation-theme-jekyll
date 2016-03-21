---
title: Release notes 5.0
tags: [getting_started]
keywords: release notes, announcements, what's new, new features
last_updated: March 20, 2016
summary: "Version 5.0 of the Documentation theme for Jekyll changes some fundamental ways the theme works to provide product-specific sidebars, intended to accommodate a site where multiple products are grouped together on the same site rather than generated out as separate outputs."
sidebar: mydoc_sidebar
permalink: /mydoc_release_notes_50/
---

## Unique sidebars for each product

In previous versions of the theme, I architected the theme to generate different outputs for different scenarios based on various filtering attributes including product, version, platform, and audience. 

However, this model results in siloed outputs and lots of different file directories to manage. Instead of having 10 separate sites for your content, in this version of the theme I move towards a strategy of having one site with multiple products. 

For each product, you can associate a unique sidebar with each of the product's pages. This allows you to easily browse products and have a unique sidebar appear for each product.

You can still output to both web and PDF.

## Permalinks

Since you'll be publishing to one site, I've implement permalinks instead of using relative links. Using permalinks means the way you store pages is much more flexible. You can use folders and subfolders etc. to any degree. But if you want to view the content offline or on a separate site other than the one specified in the configuration file, you won't be able to do that.

## Updated documentation

I updated the documentation for using the theme. The switch from the multi-site outputs to the single-site with multiple sidebars required updating a lot of different parts of the documentation and code. 