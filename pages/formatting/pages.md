---
title: Pages
permalink: /pages/
audience: writer, designer
tags: [getting-started, formatting]
---

Use a text editor such as Sublime Text, WebStorm, or Emacs to create pages. Make sure each page has frontmatter at the top like this:

```
---
title: Getting started
permalink: /getting_started/
tags: newbies
---
```

Frontmatter is always formatted with three hyphens at the top and bottom. Your frontmatter must have a `title` and `permalink` value. The `tags` property is optional but potentially useful for knowledge-base articles. Make all tags single words, with hyphens if needed. Separate them with commas.

Pages can be either Markdown or HTML format. If you use Markdown, you can also include HTML formatting where needed. But not vice versa -- if you use HTML (as your file extension), you can't insert Markdown content. 

Also, if you use HTML inside a Markdown file, you cannot use Markdown inside of HTML. But you can use HTML inside of Markdown.

For your Markdown files, note that a space or two indent will set text off as code or blocks, so avoid spacing indents unless intentional.

## Where to save pages

Store all your pages inside the pages folder. The number of subfolders inside your pages directory doesn't matter. You won't have to use paths (such as ../) when linking to pages. Instead, all the pages will be pulled out to the root directory, and links are established through the permalink value in the page's frontmatter.

If you want to use a colon in your page title, you must enclose the title's value in quotation marks.

## Pages versus posts

Most of the theme is designed for using pages, but you can also use posts. Posts are intended for blog entries. They have dates in the filenames, and they sort chronologically when get the posts. Create posts inside the _posts folder.

The latest_posts.html file shows the latest posts. The tagindex.html file sorts posts by tags. The archive.html sorts posts by date.

{{note}} I haven't done much testing with posts, so you may run into some snags there. {{end}}

## Github-flavored Markdown

You can use standard Multimarkdown syntax for tables. You can also use fenced code blocks. The configuration file shows the Markdown processor and extensiosn:

```
markdown: redcarpet

redcarpet:
  extensions: ["no_intra_emphasis", "fenced_code_blocks", "autolink", "tables", "with_toc_data"]
```

These extensions mean the following:

- don't italicize words with underscores
- allow three backticks before and after code blocks instead of `<pre>` tags
- automatically create links out of URLs
- allow table syntax
- add ID tags to headings automatically


## Related posts

By default, posts contain related posts beneath them. To disable this, add `related_pages: none` or `related_posts: none` in the frontmatter of the page.

Pages have tags instead of related posts. (It turns out that creating "Related pages" in Jekyll is much more difficult than related posts.)

## Automatic mini-TOCs

By default, a mini-TOC appears at the top of your pages and posts. If you don't want this, you can remove the {% raw %}`{% include toc.html %}` {% endraw %} from the layouts/page.html and layouts/posts.html files.

If you don't want the TOC to appear for a specific page, add `toc: false` in the frontmatter of the page.

This frontmatter requires you to use the `##` syntax for headings. If you use `<h2>` elements, then you must add an ID attribute for the h2 element in order to get it to appear in the mini-TOC.

## Specify a particular page layout

The configuration file sets the default layout for pages as the page layout. You can create other layouts inside the layouts folder. You can then specify that the page use that particular layout by adding `layout: mylayout.html` in the page's frontmatter. Whatever layout you specify in the frontmatter of a page will override the layout default set in the configuration file.

## Comments

Disqus, a commenting system, is integrated into the theme. In the configuration file, specify the Disqus code for the universal code, and Disqus will appear. If you don't add a Disqus value, the Disqus code isn't included.