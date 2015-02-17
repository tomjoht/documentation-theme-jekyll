---
title: Writing content
permalink: /writing_content/
---
{% include variables.html %}
There are 2 page types in Jekyll: posts and pages. Posts are intended for blog-like entries where dates matter. Pages are intended as standalone entities. 

If you want to create your own content type, you create a "collection." Collections are a way to extend Jekyll to support additional content types beyond posts and pages. For example, if you wanted to create an API doc content type, with its own special formatting and layout, you might create a collection just for this type of content.

This theme is designed primarily to support authoring in pages, but it also supports posts. For example, you might push Marketing content or knowledge-base articles through posts. Or you could use pages for everything. I haven't added any collections yet, but I may do so to support an API post type in the future.

## Frontmatter

Every page has a section at the top called "frontmatter." In the frontmatter, you add things like title, permalink, and more. The frontmatter for this page includes the following:

```
---
title: Writing content
permalink: /writing_content/
---
```

Every page must have frontmatter, even if there isn't anything between the lines.

## Defaults

The configuration file can specify frontmatter defaults for the page type. For example, rather than always typing `layout: page`, you can set this default in the page type in your configuration file, and then `layout: page` will be injected into every frontmatter for that page type.

## Restrictions

You can't use Liquid in frontmatter. For example, you can't set up a data property and then access it in your frontmatter. 

## Where to store pages

In this theme, you store pages in a folder called "content." You can make as many subfolders as you want inside content, and you don't have to worry about the right path to the page. When you link to a page, you merely link to the page's permalink. When Jekyll looks for the page, it will look for the permalink to the page rather than the path file path to the page.

## Subfolders inside content

You should add a distinct folder for each project inside your content folder. For example, if you have two projects you're writing help content for, "Jekyll-Doc" and "Basic Project," then create a couple of folders with these project names (lower-cased) inside the content folder. 

When you build your site, all the pages in your Jekyll files will be included. To exclude certain files, you list them in the `exclude` property in your configuration file. 

For example, for your Basic Project configuration file, you would exclude the directory `content/jekyll-doc`. And vice versa for the Jekyll-Doc project. This ensures that the Basic Project site will only contain Basic File content, and that Jekyll-Doc will only contain Jekyll-Doc content.

Keep all your pages for each project inside their respective directories so you can easily exclude them from builds. If you have files common to multiple projects, you could add a folder named "common" and store them there.

Note that unlike DITA, which requires you to list all the included files in your DITA map if you want them included, Jekyll includes everything by default and requires you to specify what you want excluded. 

(If there are files you want left out of the github repository, you can use the .gitignore file to ignore them.)

## Conditional filtering of pages

To apply conditional filters on a page, use if-else logic. For example, suppose you have a page common to two projects. You could store the page in a "common" folder and then add logic to filter out parts of the page based on properties in your configuration file. See {{conditional_logic}} for more details.