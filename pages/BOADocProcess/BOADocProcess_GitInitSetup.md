---
title: GitHub Initial Setup
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "This page describes how to set up the doc team's source control, git, onto your laptop."
permalink: BOADocProcess_GitInitSetup.html
folder: BOADocProcess
---
## Git Bash Set Up

1.  Install Git Bash by downloading from here: [https://git-scm.com/](https://git-scm.com/)
2.  Follow these steps to set up Git Bash for the first time: [https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)

## Clone BackOffice/dsp-docs repo to local

Prior to doing any work, you need to obtain a copy of the
BackOfficeAssoc dsp-docs repository for your local computer.

To clone the BOA dsp-docs repo to your laptop:
1.  In GitHub, go to the BackOfficeAssoc account.
2.  Find the BackOfficeAssoc/dsp-docs repo.
3.  In the BackOfficeAssoc/dsp-docs repo, click the **Clone or download** button. Once you click it, it will reveal a URL that you need to copy and paste into your command line in the next step. Click the copy to clipboard button to the right of the url to copy it.
    {% include note.html content="There are various options for cloning. We will be doing the clone from the command line, so simply copy the SSH URL shown." %}
4.  Open Git Bash and navigate to the directory that you wish to download to.
    <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> The repository will be cloned into a new directory below the one you specify, with the same name as the repository, ex. <code class="highlighter-rouge">C:\\heathercloward\\github\\dsp-docs</code>.</div>
    {% include tip.html content="Alternatively, in Windows Explorer, you can right-click in a folder and select **Git Bash Here** from the dropdown menu to open the command prompt at that location." %}
5.  Run the git clone command using the SSH URL from step 3.
    <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> It should look like: <code class="highlighter-rouge">git clone git@github.com:BackOfficeAssoc/dsp-docs.git</code>.</div>
6.  Switch into your new directory by entering the git command `cd dsp-docs`
    <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> You will know you are in the correct directory by the command prompt, ex. <code class="highlighter-rouge">Documents/GitHub/dsp-docs (develop)</code> shows repo name and branch name.</div>
7.  Fetch the develop branch so that you have it in your local repo by entering the git command `git fetch origin develop`.
    {% include note.html content="Any branch you do not have on your local that exists on the remote can be created in this way." %}
    {% include important.html content="All release branches should be based on the develop branch." %}
