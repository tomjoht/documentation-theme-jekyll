---
title: Initial Connection
keywords: IGCDocProcess
summary: "This page describes how to connect to the IGC UI repo for the first time and clone it."
sidebar: IGCDocProcess_sidebar
permalink: IGCDocProcess_initialConnect.html
folder: IGCDocProcess
---
Connect to the Repo for the First Time and Clone It
----------------------------------------------------

5.  Right-click the empty folder you created and select **GitBash
    Here**.

6.  Run git clone git\@github.com:BackOfficeAssoc/igc-ui.git\
    You will be asked to enter the passphrase you entered for your SSH
    key.\
    This will clone the UI repo into your local machine.

7.  Open the git config file in your local directory/folder (
    igc-ui/.git/config) using Visual Studio.

> **NOTE:** If your .git folder is not appearing, it is probably hidden.
> To reveal the .git folder, click **View** in the top nav menu in
> Windows File Explorer and check the **Hidden items** checkbox in the
> **Show/hide** section of the ribbon.

8.  Run cd igc-ui.

9.  Run git remote add upstream
    [git\@github.com:BackOfficeAssoc/igc-ui.git]{.underline}

10. In the .git config file, find the section headed: \`\[remote
    \"origin\"\]\` then add the following line in that section:

> fetch = +refs/pull/\*/head:refs/remotes/origin/pr/\*

11. In the .git config file, find the section headed: \`\[remote
    \"upstream\"\]\` then add the following line in that section:

fetch = +refs/pull/\*/head:refs/remotes/upstream/pr/\*Add Remotes

To access a specific developer's branch, run git remote add
https://github.com/user/repo.git
