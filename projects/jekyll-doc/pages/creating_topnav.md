---
title: Topnav
permalink: /creating_topnav/
---
{% include_relative reuse/variables.html %}


You create the links in the top navigation bar in the same way that you create them for the sidebar (see {{creating_toc}}) {{conditional_logic}}. 

The top navigation contains two link sections: the single-level links (called Topnav), and the drop-down links (called Topnav dropdowns). The YML group doesn't try to combine both of these levels in the same grouping.

The top navigation bar is intended for general information links, such as about, contact, demo, blog, and so on. 

If you want to add an external url, you must use `external_url` instead of just `url` in the YML file. This will trigger the link logic in the theme to apply a different syntax to the link target. 


