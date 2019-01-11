---
title: Update Flare Project for a New DSP Version
keywords: BOADocProcess
summary: "Steps to update the Flare project when we are preparing help for a new DSP version. "
sidebar: BOADocProcess_sidebar
permalink: BOADocProcess_UpdateFlareProjectNewVersion.html
folder: BOADocProcess
---

When starting work on a new version of DSP help:

* Add a "What's New in \[New Version Number\] topic
* Update the link in the TopNav TOC to point to this new version, and update the version number in the TOC
* Delete the body text in the What's New topic, and add links to the Previous Versions section at the bottom for the last version's What's New topic
* Update the Version Variable.
* Update the Previous Versions links markup (`<p MadCap:conditions="Primary.dspConduct"><a href="https://dsphelp.boaweb.com/JUSTRELEASEDVERSIONNUMBER/general/[%=System.SourceFile%]">See this topic in Version JUSTRELEASEDVERSIONNUMBER</a></p\>`) in the Master Pages for all topics with the new version number in the 
  * href url - `https://dsphelp.boaweb.com/JUSTRELEASEDVERSIONNUMBER/general/[%=System.SourceFile%]`
  * the link text - `See this topic in Version JUSTRELEASEDVERSIONNUMBER`
  * Ex. `<p MadCap:conditions="Primary.ISA"><a href="https://dsphelp.boaweb.com/701/solex/[%=System.SourceFile%]">See this topic in Version 7.0.1</a></p>`
  * Put is below the body proxy (`<MadCap:topicToolbarProxy style="mc-topic-toolbar-items: Print RemoveHighlight;" /><MadCap:bodyProxy />`) and above the feedbacksurvey (`<div id="feedback-survey">`).
  * Do not add this markup to the HomePage or Search Results Master pages.
  * Update the other branches (develop\_70, develop\_701 etc) to include a link to the just released version, so that all topics will have links to other available versions. Ensure there is a link to the solex and the general help for each version and that the CTs are applied correctly.
  * Here is an example of links in the 7.0.1 version.
    {% include image.html file="prevVersionLinks.png" alt="Previous Version Links in 7.0.1" caption="Previous Version Links in 7.0.1" %}
