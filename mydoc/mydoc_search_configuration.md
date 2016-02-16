---
title: Search configuration
tags: [publishing, navigation]
keywords: search, json, configuration, findability
last_updated: November 30, 2015
summary: "The search feature uses JavaScript to look for keyword matches in a JSON file. The results show instant matches, but it doesn't provide a search results page like Google. Also, sometimes invalid formatting can break the JSON file."
---


## About search
The search is configured through the search.json file in the root directory. Take a look at that code if you want to change what fields are included.

The search is a simple search that looks at content in pages. It looks at titles, summaries, keywords, tags, and bodies.

However, the search doesn't work like google &mdash; you can't hit return and see a list of results on the search results page, with the keywords in bold. Instead, this search shows a list of page titles that contain keyword matches. It's fast, but simple.

## Excluding pages from search

By default, every page is included in the search. Depending on the type of content you're including, you may find that some pages will break the JSON formatting. If that happens, then the search will no longer work.

If you want to exclude a page from search add `search: exclude` in the frontmatter.

## Troubleshooting search

You should exclude any files from search that you don't want appearing in the search results. For example, if you have a tooltips.json file or prince-file-list.txt, don't include it, as the formatting will break the JSON format.

If any formatting in the search.json file is invalid (in the build), search won't work. You'll know that search isn't working if no results appear when you start typing in the search box.

If this happens, go directly to the search.json file in your browser, and then copy the content. Go to a [JSON validator](http://jsonlint.com/) and paste in the content. Look for the line causing trouble. Edit the file to either exclude it from search or fix the syntax so that it doesn't invalidate the JSON. 

The search.json file already tries to strip out content that would otherwise make the JSON invalid:

{% raw %}
```json
      "body": "{{ page.content | strip_html | strip_newlines | replace: '\', '\\\\' | replace: '"', '\\"' | replace: '^t', '    '  }}",
```
{% endraw %}

Note that the last replace, `| replace: '^t', '    ' `, looks for any tab character and replaces it with four spaces. Yes, an innocent little tab character invalidates JSON. Geez. If you run into other problematic formatting, you can use regex expressions to find and replace the content. See [Regular Expressions](http://www.ultraedit.com/support/tutorials_power_tips/ultraedit/regular_expressions.html) for details on finding and replacing code.

It's possible that the formatting may not account for all the scenarios that would invalidate the JSON. (Sometimes it's an extra comma after the last item that makes it invalid.)

{% if site.audience == "designers" %}
## Customizing search results

At some point, you may want to customize the search results more. Here's a little more detail that will be helpful. The search.json file retrieves various page values:

```json
{% raw %}
    {% if page.search == true %}
      {
      "title": "{{ page.title | escape }}",
      "tags": "{{ page.tags }}",
      "keywords": "{{page.keywords}}",
      "url": "{{ page.url | replace: "/", "" }}",
      "last_updated": "{{ page.last_updated }}",
      "summary": "{{page.summary}}",
      "body": "{{ page.content | strip_html | strip_newlines | replace: '\', '\\\\' | replace: '"', '\\"' }}"
      }
{% endraw %}
```

The \_includes/topnav.html file then makes use of these values:

```html
<!-- start search -->
<div id="search-demo-container">
<input type="text" id="search-input" placeholder="{{site.data.strings.search_placeholder_text}}">
<ul id="results-container"></ul>
</div>
<script src="js/jekyll-search.js" type="text/javascript"></script>
<script type="text/javascript">
SimpleJekyllSearch.init({
searchInput: document.getElementById('search-input'),
resultsContainer: document.getElementById('results-container'),
dataSource: 'search.json',
searchResultTemplate: '<li><a href="{url}" title="{{page.title | replace: "'", "\"}}">{title}</a></li>',
noResultsText: '{{site.data.strings.search_no_results_text}}',
limit: 10,
fuzzy: true,
})
</script>
<!-- end search -->
</li>
```

Where you see `{url}` and `{title}`, the search is retrieving the values for these as specified in the search.json file. 

At some point, you may want to add in the `{summary}` as well. You could create a dedicated search page that could include the summary as an instant result as you type. 
{% endif %}