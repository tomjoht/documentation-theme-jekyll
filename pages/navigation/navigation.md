---
title: Navigation
permalink: /navigation/
audience: writer, designer
tags: navigation
---

The sidebar and top navigation bar read their values from yml files inside the _data folder. Follow the YML syntax shown in the file. 

# Sidebar nav
The configuration file (configs/config_writer.yml) file includes a value (sidebar_accordion) that lets you choose whether to use the accordion feature in the sidebar or not. The accordion collapses other sections when a section is opened, which conserves space on the screen. Put `true` or `false` for the value.

You can add two levels of nesting in the sidebar nav. Follow the pattern of the existing sidebar.yml file exactly. With YML, each new level is set off with two space below it. You can't change the names of the nesting levels without also making corresponding edits to the sidebar.htm file in the _includes directory.

## Top nav 

If you want the URL to point to an external site, use <code>external&#95;url</code> instead of `url`. (The sidebar.yml file doesn't have the ability to point to external sites in the nav.)

The topnav folder has two link areas: a single level link and a drop-down link. (You don't make the dropdown link by adding additional levels in the single-level.)

