---
title: Update Flare Project for a New DSP Version
keywords: BOADocProcess
summary: "Steps to update the Flare project when we are preparing help for a new DSP version. "
sidebar: BOADocProcess_sidebar
permalink: BOADocProcess_UpdateFlareProjectNewVersion.html
folder: BOADocProcess---
subtitle: |
    []{#_gjdgxs .anchor}BackOffice Associates® Solutions DSP Documentation
    Process
---




When starting work on a new version of DSP help:

-   Add a "What's New in \[New Version Number} topic

-   Update the link in the TopNav TOC to point to this new version, and
    update the version number in the TOC

![](media/image105.png){width="6.5in" height="3.842361111111111in"}

-   Delete the body text in the What's New topic, and add links to the
    Previous Versions section at the bottom for the last version's
    What's New topic

![](media/image106.png){width="6.5in" height="3.842361111111111in"}

-   Update the Version Variable:

-   Update the Previous Versions links in the Mater Pages for all
    topics.

Add this code:

\<p MadCap:conditions=\"Primary.dspConduct\"\>\<a
href=\"https://dsphelp.boaweb.com/JUSTRELEASEDVERSIONNUMBER/general/\[%=System.SourceFile%\]\"\>See
this topic in Version JUSTRELEASEDVERSIONNUMBER\</a\>

\</p\>

As in:

\<p MadCap:conditions=\"Primary.ISA\"\>\<a
href=\"https://dsphelp.boaweb.com/701/solex/\[%=System.SourceFile%\]\"\>See
this topic in Version 7.0.1\</a\>

\</p\>

Put is below the body proxy and above the feedbacksurvey.

.

![](media/image107.png){width="6.5in" height="3.842361111111111in"}

Do not add this code to the HomePage or Search Results Master pages.

Update the other branches (develop\_70, develop\_701 etc) to include a
link to the just released version, so that all topics will have links to
other available versions. Ensure there is a link to the solex and the
general help for each version and that the CTs are applied correctly.

Here is an example of links in the 7.0.1 version.

![](media/image108.png){width="6.5in" height="3.842361111111111in"}
