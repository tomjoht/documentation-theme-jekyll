---
title: Git Resources
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "This page provides the docteam with resources for learning about Git and how it works."
permalink: BOADocProcess_GitResources.html
folder: BOADocProcess
---

## Git & GitHub

[Git and GitHub Series by Briana Marie Swift on Free Code Camp](https://www.youtube.com/watch?list=PLWKjhJtqVAbkFiqHnNaxpOPhh9tSWMXIF&v=vR-y_2zWrIE)

Focus on these videos from the series for a basic background on Git:

1.  [Introduction to Git & GitHub](https://www.youtube.com/watch?v=vR-y_2zWrIE&index=2&list=PLWKjhJtqVAbkFiqHnNaxpOPhh9tSWMXIF&t=0s)

2.  [Branching and the GitHub Workflow](https://www.youtube.com/watch?v=2GO1a1vgNrc&list=PLWKjhJtqVAbkFiqHnNaxpOPhh9tSWMXIF&index=2)

3.  [Cloning and Working Locally](https://www.youtube.com/watch?v=09wR8kYT3t8&index=4&list=PLWKjhJtqVAbkFiqHnNaxpOPhh9tSWMXIF)

4.  [How Commits Work](https://www.youtube.com/watch?v=JXM7MO2GgGg&list=PLWKjhJtqVAbkFiqHnNaxpOPhh9tSWMXIF&index=6)

5.  [Merging](https://www.youtube.com/watch?v=tYOl25gyuvk&index=8&list=PLWKjhJtqVAbkFiqHnNaxpOPhh9tSWMXIF)

6.  [Merge Conflicts](https://www.youtube.com/watch?v=sfT0WrChMrM&list=PLWKjhJtqVAbkFiqHnNaxpOPhh9tSWMXIF&index=9)

7.  [Undoing Commits](https://www.youtube.com/watch?v=XiFYShmnI4k&list=PLWKjhJtqVAbkFiqHnNaxpOPhh9tSWMXIF&index=11)

## GitHub for Noobs

[GitHub for Noobs Series from DevTips](https://www.youtube.com/playlist?list=PLqGj3iMvMa4LFz8DZ0t-89twnelpT4Ilw): a YouTube channel devoted to web development from a noob's perspective.

Focus on these videos from the series:

1.  [A Short History](https://www.youtube.com/watch?v=1h9_cB9mPT8&list=PLqGj3iMvMa4LFz8DZ0t-89twnelpT4Ilw&index=2&t=0s)

2.  [Common Workflows](https://www.youtube.com/watch?v=_ALeswWzpBo&list=PLqGj3iMvMa4LFz8DZ0t-89twnelpT4Ilw&index=2)

## Microsoft Virtual Academy

{% include tip.html content="If you don't have a Microsoft account, you will need to make a free one to access these videos." %}

[GitHub for Windows Users](https://mva.microsoft.com/en-US/training-courses/github-for-windows-users-16749?l=8MGXzodxC_5206218965)

Focus on these videos from the series: Basic Concepts and GitHub Workflow -- Part 1 -- 4

## BackOffice Associates Sandbox file on GitHub

[Sandbox Repo README](https://github.com/BackOfficeAssoc/sandbox/blob/master/git.md): This is information for the developers to understand how BOA does git. It provides some good content about git and the GitHub flow.

## Git Terminology and Background

### Terminology

**Repository:** A repository is a folder inside which you are going to store your project. You can have a local repository on your computer as well as a remote repository, located on GitHub. It is also referred to as a directory.

**Branch:** A branch is a copy of the repository and can be made based on whatever branch is available. We make branches in Git so that any changes that are made are not merged or added to the main content until everything has been finalized and approved.

**Merge:** Merging a branch means you are combining the changes from one branch into another. We do this when we have a new feature's content approved.

**Fetch:** When you fetch a remote repository you are contacting GitHub and pulling any changes that may have been made to the project files to whatever branch you are on in your local repository.

**Push:** When you push your changes to the remote repository you are updating the help files on GitHub with your changes. Once you have pushed, other writers can now fetch your changes and update their own local repos with what you have done.

**Commit:** After you have made changes to your local copy of the help files you need to commit them for the changes to be made to your local repository. Once a commit it made it must then be pushed to the remote repository so that other writers can access the changes.

### Background

Git is a distributed version control system. Git is known as a "distributed" (rather than \"centralized\") version control system because you can run it locally and disconnected from the Internet, and then "push" your changes to a remote system (such as GitHub) whenever you like. Git tracks content rather than files. Branches are lightweight and merging is easy. It\'s distributed, so basically every repository is a branch.

GitHub facilitates teams working on the same project by providing a web interface to the Git code repository and management tools for collaboration. GitHub allows team members to change, adapt and improve a project from its repositories. Each public or private repository contains all of a project\'s files, as well as each file\'s revision history. Repositories can have multiple collaborators and can be either public or private.

For our use of Git and GitHub, we have opted to use the [Git Bash](https://gitforwindows.org/) command line.
