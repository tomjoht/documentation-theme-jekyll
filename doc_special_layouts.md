---
title: Special layouts overview
tags: [special-layouts]
keywords: layouts, information design, presentation
last_updated: August 12, 2015
summary: "This theme has a few special layouts. Special layouts include the JS files they need directly in the page. The JavaScript for each special layout does not load by default for every page in the site."
---
{% include linkrefs.html %}

{{note}} By "layout," I'm not referring to the layouts in \_layouts in the project files. I'm referring to special ways of presenting information on the same "page" layout. {{end}}

## FAQ layout

See {{doc_faq}} for an example of the FAQ format, which follows an accordion, collapse/expand format. This code is from Bootstrap.

## Knowledgebase layout

See {{doc_kb_layout}} for a possible layout for knowledge base articles. This layout looks for pages containing specific tags.

## Scroll layout

If you have a long JSON message you're documenting, see the {{doc_scroll}}. This layout adds a side pane showing links to pointers in the left pane. 

## Shuffle layout

If you want a dynamic card layout that allows you to filter the cards, see {{doc_shuffle}}. This uses the Shuffle JS library.


