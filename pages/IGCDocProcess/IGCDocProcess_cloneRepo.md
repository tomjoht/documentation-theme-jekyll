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

1.  In the BackOfficeAssoc/igc-help repo, click the **Clone or
    download** button. Once you click it, it will reveal a URL that you
    need to copy and paste into your command line in the next step.
    Click the copy to clipboard button to the right of the url to copy
    it.

> **NOTE:** There are various options for cloning. We will be doing the
> clone from the command line, so copy the SSH URL shown.

2.  Open Git Bash and navigate to the directory that you wish to
    download to.

> **NOTE:** The repository will be cloned into a new directory below the
> one you specify, with the same name as the repository, ex.
> C:\\heathercloward\\Documents\\GitHub\\igc-help.
>
> **NOTE:** In Windows Explorer, you can right-click in a folder and
> select **Git Bash Here** from the dropdown menu to open the command
> prompt at that location.
>
> ![https://lh6.googleusercontent.com/0L9wYyiqO5FW0tsqh7QHpJeE9TQHmuE7e14wul6BuN3HFg3Ven92HubMIjBcku7BE2Hb5FWjXai-Vc4Q5qSfcmdKcOwHycFHFoZZzMJT12MWEK4-RmUrlUKSzLjRV9eSDV8l1JS0](media/image6.png){width="2.0625in"
> height="4.0in"}

3.  Enter the git clone command using the SSH URL from step 1.

> **NOTE:** Example: git clone
> git\@github.com:BackOfficeAssoc/igc-help.git

4.  Switch into your new directory by entering the git command cd
    igc-help

> **NOTE:** You will know you are in the correct directory by the
> command prompt, ex. Documents/GitHub/igc-help (master) - shows repo
> name and branch name.

5.  Fetch the develop branch so that you have it in your local repo by
    entering the git command git fetch origin develop.
