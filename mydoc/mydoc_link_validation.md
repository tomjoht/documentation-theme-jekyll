---
title: Link validation
keywords: broken links, orphan links, publishing errors, validation, link validity, hyperlink issues
tags: [publishing]
last_updated: September 13, 2015
summary: "Before deploying your published site, you want to ensure that you don't have any broken links. There are a few ways to check for broken links."
---

## Why broken links are challenging for technical writers
One of the challenging aspects of technical writing is avoiding broken links in your output. Consider this example. You have three outputs, with different topics included for different audiences. The topics each have inline cross references pointing to the other topics, but since some of the topics aren't included for each audience, you risk having a broken link for the output that omits that topic.

Additionally, technical writers frequently manage large numbers of topics, and as they make updates, they rename titles, remote some topics, combine multiple topics into the same topic, and make other edits. When you're developing content, the pages and titles in your topics and navigation are in flux. You shift things around constantly trying to find the right organization, the right titles, and more. 

During this time, if you have inline links that point to specific pages, how do you avoid broken links in your output?

## Use the title checker

The theme has a file called title-checker.html. This file will iterate through all the pages listed in the sidebar navigation and top navigation, and compare the navigation titles against the page titles based on matching URLs. If there are inconsistencies in the titles, they get noted on the title-checker.html page. 

To run the link checker, just build or serve your project, and go to title-checker.html in your browser (such as Chrome). If there are inconsistencies, they will be noted on the page.

Note that in order for the title-checker file to run correctly, it has to detect a match between the URL listed in the sidebar or top navigation with the URL for the page (based on the file name). If you have the wrong URL, it won't tell you if the page titles match. Therefore you should always click through all the topics in your navigation to make sure the URLs are accurate.

## Generate a PDF

When you generate a PDF, Prince XML will print "page 0" for any cross references it can't find. This lets you know that a particular link is bad because the page is missing.

If you have links in your PDF that aren't references to other topics (maybe they're links to PDF file assets, or links within a navtab or collapsible section), then you must add a class of `noCrossRef` to the link to avoid having Prince write "page 0" for the link. 

(Note that there are still some kinks I'm working out with this. You may find that links still say "page 0" even if they have the `noCrossRef` class.)

## Use data references for all inline links

Instead of creating links to direct pages, use the data reference technique described in {{site.data.mydoc.mydoc_urls.mydoc_hyperlinks.link}}. With this method, the urls.txt file iterates through all the pages in your navigation and formats them into a YAML syntax. 

Then you insert an inline link by referring to that YAML data. For example, the previous hyperlink is {% raw %}`{{site.data.mydoc.mydoc_urls.mydoc_hyperlinks.link}}`{% endraw %}. 

As you go through the link validation process, make sure you copy over the content from the generated urls.txt (in the Jekyll site output) and insert it into the urls.yml file in your \_data folder.