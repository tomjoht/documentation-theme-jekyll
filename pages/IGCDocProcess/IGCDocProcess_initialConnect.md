---
title: Initial Connection
keywords: IGCDocProcess
summary: "This page describes how to connect to the IGC UI repo for the first time and clone it."
sidebar: IGCDocProcess_sidebar
permalink: IGCDocProcess_initialConnect.html
folder: IGCDocProcess
---

To connect to the Repo for the First Time and Clone It

1. Right-click the empty folder you created and select **GitBash Here**.
2. Run the git command `git clone git\@github.com:BackOfficeAssoc/igc-ui.git`
   {% include note.html content="You will be asked to enter the passphrase you entered for your SSH key." %}
   {% include note.html content="This step will clone the UI repo into your local machine." %}
3. Open the git config file in your local directory/folder (`igc-ui/.git/config`) using Visual Studio.
   {% include note.html content="If your .git folder is not appearing, it is probably hidden. To reveal the .git folder, click **View** in the top nav menu in Windows File Explorer and check the **Hidden items** checkbox in the **Show/hide** section of the ribbon." %}
4. Run the command `cd igc-ui`.
5. Run the git command `git remote add upstream git\@github.com:BackOfficeAssoc/igc-ui.git`.
6. In the .git config file, find the section headed: `remote "origin"` then add the following line in that section: `fetch = +refs/pull/\*/head:refs/remotes/origin/pr/`
7. In the .git config file, find the section headed: `remote "upstream"` then add the following line in that section: `fetch = +refs/pull/*/head:refs/remotes/upstream/pr/*Add Remotes`
8. To access a specific developer's branch, run the git command `git remote add https://github.com/<user>/repo.git`
