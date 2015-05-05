---
title: Excluding files and folders
permalink: /excluding_files/
tags: single-sourcing
audience: writer, designer
keywords: 
last_updated: 
summary: 
---
{% include linkrefs.html %} 

By default, all files in your project are included in your output. To exclude files, note them in the `exclude` section in the configuration file. Here's a sample:

```

exclude: 
  - "Gemfile"
  - "Gemfile.lock"
  - drafts
  - _site/documentation-theme-jekyll
  - bower_components
```

If you have different outputs for your site, you'll want to customize the exclude sections in your various configuration files.

For example, suppose you have two have two projects: alpha and beta. You would create a subfolder under pages at pages/alpha, and likewise pages/beta. In your configuration file for the alpha project, you add pages/beta to the exclude directory. In your configuration file for the beta project, you add the pages/alpha project to the exclude directory.

There isn't a way to automatically exclude all folders. By default, everything is included unless you explicitly list it under the exclude section.

## Excluding draft content

If you're working on a draft, put it inside the pages/drafts folder. Specify in your `exclude` section in the configuration file that this folder should be excluded. You can also create a folder called `_drafts` in the root directory. Content inside `_drafts` will automatically be excluded from builds by Jekyll.