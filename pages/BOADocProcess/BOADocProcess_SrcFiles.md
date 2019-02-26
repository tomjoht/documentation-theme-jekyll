---
title: Source Files for Manuals and Online Help
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
toc: false
permalink: BOADocProcess_SrcFiles.html
folder: BOADocProcess
---

The following source files are used to create images and tables in online Help and Manuals. The files are stored on OneDrive in the **Product Documentation/Source Files for Manuals** folder.

To update the files, make a copy and add the version number on the end. Then update the files and Manual and have the changes reviewed and approved by the person that requested the change.

-   Disk Layout charts\_Full.pptx
-   Disk Layout charts\_Full.pptx

The following Visio diagram is used to create images in the Flare topic "Add Data-Driven Dependency Conditions to a Category."
-   dspConduct Dependencies.vsd

# Check Latest Build for Changes
Tickets may describe a change that you need to see in the DSP in order to get a full understanding. 

{% include note.html content="If the ticket is merged during the day before about 6:30 pm, the ticket’s changes will be available via the next day’s BuildDeployTest link." %}

## Prerequisites

Before checking the latest build, you must perform these steps once to set up your jenkins account and join the correct Slack channel:

1. Contact Matt Moore to obtain Jenkins login credentials. 
2. Log in to [Jenkins] (https://jenkins.boaqe.com). 
**NOTE:** Refer to Jenkin’s [online resources] (https://jenkins.io/doc/pipeline/tour/getting-started/) to learn more. 
3. Add yourself to the Slack channel for the latest development cycle. For example, the Slack channel for DSP 7.0.4 is #704dev.
**NOTE:** When Jenkins runs the QE tests, results are posted to this channel.

## To check the latest build for changes:
1. Navigate to the dev channel in Slack. 
**NOTE:** Refer to [Prerequisites] (#prerequisites) on how to gain access to the dev channel in Slack. 

!(git/process-standards/process-standards/images/CheckBuild1.png)
