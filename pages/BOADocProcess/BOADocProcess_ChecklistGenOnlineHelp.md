---
title: Checklist for Generating Online Help for Release
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "This page includes a checklist for generating the DSP Online Help."
permalink: BOADocProcess_ChecklistGenOnlineHelp.html
folder: BOADocProcess
---

The checks in the following sections are completed prior to a product release and after all approved content has been added to the Help project.

## Review Flare Reports, Master Page Assignment and Alias File Identifiers

Complete the following tasks in Flare prior to generating Help for a
product release.

1.  On the **View** tab, from the **Project Analysis** drop-down select **Broken Bookmarks**, and resolve any bookmark issues. Then select **Broken Links** and resolve any hyperlink issues.
    <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> The popup topics and the What's New topics for previous releases are always going to be on the report but do not need to be added to the TOC. </div>
    <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> The report engine topics are being researched in DSP-4753 and are not an issue when generating the Help.</div>
2. To verify that all topics have the correct Master Page applied, do the following:
 * On the **View** tab, in the **Explorer** group, select **File List**.
4. To verify there are no unassigned identifiers in the alias file, do the following:
 * Open the **Project Organizer** pod.
 * In the **Advanced** folder, open the alias file.
 * If a warning message displays, navigate to the issue in the alias file and resolve it.
<div markdown="span" class="alert alert-success" role="alert"><i class="fa fa-check-square-o"></i> <b>Tip:</b> The home.htm topic must be set as the opening page for each target.</div>

## Check for Unlinked Topics in the TOC
Use the filter in the TOC pane to confirm there are no unlinked topics.
Unlinked books are fine.

{% include image.html file="unlinkedTopicsTOC.png" alt="Flare unlinked topics icon" caption="Unlinked topics icon in Flare" %}

## Review the Generated Help System

Once Help is generated for a release, complete the following checks in
the online Help system.

1.  Review the Table of Contents for Full and Solex versions to ensure each has the proper content. Refer to [Use Condition Tags][BOADocProcess_UpdateOnlineHelp.html#usecondtags] for information about the content that should display for each version.
2. Review the What's New topic to verify:
   * The topic has the correct version
   * The TopNav target must have the updated What's New topic attached
   * All of the links work
   * Topic is free of formatting and grammar issues
3. Open the Overview topic for each component and verify:
   * The correct component header button displays
   * The correct footer for the component displays
   * The footer has the correct version
   * The copyright year is the current year

{% include links.html %}
