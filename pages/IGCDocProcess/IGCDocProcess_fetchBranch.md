---
title: Fetch a Branch
keywords: IGCDocProcess
summary: "This page describes the process the doc team uses to connect to the IGC UI repo to fetch a branch."
sidebar: IGCDocProcess_sidebar
permalink: IGCDocProcess_fetchBranch.html
folder: IGCDocProcess
---
Connect to the Repo to Fetch a Branch
-------------------------------------

Follow these steps to view the changes in a PR, allowing you to view
features as they are in development.

1.  Open a terminal window in Docker Quickstart Terminal. The container
    will not build with GitBash.

> **NOTE:** If the Docker Quickstart Terminal displays the error below,
> you need to disable Hyper-V.
>
> ![](media/image17.png){width="5.0in" height="2.6354166666666665in"}
>
> To disable Hyper-V:

a.  Go to **Turn Windows features on or off.**

b.  Click the **Hyper-V** check box to uncheck it.

c.  Restart your machine.

<!-- -->

2.  Access the directory where you cloned the repo. You may need to type
    in the full filepath ( cd /c/Users/\<yourname\>/igc-ui).\
    **NOTE:** This directory must have a folder with a .git extension.

3.  To access a pull request, run git pull upstream and then run git
    checkout pr/\<\#\>

4.  To access a forked branch, run git fetch \<developer's fork name\>
    and then run git checkout \<branch name\>

5.  Run make ninja

6.  Go make some tea; this is going to take a long while.

Now you should have a running local copy of the UI. If it built
successfully, you should see as one of the last lines in the terminal
window "**Navigate to http://localhost:8080 in your favorite browser -
if you\'re on Windows and using the docker quickstart terminal, the IP
address was cited on starting the terminal, and was likely
192.168.99.100." [THAT IP ADDRESS WILL NOT WORK IF:]{.underline}**

-   You don't specify the port. It should be: **192.168.99.100:8080**

-   You don't have IIS enabled on your machine. [How to enable
    IIS]{.underline}

-   You have a personal firewall.

-   -   Your LAN settings are not automatically detecting IP addresses
    or are using a proxy server. [How to fix LAN settings]{.underline}

Stop the container when you are done. To do this:

-   Ctrl+c to disconnect your terminal from the process

-   Run make stop
