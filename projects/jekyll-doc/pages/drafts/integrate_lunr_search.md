---
title: How to integrate the lunr search
permalink: /integrate_lunr_search/
tags: publishing
---

1. clone the lunr search repo: https://github.com/slashdotdash/jekyll-lunr-js-search
2. inside lib, copy the jekyll-lunr-js-search.rb and jekyll_lunr_js_search folder and insert them into your _plugins directory. if you don't have a _plugins directory, create one.
3. inside build, copy the search.min.js and lunr.min.js files and insert them in a folder called js in your root directoy. (again, if you don't have a folder called js, create one.)
4. copy this sample search.html file here: https://gist.github.com/flohei/91d987a1827023bef8ca. move it to your root directory. 