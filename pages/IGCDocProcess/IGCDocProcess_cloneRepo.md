---
title: Clone Repo to Local
keywords: IGCDocProcess
summary: "This page describes the process the doc team uses to clone the igc-help GitHub repo to their laptops."
sidebar: IGCDocProcess_sidebar
permalink: IGCDocProcess_cloneRepo.html
folder: IGCDocProcess
---
Clone repo to local
-------------------

1. In the BackOfficeAssoc/igc-help repo, click the **Clone or download** button. Once you click it, it will reveal a URL that you need to copy and paste into your command line in the next step. Click the copy to clipboard button to the right of the url to copy it.
   {% include note.html content="There are various options for cloning. We will be doing the clone from the command line, so copy the SSH URL shown." %}

2.  Open Git Bash and navigate to the directory that you wish to download to.
    {% include note.html content="The repository will be cloned into a new directory below the one you specify, with the same name as the repository, ex.  `C:\\heathercloward\\Documents\\GitHub\\igc-help`." %}
    {% include tip.html content="In Windows Explorer, you can right-click in a folder and select **Git Bash Here** from the dropdown menu to open the command prompt at that location." %}
    {% include image.html file="gitBashHere.png" alt="Right-click menu with Git Bash Here option" caption="Right-click menu with Git Bash Here option" %}

3.  Enter the git clone command using the SSH URL from step 1.
    {% include note.html content="Example: git clone git\@github.com:BackOfficeAssoc/igc-help.git" %}

4.  Switch into your new directory by entering the git command cdigc-help
    {% include note.html content="You will know you are in the correct directory by the command prompt, ex. Documents/GitHub/igc-help (master) - shows repo name and branch name." %}

5.  Fetch the develop branch so that you have it in your local repo by entering the git command git fetch origin develop.
