---
title: Pages
tags: [getting_started, formatting, content_types]
keywords: pages, authoring, exclusion, frontmatter
last_updated: March 20, 2016
summary: "This theme primarily uses pages. You need to make sure your pages have the appropriate frontmatter. One frontmatter tag your users might find helpful is the summary tag. This functions similar in purpose to the shortdesc element in DITA."
sidebar: mydoc_sidebar
permalink: /mydoc_pages/
---

## Where to author content
Use a text editor such as Sublime Text, WebStorm, IntelliJ, or Atom to create pages. 

My preference is IntelliJ/WebStorm, since it will treat all files in your theme as belonging to a project. This allows you to easily search for instances of keywords, do find-and-replace operations, or do other actions that apply across the whole project.

## Page names and excluding files from outputs

By default, everything in your project is included in the output. You can exclude all files that don't belong to that project by specifying the file name, the folder name, or by using wildcards in your configuration file:

exclude: 

- filename.md
- subfolder_name/
- mydoc_*


These wildcards will exclude every match after the `*`.

## Frontmatter
Make sure each page has frontmatter at the top like this:

{% raw %}
```yaml
---
title: Alerts
tags: [formatting]
keywords: notes, tips, cautions, warnings, admonitions
last_updated: March 20, 2016
summary: "You can insert notes, tips, warnings, and important alerts in your content. These notes are stored as shortcodes made available through the linksrefs.hmtl include."
sidebar: mydoc_sidebar
permalink: /mydoc_alerts/
---
{% endraw %}

Frontmatter is always formatted with three hyphens at the top and bottom. Your frontmatter must have a `title` value. All the other values are optional. If you omit them, the theme won't break.

Note that you cannot use variables in frontmatter.

The following table describes each of the frontmatter that you can use with this theme:

| Frontmatter | Required? | Description |
|-------------|-------------|-------------|
| **title** | Required | The title for the page |
| **tags** | Optional | Tags for the page. Make all tags single words, with underscores if needed (rather than spaces). Separate them with commas. Enclose the whole list within brackets. Also, note that tags must be added to \_data/tags_doc.yml to be allowed entrance into the page. This prevents tags from becoming somewhat random and unstructured. You must create a tag page for each one of your tags following the pattern shown in the tags folder. (Tag pages aren't automatically created.)  |
| **keywords** | Optional | Synonyms and other keywords for the page. This information gets stuffed into the page's metadata to increase SEO. The user won't see the keywords, but if you search for one of the keywords, it will be picked up by the search engine.  |
| **last_updated**  | Optional | The date the page was last updated. This information could helpful for readers trying to evaluate how current and authoritative information is. If included, the last_updated date appears in the footer of the page in rather small font.|
| **summary** | Optional | A 1-2 word sentence summarizing the content on the page. This gets formatted into the summary section in the page layout. Adding summaries is a key way to make your content more scannable by users (check out [Jakob Nielsen's site](http://www.nngroup.com/articles/corporate-blogs-front-page-structure/) for a great example of page summaries.) The only drawback with summaries is that you can't use variables in them. |
| **permalink**| Required | This theme uses permalinks to facilitate the linking. You specify the permalink want for the page, and the \_site output will put the page into the root directory when you publish. The page will appear inside a folder by the same name, with the actual page being index.html. Browsers will automatically show the index.html file inside of any folder, so permalinks avoid the .html extension with file names. Permalink names don't have to match your file names, but it might be easier to keep them in sync. If you don't use permalinks, Jekyll automatically uses the file name and folder path as the link.|
| **datatable** | Optional | 'true'. If you add `datatable: true` in the frontmatter, scripts for the [jQuery Datatables plugin](https://www.datatables.net/) get included on the page. You can see the scripts that conditionally appear by looking in the \_layouts/default.html page. |
| toc | Optional | If you specify `toc: false` in the frontmatter, the page won't have the table of contents that appears below the title. The toc refers to the list of jump links below the page title, not the sidebar navigation. You probably want to hide the TOC on the homepage and product landing pages.|

## Colons in page titles 

If you want to use a colon in your page title, you must enclose the title's value in quotation marks.

## Saving pages as drafts

If you add `published: false` in the frontmatter, your page won't be published. You can also move draft pages into the \_drafts folder to exclude them from the build. With posts, you can also keep them as drafts by omitting the date in the title.

{{site.data.alerts.tip}} You can create file templates in WebStorm that have all your common frontmatter, such as all possible tags, prepopulated. See <a href="{{ "/mydoc_webstorm_text_editor" | prepend: site.baseurl }}">WebStorm Text Editor</a> for details. {{site.data.alerts.end}}

## Markdown or HTML format

Pages can be either Markdown or HTML format (specified through either an .md or .html file extension).
 
If you use Markdown, you can also include HTML formatting where needed. But not vice versa &mdash; if you use HTML (as your file extension), you can't insert Markdown content in the file.

Also, if you use HTML inside a Markdown file, you cannot use Markdown inside of HTML. But you can use HTML inside of Markdown.

For your Markdown files, note that a space or two indent will set text off as code or blocks, so avoid spacing indents unless intentional.

If you have a lot of HTML, as long as the top and bottom tags of the HTML are flesh left in a Markdown file, all the tags inside those bookend HTML tags will render as HTML, regardless of their indentation.

## Where to save pages

You can store your pages in any folder structures you want, with any level of folder nesting. The site output will pull all of those pages out of their folders and put them into the root directory. Check out the \_site folder, which is where Jekyll is generated, to see the difference between your project's structure and the resulting site output. 
 
## Page names

I recommend prefixing your page names with the product, such as "mydoc_pages" instead of just "pages." This way if you have other products that also hae topics with generic names such as "pages," there won't be naming conflicts. 

Additionally, consider adding the product name in parentheses after the title, such as "Pages (Mydoc)" so that users can clearly navigate different topics for each product.

## Kramdown Markdown

Kramdown is the Markdown flavor used in the theme. This mostly aligns with Github-flavored Markdown, but with some differences in the indentation allowed within lists. Basically, Kramdown requires you to line up the indent between list items with the first starting character after the space in your list item numbering. See this [blog post on Kramdown and Rouge](http://idratherbewriting.com/2016/02/21/bug-with-kramdown-and-rouge-with-github-pages/) for more details.

You can use standard Multimarkdown syntax for tables. You can also use fenced code blocks with lexers specifying the type of code. The configuration file shows the Markdown processor and extensiosn:

```yaml
highlighter: rouge
markdown: kramdown
kramdown:
 input: GFM
 auto_ids: true
 hard_wrap: false
 syntax_highlighter: rouge
```

## Automatic mini-TOCs

By default, a TOC appears at the top of your pages and posts. If you don't want the TOC to appear for a specific page, such as for a landing page or other homepage, add `toc: false` in the frontmatter of the page.

The mini-TOC requires you to use the `##` Markdown syntax for headings. If you use `<h2>` elements, you must add an ID attribute for the heading element in order for it to appear in the mini-TOC (for example, `<h2 id="mysampleid">Heading</h2>`.

## Specify a particular page layout

The configuration file sets the default layout for pages as the "page" layout.

You can create other layouts inside the layouts folder. If you create a new layout, you can specify that your page use your new layout by adding `layout: mylayout.html` in the page's frontmatter. Whatever layout you specify in the frontmatter of a page will override the layout default set in the configuration file.

## Comments

Disqus, a commenting system, is integrated into the theme. In the configuration file, specify the Disqus code for the universal code, and Disqus will appear. If you don't add a Disqus value, the Disqus form isn't included. 

## Custom keyboard shortcuts
Some of the Jekyll syntax can be slow to create. Using a utility such as [aText](https://www.trankynam.com/atext/) can make creating content a lot of faster.

For example, with my aText configuration, when I type `jlink`, aText replaces it with {% raw %}`<a href="{{ "/page" | prepend: site.baseurl }}">page</a>`{% endraw %}. 

You get aText from the App Store on a Mac for about $5. However, the Mac Store version of aText won't work on Mac OSX El Capitan due to sandbox security restrictions, so you need to download the app outside of the App Store to make it work.

There are alternatives to aText, such as Typeitforme. But aText seems to work the best. You can read more about aText on [Lifehacker](http://lifehacker.com/5843903/the-best-text-expansion-app-for-mac).
