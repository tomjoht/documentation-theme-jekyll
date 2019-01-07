---
title: MadCap Flare Licensing and Upgrade Process
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "This page describes the process the doc team uses to upgrade to a new version of Flare, making sure the new code does not break any of our styles or formats."
permalink: BOADocProcess_FlareLicenseUpgradeProcess.html
folder: BOADocProcess
---

{% include important.html content="The Documentation Team uses Madcap Flare to generate the online Help for the DSP® and IGC™ products. Contact the Technical Writer Manager for the Flare license key to install or upgrade the software and the maintenance key to use to report problems with the Flare software." %}

When upgrading the software, the Technical Writer Manager assigns one
writer to upgrade and test the upgrade for Flare. The writer who tests
the upgrade performs the following checks:

-   Build each Target (including the Word target) in each Flare project to make sure there are no build errors.
    {% include note.html content="If there are build errors export the build log and report the issue to Flare support." %}
-   Check the output to make sure that the master pages are applied correctly.
-   Click on all clickable items and verify they work as expected (for example the arrow drop down menu next to the logo in the header).
-   Verify that the feedback link in the topic footer works.
-   Make sure the print and Remove Highlights icons in the Help toolbar work.

For the DSP Help project if everything checks out, commit a build to source control and make sure that the Context Sensitive Help is working as expected in a test DSP environment.

Once the build is confirmed working in the DSP test environment, notify the Documentation Team that they can upgrade.

Inform the team maintaining the build server that the version of Flare that builds the online help needs to be upgraded to the new version of Flare. (As of 110718 this is Cory) If necessary, ask that the paste versions of help be regenerated manually (as of 1/0718 this is Aleks). 
