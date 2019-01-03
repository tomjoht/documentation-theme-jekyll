---
title: Prerequisites
keywords: IGCDocProcess
summary: "This page describes the prerequisites to running the IGC UI locally on Windows."
sidebar: IGCDocProcess_sidebar
permalink: IGCDocProcess_prereqs.html
folder: IGCDocProcess
---
Run the IGC UI locally on Windows
=================================

To run the IGC UI locally, you must be running Windows 10.

Prerequisites
-------------

Before you can access the repository, the following steps must be
performed.

1.  Install Docker Toolbox. Docker for Windows does not work for the
    DocTeam environment.
    [https://docs.docker.com/toolbox/toolbox\_install\_windows/]{.underline}

> **NOTE:** You must have a minimum of 8GB of memory to run Docker
> Toolbox.

2.  Install make
    [http://gnuwin32.sourceforge.net/packages/make.htm]{.underline}

3.  Make an Environment PATH for make.

    -   Go to **View advanced system settings** in the Control panel.

    -   Click **Environment Variables...**

    -   Click **New** to add an environment PATH for make
        (C:\\ProgramFiles\\GnuWin32(x86)\\bin)

4.  Create a local directory to work from. You can create the folder in
    Windows File Explorer or using command line prompts. The name should
    be relevant and easy to type.
