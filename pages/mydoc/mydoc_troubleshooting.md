---
title: Troubleshooting
tags: [troubleshooting]
keywords: trouble, problems, support, error messages, problems, failure, error, #fail
last_updated: July 3, 2016
summary: "This page lists common errors and the steps needed to troubleshoot them."
sidebar: mydoc_sidebar
permalink: mydoc_troubleshooting.html
folder: mydoc
---

## Issues building the site

### Address already in use

When you try to build the site, you get this error:

```
jekyll 2.5.3 | Error:  Address already in use - bind(2)
```
This happens if a server is already in use. To fix this, edit your config file and change the port to a unique number.

If the previous server wasn't shut down properly, you can kill the server process using these commands:

`ps aux | grep jekyll`

Find the PID (for example, it  looks like "22298").

Then type `kill -9 22298` where "22298" is the PID.

Alternatively, type the following to stop all Jekyll servers:

```
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
```

### cannot load such file -- webrick

If you see `cannot load such file -- webrick (LoadError)` when you run `jekyll serve`, you're using Ruby 3.0 or later with a Gemfile that doesn't include the webrick gem. The theme's Gemfile includes it. If you replaced the Gemfile, add `gem "webrick"` to it and run `bundle install`. Also make sure you run Jekyll with `bundle exec jekyll serve`.

### Invalid US-ASCII character

If the build fails with `Invalid US-ASCII character`, Ruby isn't reading files as UTF-8. This usually happens in Docker containers or CI systems where no locale is set. Set the `LANG` and `LC_ALL` environment variables to `C.UTF-8` (the theme's Dockerfile does this). If the file in the error is assets/css/style.scss, make sure \_config.yml includes `theme: null`, which stops GitHub Pages from adding its default theme's stylesheet.

### GitHub Metadata warning

The message `GitHub Metadata: No GitHub API authentication could be found` is a warning, not an error. The theme doesn't use GitHub metadata, so you can ignore it. To get rid of it, see [Install Jekyll on Mac](mydoc_install_jekyll_on_mac.html#githuberror).

### shell file not executable

If you run into permissions errors trying to run a shell script file (such as pdf-mydoc.sh), you may need to change the file permissions to make the sh file executable. Browse to the directory containing the shell script and run the following:

```
chmod +x pdf-mydoc.sh
```

### shell file not runnable

The Windows command prompt can't run .sh files. Run them in [Git Bash](https://gitforwindows.org/) or the Windows Subsystem for Linux instead.

### "page 0" cross references in the PDF

If you see "page 0" cross-references in the PDF, the URL doesn't exist. Check to make sure you actually included this page in the build.

If it's not a page but rather a file, you need to add a `noCrossRef` class to the file so that your print stylesheet excludes the counter from it. Add `class="noCrossRef"` as an attribute to the link. In the css/printstyles.css file, there is a style that should remove the counter from anchor elements with this class.

### The PDF is blank

Check the \_site/pdfconfigs/prince-list.txt file in the output to see if it contains links. If not, check that the `pdf_sidebar` value in your PDF configuration file names the right sidebar, and that the items in that sidebar include `pdf` in their `output` property.

### Sidebar not appearing

If you build your site but the sidebar doesn't appear, check the following:

Look in your PDF config file and make sure you have a sidebar property, such as this:

```
pdf_sidebar: product2_sidebar
```

Make sure each TOC item has an output property that specifies web or pdf.

Make sure the page's `sidebar` value matches the name of a file in \_data/sidebars (without the .yml extension). If the value doesn't match any file, or if the page sets `hide_sidebar: true`, the theme hides the sidebar on purpose.

Understanding how the theme works can be helpful in troubleshooting. The \_includes/sidebar.html file loops through the items in the page's sidebar file in \_data/sidebars. Each item's `output` property must include `web` for the item to appear in the web sidebar (or `pdf` for it to appear in the PDF). Items without the right output get skipped.

### Sidebar isn't collapsed

If the sidebar levels aren't collapsed, usually your JavaScript is broken somewhere. Open the JavaScript Console and look to see where the problem is. If one script breaks, then other scripts will break too, so troubleshooting it is a little tricky.

### Search isn't working

If the search isn't working, check the JSON validity in the search.json file in your output folder. Usually something is invalid. Identify the problematic line, fix the file, or put `search: exclude` in the frontmatter of the file to exclude it from search.

{% include links.html %}
