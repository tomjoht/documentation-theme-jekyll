---
title: GitHub Initial Setup
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
toc: false
permalink: BOADocProcess_GitInitSetup.html
folder: BOADocProcess
---
GitHub Initial Setup
==================================
Git Bash Set Up
---------------
1.  Install Git Bash by downloading from here: [[https://git-scm.com/]{.underline}](https://git-scm.com/)

2.  Follow these steps to set up Git Bash for the first time: [[https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup]{.underline}](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)

Clone BackOffice/dsp-docs repo to local
---------------------------------------
Prior to doing any work, you need to obtain a copy of the
BackOfficeAssoc dsp-docs repository for your local computer.

1.  In GitHub, go to the BackOfficeAssoc account.

2.  Find the docs-dsp repo you need to work on.

3.  In the BackOfficeAssoc/dsp-docs repo, click the **Clone or download** button. Once you click it, it will reveal a URL that you need to copy and paste into your command line in the next step. Click the copy to clipboard button to the right of the url to copy it.

 **NOTE:** There are various options for cloning. We will be doing the clone from the command line, so simply copy the SSH URL shown.

4.  Open Git Bash and navigate to the directory that you wish to download to.

 **NOTE:** The repository will be cloned into a new directory below the one you specify, with the same name as the repository, ex. C:\\heathercloward\\github\\dsp-docs.

 **NOTE:** Alternatively, in Windows Explorer, you can right-click in a folder and select **Git Bash Here** from the dropdown menu to open the command prompt at that location.
 ![https://lh5.googleusercontent.com/hFhvpydcC8JaB\_f9zpXyWVfn-gIi0GKXrIy\_GSp9x-jYBJqH7KaeRH58NOAm4Bfj2C1svn0aM\_3fd87XM6es5R9D5Uje1Wo9eoHZFtUryMgnXUUcCCH9S-ZnUi-mRCE4dHMAcUDW](media/image57.png)

5.  Run the git clone command using the SSH URL from step 1.

 **NOTE:** It should look like: git clone git\@github.com:BackOfficeAssoc/dsp-docs.git

6.  Switch into your new directory by entering the git command cd dsp-docs

 **NOTE:** You will know you are in the correct directory by the command prompt, ex. Documents/GitHub/dsp-docs (develop) - shows repo name and branch name.

7.  Fetch the develop branch so that you have it in your local repo by entering the git command git fetch origin develop.

 **NOTE:** Any branch you do not have on your local that exists on the remote can be created in this way.
 **NOTE:** All release branches should be based on the develop branch.
