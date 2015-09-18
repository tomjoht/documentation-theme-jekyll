---
title: Commenting on files
tags: 
  - navigation
keywords: "annotations, comments, feedback"
last_updated: "August 12, 2015"
summary: "You can add a button to your pages that allows people to add comments. Prose.io is an overlay on Github that would allow people to make comments in an easier interface."
published: true
---

## About the review process

If you're using the doc as code approach, you might also consider using the same techniques for reviewing the doc as people use in reviewing code. This approach will involve using Github to edit the files. 

There's an Edit me button on each page on this theme. This button allows collaborators to edit the content on Github.

Here's the code for that button on the page.html layout:

```
    {% if site.github_editme_path %}
    <a href="https://github.com/{{site.github_editme_path}}{{page.url | replace: '.html', '.md'}}" class="btn btn-default " role="button"><i class="fa fa-github fa-lg"></i> Edit me</a>
    {% endif %}
```


## Add reviewers as collaborators

If you want people to collaborate on your project so that their edits get committed to a branch on your project, you need to add them as collaborators. For your Github repo, click **Settings** and add the collaborators on the Collaborators tab using their Github usernames.

If you don't want to allow anyone to commit to your Github branch, don't add the reviewers as collaborators. When someone makes an edit, Github will fork the theme. The person's edit then will appear as a pull request to your repo. You can then choose to merge the change indicated in the pull or not.


