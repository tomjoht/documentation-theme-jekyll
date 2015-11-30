---
title: Pages
tags: [getting_started, formatting, content-types]
keywords: pages, authoring, exclusion, frontmatter
last_updated: November 30, 2015
summary: "This theme uses pages only, not posts. You need to make sure your pages have the appropriate frontmatter. One frontmatter tag your users might find helpful is the summary tag. This functions similar in purpose to the shortdesc element in DITA."
---


## Where to author content
Use a text editor such as Sublime Text, WebStorm, IntelliJ, or Atom to create pages. 

My preference is IntelliJ/WebStorm, since it will treat all files in your project as belonging to a project. This allows you to easily search for instances of keywords, do find-and-replace operations, or do other actions that apply across the whole project.

## Page names and excluding files from outputs

By default, everything in your project is included in the output. This is problematic when you're single sourcing and need to exclude some files from an output. 

Here's the approach I've taken. Put all files in your root directory, but put the project name first and then any special conditions. For example, mydoc_writers_intro.md. 

In your configuration file, you can exclude all files that don't belong to that project by using wildcards such as the following:

exclude: 

- mydoc_*
- mydoc_writers_*

These wildcards will exclude every match after the `*`.

## Frontmatter
Make sure each page has frontmatter at the top like this:

{% raw %}
```yaml
---
title: Your page title
tags: [formatting, getting_started]
keywords: overview, going live, high-level
last_updated: November 30, 2015
summary: "Deploying DeviceInsight requires the following steps."
---
```
{% endraw %}

Frontmatter is always formatted with three hyphens at the top and bottom. Your frontmatter must have a `title` value. All the other values are optional.

The following table describes each of the frontmatter that you can use with this theme:

| Frontmatter | Required? | Description |
|-------------|-------------|-------------|
| **title** | Required | The title for the page |
| **tags** | Optional | Tags for the page. Make all tags single words, with hyphens if needed. Separate them with commas. Enclose the whole list within brackets. Also, note that tags must be added to \_data/tags_doc.yml to be allowed entrance into the page.   |
| **keywords** | Optional | Synonyms and other keywords for the page. This information gets stuffed into the page's metadata to increase SEO. The user won't see the keywords, but if you search for one of the keywords, it will be picked up by the search engine.  |
| **last_updated**  | Optional | The date the page was last updated. This information could helpful for readers trying to evaluate how current and authoritative information is. If included, the last_updated date appears in the footer of the page.|
| **summary** | Optional | A 1-2 word sentence summarizing the content on the page. This gets formatted into the summary section in the page layout. Adding summaries is a key way to make your content more scannable by users (check out [Jakob Nielsen's site](http://www.nngroup.com/articles/corporate-blogs-front-page-structure/) for a great example of page summaries.)  |
| **datatable** | Optional | Boolean. If you add `true`, then scripts for the [jQuery datatables plugin](https://www.datatables.net/) get included on the page. |
| **video** | Optional | If you add `true`, then scripts for [Video JS: The HTML5 video player](http://www.videojs.com/) get included on the page. |

{{site.data.alerts.tip}} You can see the scripts that conditionally appear by looking in the _layouts/default.html page. Note that these scripts are served via a CDN, so the user must be online for the scripts to work. However, if the user isn't online, the tables and video still appear. In other words, they degrade gracefully. {{site.data.alerts.end}}

## What about permalinks? 
What about permalinks? This theme isn't build using permalinks because it makes linking and directory structures problematic. Permalinks generate an index file inside a folder for each file in the output. This makes it so links (to other pages as well as to resources such as styles and scripts) need to include `../` depending upon where the other assets are located. But for any pages outside folders, such as the index.html page, you wouldn't use the `../` structure.

Basically, permalinks complicate the linking structure significantly, so they aren't used here. As a result, page URLs have an .html extension. If you include `permalink: something` in your frontmatter, your link to the page will break (actually, you could still go to sample instead of sample.html, but none of the styles or scripts will be correctly referenced).

## Colons in page titles 

If you want to use a colon in your page title, you must enclose the title's value in quotation marks.

## Saving pages as drafts

If you add `published: false` in the frontmatter, your page won't be published. You can also move draft pages into the _drafts folder to exclude them from the build.

{{site.data.alerts.tip}} You can create file templates in WebStorm that have all your common frontmatter, such as all possible tags, prepopulated. See {{site.data.mydoc.mydoc_urls.mydoc_webstorm_text_editor.link}} for details. {{site.data.alerts.end}}

## Markdown or HTML format

Pages can be either Markdown or HTML format (specified through either an .md or .html file extension).
 
If you use Markdown, you can also include HTML formatting where needed. But not vice versa &mdash; if you use HTML (as your file extension), you can't insert Markdown content.

Also, if you use HTML inside a Markdown file, you cannot use Markdown inside of HTML. But you can use HTML inside of Markdown.

For your Markdown files, note that a space or two indent will set text off as code or blocks, so avoid spacing indents unless intentional.

## Where to save pages

Store all your pages inside the root directory. This is because the site is built with relative links. There aren't any permalinks or baseurls used in the link architecture. This relative link nature of the site allows you to easily move it from one folder to another without invalidating the links.

If this approach creates too many files in one long list, consider grouping files into Favorites sections using WebStorms Add to Favorites feature.

## Github-flavored Markdown

You can use standard Multimarkdown syntax for tables. You can also use fenced code blocks. The configuration file shows the Markdown processor and extensiosn:

```
markdown: redcarpet

redcarpet:
  extensions: ["no_intra_emphasis", "fenced_code_blocks", "tables", "with_toc_data"]
```
These extensions mean the following:

| Redcarpet extension | Description |
| --------------|---------------|
| no_intra_emphasis   |  don't italicize words with underscores  |
| fenced_code_blocks  | allow three backticks before and after code blocks instead of `<pre>` tags   |
| tables  | allow table syntax    |
| with_toc\_data  | add ID tags to headings automatically   |

You can also add "autolink" as an option if you want links such as http://google.com to automatically be converted into links. 

{{site.data.alerts.note}} Make sure you leave the <code>with_toc_data</code> option included. This auto-creates an ID for each Markdown-formatted heading, which then gets injected into the mini-TOC. Without this auto-creation of IDs, the mini-TOC won't include the heading. If you ever use HTML formatting for headings, you need to manually add an ID attribute to the heading in order for the heading to appear in the mini-TOC. {{site.data.alerts.end}}

## Automatic mini-TOCs

By default, a mini-TOC appears at the top of your pages and posts. If you don't want this, you can remove the {% raw %}`{% include toc.html %}` {% endraw %} from the layouts/page.html file.

If you don't want the TOC to appear for a specific page, add `toc: false` in the frontmatter of the page.

The mini-TOC requires you to use the `##` syntax for headings. If you use `<h2>` elements, then you must add an ID attribute for the h2 element in order for it to appear in the mini-TOC.

## Specify a particular page layout

The configuration file sets the default layout for pages as the "page" layout.

You can create other layouts inside the layouts folder. If you create a new layout, you can specify that your page use your new layout by adding `layout: mylayout.html` in the page's frontmatter. Whatever layout you specify in the frontmatter of a page will override the layout default set in the configuration file.

## Comments

Disqus, a commenting system, is integrated into the theme. In the configuration file, specify the Disqus code for the universal code, and Disqus will appear. If you don't add a Disqus value, the Disqus code isn't included.

## Posts

This theme isn't coded with any kind of posts logic. For example, if you wanted to add a blog to your project that leverages posts, you couldn't do this with the theme. However, you could easily take the post logic from another site and integrate it into this theme. I've just never had a strong need to integrate blog posts into documentation.

## Custom keyboard shortcuts
Some of the Jekyll syntax can be slow to create. Using a utility such as [aText](https://www.trankynam.com/atext/) can make creating content a lot of faster.

For example, when I type `jif`, aText replaces it with {% raw %}`{% if site.platform == "x" %}`{% endraw %}. When I type `jendif`, aText replaces it with {% raw %}`{% endif %}`{% endraw %}.

You get aText from the App Store on a Mac for about $5.

There are alternatives to aText, such as Typeitforme. But aText seems to work the best. You can read more about it on [Lifehacker](http://lifehacker.com/5843903/the-best-text-expansion-app-for-mac).
