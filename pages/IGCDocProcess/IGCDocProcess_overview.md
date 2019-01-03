---
title: Overview
keywords: IGCDocProcess
summary: "This page is a general overview of the documenation process used when writing IGC online help."
sidebar: IGCDocProcess_sidebar
permalink: IGCDocProcess_overview.html
folder: IGCDocProcess
---
Process Overview
----------------

The following steps are an overview of the Git Bash process for updating
IGC™ Help. Refer to [Publish IGC™
Help](#test-defects-enhancements-and-new-features-in-the-customer-success-tenant)
and [Publish IGC™ Release Notes](#publish-igc-release-notes) for details
about how Help us updated and published under Git source control.

**IMPORTANT:** Always be aware of the branch you are working in when
using Git Bash. If you are working in a feature branch and you do not
commit **AND** push your changes to the online repository before you
switch branches in Git Bash you **will lose your work** in that branch.

Refer to the BackOffice Associates Documentation Process for
instructions on working in Github and Git Bash.

### Test Defects, Enhancements and New Features in the Customer Success Tenant

As part of the writing process and before you publish Help or release
notes, test each ticket in the Customer Success tenant to make sure that
it was implemented as written. If a feature is hidden by a feature flag,
request that the feature flag be updated so that you can review the
changes before it is Generally Available (GA).

Once the code for a ticket has been deployed and the ticket is moved to
a Done status in Jira, you can verify that the fix, feature, or
enhancement works as expected in the Customer Success tenant.

If the fix, feature, or enhancement does not work as expected in the
Customer Success tenant, or if at any time you find a bug or issue when
working in the IGC, report the issue in the igc-jit-triage Slack
channel. Use the igc-jit-triage-caps channel if you want to upload
supporting images to illustrate the issue or questions, and then copy
the link to the image into a thread in the in the igc-jit-triage
channel.
