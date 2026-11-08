---
title: Publishing on GitHub Pages
tags: [publishing]
keywords: github pages, publishing, hosting, deploy
last_updated: November 8, 2026
sidebar: mydoc_sidebar
permalink: mydoc_publishing_github_pages.html
summary: "You can publish your project on GitHub Pages, a free hosting service from GitHub. Put the theme in a GitHub repository, tell GitHub Pages which branch to publish, and GitHub builds the Jekyll site for you each time you push."
folder: mydoc
---

## Create your repository

The quickest way to start is to make your own copy of the theme on GitHub:

1.  Sign in to [GitHub](https://github.com).
2.  Go to the [theme's repository](https://github.com/tomjoht/documentation-theme-jekyll) and click **Use this template** > **Create a new repository**.
3.  Choose an owner and a repository name, such as **mydocs**, and click **Create repository**.
4.  Clone your new repository to your computer so you can edit it locally:

    ```
    git clone https://github.com/your-username/mydocs.git
    ```

If you already have the theme files on your computer, you can instead create an empty repository on GitHub and push the files to it.

## Turn on GitHub Pages

1.  In your repository on GitHub, click **Settings** > **Pages**.
2.  Under **Build and deployment**, set **Source** to **Deploy from a branch**.
3.  Under **Branch**, select the branch that contains the theme (for example, **main** or **gh-pages**) and the **/ (root)** folder, and then click **Save**.

GitHub builds the site with the same github-pages gem that the theme's Gemfile uses. After a minute or two, the site appears at `https://your-username.github.io/mydocs/`. You can watch the build's progress on the repository's **Actions** tab.

You don't need to set `url` or `baseurl` in \_config.yml. The theme uses relative links, so it works at any address, and GitHub Pages sets `baseurl` for you, which the 404 page uses.

## Publish changes

Each time you push a commit to the branch you selected, GitHub rebuilds and republishes the site:

```
git add --all
git commit -m "Update docs"
git push
```

Before you push, it's a good idea to build the site locally with `bundle exec jekyll serve` to check for errors. The theme also includes a GitHub Actions workflow (.github/workflows/build.yml) that builds the site for every pull request, so you can catch errors before you merge.

## Use a custom domain

To publish the site at your own domain, such as docs.example.com, go to **Settings** > **Pages**, enter the domain under **Custom domain**, and then add a DNS record with your domain provider. For details, see [Managing a custom domain for your GitHub Pages site](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site).

## Use the latest Jekyll or other plugins

The branch-based build only supports the Jekyll version and plugins on the [GitHub Pages dependency list](https://pages.github.com/versions/). If you need Jekyll 4 or other plugins, set **Source** to **GitHub Actions** instead and use a workflow that builds the site and deploys it. GitHub suggests a Jekyll workflow when you choose that option. See [Using custom workflows with GitHub Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages).

{% include links.html %}
