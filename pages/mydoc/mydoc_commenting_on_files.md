---
title: Commenting on files
tags:
  - navigation
keywords: "annotations, comments, feedback"
last_updated: "November 30, 2016"
summary: "You can add a button to your pages that allows people to add comments."
sidebar: mydoc_sidebar
permalink: mydoc_commenting_on_files.html
folder: mydoc
---

## About the review process

If you're using the doc as code approach, you might also consider using the same techniques for reviewing the doc as people use in reviewing code. This approach will involve using Github to edit the files.

There's an Edit me button on each page on this theme. This button allows collaborators to edit the content on Github.

Here's the code for that button in the \_layouts/page.html file:

```
{% raw %}{% if site.github_editme_path %}

<a target="_blank" rel="noopener" href="https://github.com/{{site.github_editme_path}}{{page.path}}" class="btn btn-default githubEditButton" role="button"><i class="fa fa-github fa-lg"></i> Edit me</a>

{% endif %}{% endraw %}
```

The `page.path` value is the path to the page's source file, such as pages/mydoc/mydoc_alerts.md.

In your configuration file, set `github_editme_path` to your account, repository, and branch, followed by `/blob/` or `/edit/` and a trailing slash. For example, you might create a branch called "reviews" on your GitHub repo. Then you would add something like this in your configuration file: `github_editme_path: tomjoht/documentation-theme-jekyll/edit/reviews/`. Here "tomjoht" is my GitHub account name, the repo name is "documentation-theme-jekyll", and "reviews" is the branch. Using `/edit/` opens the file in GitHub's editor, while `/blob/` (which the theme uses by default) shows the file first.

If your project is on GitLab.com, comment out `github_editme_path` and set `gitlab_editme_path` instead, such as `your-group/your-project/-/blob/main/`. The button then links to gitlab.com with a GitLab icon.

To suppress this button, comment out the `github_editme_path` in the \_config.yml file.

## Add reviewers as collaborators

If you want people to collaborate on your project so that their edits get committed to a branch on your project, you need to add them as collaborators. For your Github repo, click **Settings** and add the collaborators on the Collaborators tab using their Github usernames.

If you don't want to allow anyone to commit to your Github branch, don't add the reviewers as collaborators. When someone makes an edit, Github will fork the theme. The person's edit then will appear as a pull request to your repo. You can then choose to merge the change indicated in the pull or not.

{% include note.html content="When you process pull requests, you have to accept everything or nothing. You can't pick and choose which changes you'll merge. Therefore you'll probably want to edit the branch you're planning to merge or ask the contributor to make some changes to the fork before processing the pull request." %}


## Workflow

Users will make edits in your "reviews" branch (or whatever you want to call it). You can then commit those edits as you make updates.

When you're finished making all updates in the branch, you can merge the branch into the master.

Note that if you're making updates online, those updates will be out of sync with any local edits.

{% include warning.html content="Don't make edits both online using Github's browser-based interface AND offline on your local machine using your local tools. When you try to push from your local, you'll likely get a merge conflict error. Instead, make sure you do a pull and update on your local after making any edits online." %}

## Prose.io

[Prose.io](https://prose.io) is an editor that works on top of GitHub. When you go to prose.io, it asks you to authorize your GitHub account, and then it reads and edits files directly from your GitHub repo in a simpler interface.

 {% include links.html %}
