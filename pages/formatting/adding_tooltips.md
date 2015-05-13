title: Adding tooltips
permalink: /adding_tooltips/
tags: [formatting]
keywords: popovers
audience: writers, designers
last_updated: May 8, 2015
summary: "You can add tooltips to your content. These tooltips work well for glossary definitions."
---
{% include linkrefs.html %} 
=======

## permalink: /adding_tooltips/

Because this theme is built on Bootstrap, you can simply use a specific attribute on an element to insert a tooltip. 

Suppose you have a glossary.yml file inside your _data folder. You could pull in that glossary definition like this:

<!--|%%|%7B%25%20raw%20%25%7D|%%|-->

```
<a href="#" data-toggle="tooltip" data-original-title="<!--|%%|%7B%7Bsite.data.glossary.jekyll_platform%7D%7D|%%|-->">Jekyll</a> is my favorite tool for building websites.</a>
```

<!--|%%|%7B%25%20endraw%20%25%7D|%%|-->

This renders to the following:

<a data-toggle="tooltip" data-original-title="<!--|%%|%7B%7Bsite.data.glossary.jekyll_platform%7D%7D|%%|-->" href="#">Jekyll</a> is my favorite tool for building websites.