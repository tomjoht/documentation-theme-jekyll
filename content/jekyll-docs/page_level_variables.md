---
layout: page
title: Page-level variables
permalink: /page_level_variables/
thing1: Joe
thing2: Dave
tags: reuse
---

You can create custom variables in your front matter like this: 

```
---
layout: page
title: Page-level variables
permalink: /page_level_variables/
thing1: Joe
thing2: Dave
---
```

You can then access the values in those custom variables using the `page` namespace, like this:

```liquid
{% raw %}
thing1: {{page.thing1}}

thing2: {{page.thing2}}
```
{% endraw %}