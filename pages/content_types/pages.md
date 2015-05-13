---
title: Pages
permalink: /pages/
audience: writer, designer
tags: [getting-started, formatting]
keywords: 
last_updated: 
summary: 
---
{% include linkrefs.html %} 

## Where to author content
Use a text editor such as Sublime Text, WebStorm, or Atom to create pages. 

My preference is WebStorm, since it will treat all files in your project as belonging to a project. This allows you to easily search for instances of keywords, do find-and-replace operations, or do other actions that apply across the whole project.

## Frontmatter
Make sure each page has frontmatter at the top like this:

```
---
title:  
permalink: //
tags: []
keywords: audience: 
last_updated
summary: 
---
{% include linkrefs.html %} 
```
Frontmatter is always formatted with three hyphens at the top and bottom. Your frontmatter must have a `title` and `permalink` value. All the other values are optional.

The following table describes each of the frontmatter that you can use with this theme:

| Frontmatter | Required? | Description |
|-------------|-------------|-------------|
| **title** | Required | The title for the page |
| **permalink**  | Required | The URL path for the page  |
| **tags** | Optional | Tags for the page. Make all tags single words, with hyphens if needed. Separate them with commas. Enclose the whole list within brackets. Also, note that tags must be added to \_data/tags.yml to be allowed entrance into the page.   |
| **keywords** | Optional | Synonyms and other keywords for the page. This information gets stuffed into the page's metadata to increase SEO. The user won't see the keywords, but if you search for one of the keywords, it will be picked up by the search engine.  |
| **last_updated**  | Optional | The date the page was last updated. This information is helpful for readers trying to evaluate how current and authoritative information is. |
| **summary** | Optional | A 1-2 word sentence summarizing the content on the page. This gets formatted into the summary section in the page layout. Adding summaries is a key way to make your content more scannable by users (check out [Jakob Nielsen's site](http://www.nngroup.com/articles/corporate-blogs-front-page-structure/) for a great example of page summaries.)  |
| **metadata** | Optional | Boolean (`true` or `false`). If you add `metadata: false` to the frontmatter, then the page metadata sidebar won't appear for the page. You might want to hide the sidebar for special pages such as glossaries, knowledge-base layouts, or more.
| **datatable** | Optional | Boolean. If you add `true`, then scripts for the [jQuery datatables plugin](https://www.datatables.net/) appear for the page. |
| **video** | Optional | If you add `true`, then scripts for [Video JS: The HTML5 video player](http://www.videojs.com/) appear on the page. |

{{tip}} You can see the scripts that conditionally appear by looking in the \_layouts/default.html page. Note that these scripts are served via a CDN, so the user must be online for the scripts to work. However, if the user isn't online, the tables and video still appear &mdash; they degrade gracefully. {{end}}

Only the title and permalink are actually required. If you leave the other fields blank, the theme will not show them (for example, if you leave tags blank, the theme won't show "Tags:" with nothing after it in the page metadata. Instead, the whole line will be hidden.

To see how these metadata values get inserted into the theme, look at the page layout, specifically the \_includes/pagemetadata.html file.

## Creating a Jekyll template in WebStorm

Rather than insert the frontmatter by hand each time, it's much faster to simply create a Jekyll template in WebStorm (my favorite editor for Jekyll projects). 

To create a Jekyll template:

1. Right-click a file in the list of project files, and select **New > Edit File Templates**.
2. In the upper-left corner of the dialog box that appears, click the **+** button to create a new template.
3. Name it Jekyll. Insert the frontmatter you want, and save it.

To use the Jekyll template, when you create a new file in your WebStorm project, you can select your Jekyll file template.


## Markdown or HTML format

Pages can be either Markdown or HTML format (specified through either an .md or .html file extension).
 
If you use Markdown, you can also include HTML formatting where needed. But not vice versa -- if you use HTML (as your file extension), you can't insert Markdown content. 

Also, if you use HTML inside a Markdown file, you cannot use Markdown inside of HTML. But you can use HTML inside of Markdown.

For your Markdown files, note that a space or two indent will set text off as code or blocks, so avoid spacing indents unless intentional.

## Where to save pages

Store all your pages inside the pages folder. The number of subfolders inside your pages directory doesn't matter. You won't have to use paths (such as ../) when linking to pages. Instead, all the pages will be pulled out to the root directory (each page rendered into its own folder), and links are established through the permalink value in the page's frontmatter.

If you want to use a colon in your page title, you must enclose the title's value in quotation marks.

## Pages versus posts

Most of the theme is designed for using pages, but you can also use posts. Posts are intended for blog entries. They have dates in the filenames, and they sort chronologically when get the posts. Create posts inside the _posts folder.

The latest_posts.html file shows the latest posts. The tagindex.html file sorts posts by tags. The archive.html sorts posts by date.

{{note}} I haven't done much testing with posts, so you may run into some snags there. I'm planning to convert my blog (idratherbewriting.com) to Jekyll using this same theme, and when I do, I'll iron out all the issues with posts. {{end}}

## Github-flavored Markdown

You can use standard Multimarkdown syntax for tables. You can also use fenced code blocks. The configuration file shows the Markdown processor and extensiosn:

```
markdown: redcarpet

redcarpet:
  extensions: ["no_intra_emphasis", "fenced_code_blocks", "autolink", "tables", "with_toc_data"]
```
These extensions mean the following:

| Redcarpet extension | Description |
| --------------|---------------|
| no_intra_emphasis   |  don't italicize words with underscores  |
| fenced_code_blocks  | allow three backticks before and after code blocks instead of `<pre>` tags   |
| autolink  | automatically create links out of URLs   |
| tables  | allow table syntax    |
| with_toc_data  | add ID tags to headings automatically   |

{{note}}  {% include custom/toc_id_note.html %} {{end}}

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
