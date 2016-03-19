---
title: Check page title consistency
tags: [navigation]
keywords: "validation, titles, page titles, inconsistency, errors"
last_updated: "November 30, 2016"
summary: "The title checker page helps ensure that the titles in your pages match the titles in your TOC."
sidebar: mydoc_sidebar
permalink: /mydoc_title_checker/
---

The theme has a file called title-checker.html. This file will iterate through all the pages listed in the sidebar navigation and top navigation, and compare the navigation titles against the page titles based on matching URLs. If there are inconsistencies in the titles, they get noted on the title-checker.html page.

To run the link checker, just build or serve your project, and go to /title-checker in your browser (such as Chrome). If there are inconsistencies, they will be noted on the page.

Note that in order for the title-checker file to run correctly, it has to detect a match between the URL listed in the sidebar or top navigation with the URL for the page (based on the file name). If you have the wrong URL, it won’t tell you if the page titles match. Therefore you should always click through all the topics in your navigation to make sure the URLs are accurate.

{{site.data.alerts.note}} If your page titles have your product name in parentheses, but your sidebar doesn't have the product name in parentheses, this title-checker tool is going to return a lot of mismatches. This is one limitation of the code right now. {{site.data.alerts.end}}

Note also that you must manually configure your sidebar file in the first line of the code, and then repeat the same chunk of code for each sidebar. Right now the code doesn't automatically iterate over every sidebar file. It's somewhat of a manual configuration process there.

