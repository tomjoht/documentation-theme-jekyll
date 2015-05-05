---
title: Content reuse
permalink: /content_reuse/
tags: single-sourcing
audience: writer, designer
keywords: 
last_updated: 
summary: 
---
{% include linkrefs.html %} 

You can embed content from one file inside another using includes. Put the file containing content you want to reuse (e.g., mypage.html) inside the _includes folder, and then use a tag like this:

{% raw %}
```
{% include mypage.html %}
```
{% endraw %}

With content in your _includes folder, you don't add any frontmatter to these pages because they will be included on other pages already containing frontmatter.

Also, when you include a file, all of the file's contents get included. You can't specify that you only want a specific part of the file included. However, you can use parameters with includes. See Jekyll's documentation for more information on that.

## Page-level variables

You can also create custom variables in your frontmatter like this: 

```
---
title: Page-level variables
permalink: /page_level_variables/
thing1: Joe
thing2: Dave
---
```

You can then access the values in those custom variables using the `page` namespace, like this:


{% raw %}
```
thing1: {{page.thing1}}
thing2: {{page.thing2}}
```
{% endraw %}


