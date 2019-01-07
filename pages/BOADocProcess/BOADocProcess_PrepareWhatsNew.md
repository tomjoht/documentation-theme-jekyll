---
title: Prepare What's New Topic/Release Notes Content
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "This page describes the process for updating the Release Notes, or What's New topic for each release."
permalink: BOADocProcess_PrepareWhatsNew.html
folder: BOADocProcess
---
## Prepare What's New Topic/Release Notes Content

The release notes are based on the content in the What's New topic in help.

Throughout this section, these standards apply to both documents, except in the case of topic references.

In the release notes, add "in the online help" to references. For example, in the What's New topic: "Refer to Add a Request for more information." In the release notes: "Refer to Add a Request in the online help for more information."

Content is organized into four sections.

-   New Features
-   Enhancements
-   Resolved Issues
-   Enhancement Requests from Users

## Structure of Release Notes

The release notes are prepared for the full and solex versions of online help. The structure is based on the version of the release (SAP Accelerators or BackOffice Associates Solutions).

Each section (New Features, Enhancements, etc.) is divided into subsections based on product name and component.

### Product names and their components for the SAP Accelerators version

**Advanced Data Migration (ADM)**

{% include note.html content="This content is identical to the dspMigrate™ section in the BackOffice Associates Solutions version. Condition Tags (CTs) are applied to the Advanced Data Migration (ADM) heading and the dspMigrate heading so the correct one displays for each version (as in, the ADM
heading has the ISA CT applied and the dspMigrate has the dspConduct CT
applied)." %}

This section includes:
-   Console
-   Target Design
-   Construct
-   Map
-   Transform
-   SQL AutoGen
-   Data Services AutoGen

**Information Steward Accelerator**
-   ISA
-   dspCompose™

**Data Stewardship Platform (DSP**™**)**
-   Assemble
-   Collect
-   Common
-   dspTrack™
-   Integrate
-   Online Help
-   System Administration

### Product Names and their components for the BackOffice Associates Solutions version

**dspMigrate™**

{% include note.html content="This content is identical to the ADM section in the SAP Accelerators version. CTs are applied to these headings so the correct
one displays for each version." %}

This section includes:
-   Console
-   Target Design
-   Construct
-   Map
-   Transform
-   SQL AutoGen
-   Data Services AutoGen

{% include note.html content="The following are stand-alone components (as in, they are not a subsection of a product name)." %}

dspCompose™

dspMonitor™

dspConduct™

**Data Stewardship Platform (DSP**™**) is included in both versions**
-   Assemble
-   Collect
-   Common
-   dspTrack™
-   Integrate
-   Online Help
-   System Administration

Additionally, any updates to the WebApp Development topics must be noted in the Sys Admin What's New/Release notes.

### New Features

This section describes major features that are introduced with the version such as a new WebApp, or a feature in an existing WebApp that has not been available before. These may be described in JIRA with an issue type of Story or Epic.

If a component has multiple new features, use a bulleted list. If there is only one new feature, do not use a bulleted list.

Each new feature contains a link to the help topic(s) that describe it.

### Enhancements

This section contains minor updates (often described in a JIRA issue type of Story).

If a component has multiple enhancements, use a bulleted list. If there
is only one enhancement, do not use a bulleted list.

Each new enhancement contains a link to the help topic(s) that describe it.

### Resolved Issues

This section describes resolutions to customer issues.

{% include note.html content="QA Bugs that were introduced with the current (not yet released) version are not included in the Resolved Issues section." %}

Resolved issues are described in JIRA issues that match one or more of the following:

-   Have an issue type of Support Issue
-   Were entered by the support team (Patty Conrad, Ben Bauer, Kevin Robinder)
-   Contain links to a Zendesk customer ticket
-   Mention a customer in the comments
-   Were entered by PM as an internally reported Bug.

Each issue description contains this information:

-   The nature of the issue, in other words, what was broken.
-   What was done to fix it, if the fix is visible to the user. Back end updates, such as those related to stored procedures, tables, or views are not included.
- How the product functions with the fix
- At the end of the description add a reference to the JIRA issue number enclosed in brackets for example, \[DSP-1234\]

### Enhancement Requests Users

Enhancement Requests from Users are described in JIRA issues that:
-   Have the label DSP Enhancement Request
-   Have the label IdeasPortal
-   Are the result of online help feedback

Each Enhancement Request contains a link to the help topic(s) that describe it.

### Review of Release Notes

When content is complete, the release notes are reviewed by Mike, Tyler and the Product Manager. Two weeks before the help is due, send the release notes to PM to review to confirm that all content has been included and is correct. PM must approve the release notes at least one week prior to the deadline.

### Compare Content in Word (What's New topic v. Release Notes)

The Release Notes document and the What's New topic in the help are updated frequently during final review prior to help delivery. Compare the content to ensure that it is identical, if needed.

The results of a compare can show discrepancies that are easy to miss with a side-by-side review.

{% include note.html content="The 'Refer to . . . ' references are different. In the Release Notes, they include 'in the online help.'" %}

To compare Release Notes and What's New content after significant updates:

1.  Save the Release Notes document with " \_compare" appended to the file name.

2. Generate a Word document from Flare with the What's New topic (select the appropriate Condition Build Expression)

3. In both documents, delete the cover page, toc, and introduction section. Also delete the headings. (You just need the text to compare). Save the changes.

4. Open one of the documents in Word. (It does not matter which one)

5. On the **Review** tab, click **Compare** and select **Compare two versions of a document**.

6. In the **Compare Documents** window, browse to and select your **Original** and **Revised** documents. (Release notes can be the original or the What's New; it does not matter).

7. Click **More**, and then select/deselect the options as needed to match what is shown in the following screen shot:

8. Click **OK**.

9. Save the resulting Word document.
