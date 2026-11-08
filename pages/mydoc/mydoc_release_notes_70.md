---
title: Release notes 7.0
tags: [getting_started]
keywords: release notes, announcements, what's new, new features
last_updated: November 8, 2026
summary: "Version 7.0 of the Documentation theme for Jekyll, released November 8, 2026, brings the theme up to date with current versions of Ruby, Jekyll, and GitHub Pages. It also fixes links on pages in subfolders, stores all CSS and JavaScript libraries locally, and fixes a number of long-standing issues."
sidebar: mydoc_sidebar
permalink: mydoc_release_notes_70.html
folder: mydoc
---

## Updated for current Ruby and GitHub Pages

The Gemfile now uses the latest github-pages gem and adds the gems that Ruby 3.0 and later no longer include by default, such as webrick. Builds no longer fail with `cannot load such file -- webrick`. The Gemfile also explains how to switch to the latest Jekyll if you don't publish on GitHub Pages.

The \_config.yml file sets `theme: null` so that GitHub Pages no longer adds the unused Primer theme stylesheet, which caused `Invalid US-ASCII character` errors in some environments.

## Pages in subfolders

Links and asset paths are still relative, so you can view the site offline or on any server. However, they now work from pages at any depth, such as `/product1/install/overview.html`. Previously, the theme removed every slash from sidebar URLs and loaded stylesheets with paths that only worked from the root folder. The 404 page uses absolute paths based on `baseurl`, so it displays correctly at any URL. See [Links][mydoc_hyperlinks] for details.

## Libraries stored locally

Bootstrap (updated to 3.4.1), jQuery (updated to 3.7.1), Font Awesome, AnchorJS, and the jQuery cookie plugin are now in the css and js folders instead of loading from CDNs. The site works without an internet connection, and the updated versions fix known security issues in the older ones.

## Comments and analytics

Commento.io has shut down, so the theme now supports [giscus](https://giscus.app) comments, which store comments in GitHub Discussions. Comments are off until you add your giscus settings to \_config.yml. See [Comments](index.html#comments).

The Google Analytics include now uses Google Analytics 4. Universal Analytics IDs (`UA-`) stopped collecting data in July 2023, so replace yours with a measurement ID that starts with `G-`.

## Sidebar improvements

* A top-level sidebar item can link straight to a page. Give the folder a `url` and leave out `folderitems`.
* Setting `sidebar: none` hides the sidebar, the same as `hide_sidebar: true`. When the sidebar is hidden, the **Nav** toggle is hidden too, and the content uses the full width.
* If a sidebar file doesn't set `version`, the sidebar shows `project_version` from \_config.yml.
* **Expand All** now opens every folder instead of only the last one. Turn on the links with `sidebar_expand_controls: true`.

## Other fixes

* Tapping a search result on a phone now opens the page.
* Tapping a tooltip link on a phone no longer jumps to the top of the page.
* Task lists (`- [ ]` and `- [x]`) display as checkboxes without bullets.
* A `width` attribute on an image is respected. The image.html and inline_image.html includes both accept `max-width`.
* PDF download buttons with the `pdf-download` class are hidden in printed pages and in the PDF.
* The footer logo is set with `company_logo` in \_config.yml.
* The series includes only sort pages that belong to the series, which avoids `comparison of Array with Array failed` errors.
* A new [Install Jekyll on Linux][mydoc_install_jekyll_on_linux] page joins the Mac and Windows instructions.
* The Docker setup uses the official Ruby image, since the jekyll/jekyll images are no longer maintained. Run `docker compose up` to preview the site.
* A GitHub Actions workflow builds the site for every pull request.

{% include links.html %}
