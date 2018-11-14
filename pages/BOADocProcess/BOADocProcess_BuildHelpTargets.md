---
title: Build Help Targets
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "This page explains the Flare targets and how to build a new version of the help after making updates."
permalink: BOADocProcess_BuildHelpTargets.html
folder: BOADocProcess
---
## Help Versions
There are two versions of help:

-   Solex
-   Full

The Help target for Solex excludes content with these condition tags applied:

-   dspConduct
-   IG Universal Connect

Help target for the full version excludes content with these condition tags applied:

-   ISA

## Generate a Target
To generate a target:
1.  In the Project Organizer pane, open the **Targets** folder.
2. Open the appropriate target:
-   HTML5 Solex - for Solex help
-   HTML5 Full (Primary) -- for Full help
3. On the General tab, make sure the Startup Topic field has the Home page selected and the Output File is index.
4. Click **Build**.
5. Review the Build log to determine if any errors need to be resolved.

## View the Build Log
To view the Build log:
1.  Open the **Builds** window.
2.  Right-click a completed build and select **View Build Log**.
3.  Click the **Warnings** tab and the Errors tab to review messages.
4.  Resolve all errors. Resolve warnings except for the "Topic excluded from output" warnings, which are normal.

Complete the steps for each target, as needed.

The date and time help was built displays at the bottom of the What's New topic.

## Remove Draft Attachments from JIRA Tickets

As part of closing the ticket, if multiple attachments have been added to the ticket, remove all attachments except the Final published version.

**NOTE**: Attachments added by other users cannot be deleted.

Deleting attachments in JIRA saves space and makes the final approved copy of documents easy to find.
