---
title: Fetch a Branch
keywords: IGCDocProcess
summary: "This page describes the process the doc team uses to connect to the IGC UI repo to fetch a branch."
sidebar: IGCDocProcess_sidebar
permalink: IGCDocProcess_fetchBranch.html
folder: IGCDocProcess
---

Follow these steps to view the changes in a PR, allowing you to view features as they are in development.

1.  Open a terminal window in Docker Quickstart Terminal. The container will not build with GitBash.
    {% include note.html content="If the Docker Quickstart Terminal displays the error below, you need to disable Hyper-V." %}
    {% include image.html file="disableHyperV.png" alt="Docker Quickstart Terminal error indicating you need to disable Hyper-V" caption="Docker Quickstart Terminal error indicating you need to disable Hyper-V" %}

    To disable Hyper-V:
    1. Go to **Turn Windows features on or off.**
    2. Click the **Hyper-V** check box to uncheck it.
    3. Restart your machine.

2.  Access the directory where you cloned the repo. You may need to type in the full filepath (`cd /c/Users/<yourname>/igc-ui`).
    {% include note.html content="This directory must have a folder with a .git extension." %}

3.  To access a pull request, run the git command `git pull upstream` and then run `git checkout pr/<#>`

4.  To access a forked branch, run the git command `git fetch <developer's fork name>` and then run `git checkout <branch name>`

5.  Run command `make ninja`.

6.  Go make some tea; this is going to take a long while.
    {% include note.html content="Now you should have a running local copy of the UI. If it built successfully, you should see as one of the last lines in the terminal window **'Navigate to http://localhost:8080 in your favorite browser - if you're on Windows and using the docker quickstart terminal, the IP address was cited on starting the terminal, and was likely 192.168.99.100.'**" %}

    The listed IP address will not work if: 
    * You don't specify the port. It should be: **192.168.99.100:8080**
    * You don't have IIS enabled on your machine. [How to enable IIS](https://www.howtogeek.com/112455/how-to-install-iis-8-on-windows-8/)
    * You have a personal firewall.
    * Your LAN settings are not automatically detecting IP addresses or are using a proxy server. [How to fix LAN settings](https://www.youtube.com/watch?v=8P9mZNIf414)

7. Stop the container when you are done.
   To do this:
   1. `Ctrl+c` to disconnect your terminal from the process
   2. Run `make stop`.