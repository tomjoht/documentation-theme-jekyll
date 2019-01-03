---
title: Publish IGC Release Notes
keywords: IGCDocProcess
summary: "This page describes the process the doc team uses to publish IGC release notes."
sidebar: IGCDocProcess_sidebar
permalink: IGCDocProcess_publishRN.html
folder: IGCDocProcess
---
Publish IGC™ Release Notes
--------------------------

IGC™ Release notes are published when a ticket on the Kyber board that
requires documentation moves to the Done status, indicating it has been
deployed.

To publish IGC™ release notes:

1.  2.  3.  4.  5.  Only include tickets that are in Done status in the
    release notes. Open the ticket details for each ticket listed for a
    release. Tickets with a status of Rejected, Won't Do, Duplicate,
    etc. do not need to be included in the release notes.

6.  Copy and paste the release notes from on the release notes page into
    a Google Doc for tickets that have a status of Done. You can use a
    [previous week's Google Doc as a
    template](https://docs.google.com/document/d/1UUm-Rxcl1xXuYypBTa2RYpho9Bn27LptO0vS-_2ET74/edit?usp=sharing).

7.  Determine the type of release note. Currently there are three
    categories for release notes for IGC™. The ticket type is not always
    reliable to determine under which heading a note needs to be placed.
    So, review each ticket and determine which of the following headings
    it is listed under in the release notes. Task and Defect tickets are
    generally listed under Bug Fixes and Stories are typically, but not
    always, listed under Enhancements or New Releases.

-   Enhancement - Improves or adds functionality to an existing feature

-   Bug Fix - Fixes a problem in the software

-   New Feature - New option or feature of the product that had not
    existed before

8.  Review and rewrite each note as needed. Review the ticket for
    additional information to help with the rewrite as needed. For
    example, Bug Fixes generally start with "Fixed an issue where.... "
    "Fixed an issue that caused a problem with ...." Try to simplify the
    note and keep to one sentence if possible.

9.  10. Send email/slack message to Doc Team to check out IGC™ Help.

11. [Synchronize your local repo's develop branch with the remote
    develop branch](#_Synchronize_your_local)

12. Open the Flare project and update the IGC™ Releases topic. Insert a
    row into the table for each date that had a release and paste the
    notes from the approved content in the Google doc into the table.

> **NOTE:** The date in the table is the date of the release as shown in
> Jira (see the Released date in the previous screen shot), not the date
> the note was published.
>
> ![](media/image13.png){width="6.174663167104112in"
> height="3.254861111111111in"}

13. [Commit updates locally and push to
    remote](#commit-updates-locally-and-push-to-remote).

14. [Peer Review updates -- no changes
    necessary](#peer-review-updates-no-changes-necessary)

15. [Peer Review updates -- changes
    necessary](#peer-review-updates-changes-necessary)

### Adding Hyperlinks to Help topics from Release Notes

Because the release notes and IGC™ Help system are two different Help
systems each with its own URL, when you create a "Refer to" hyperlink in
the release notes you must create it as a link to an external website.

To include a hyperlink to a Help topic in the release notes:

1.  Highlight the text to link.

2.  Select Insert \> Hyperlink from the menu.

3.  In the Link to: drop-down select Website.

4.  Enter the IGC Help URL (<https://general.igchelp.com/>) and then the
    file name of the topic you are linking to.

5.  In the Target Frame drop-down, select New Window/Tab.

![](media/image14.png){width="6.5in" height="3.438888888888889in"}

**NOTE:** Always use the general.igchelp.com/ link and never the
[dev.general.igchelp.com/](http://dev.general.igchelp.com/) link because
the dev link is for internal checks and peer reviews only. End users do
not access this link. You can verify that links from the IGC Release
notes work correctly by accessing them from the Customer Success tenant.

### Update Release Notes Side Menu

Create new topic each month to add to the side menu for release notes.

![](media/image15.png){width="4.195973315835521in"
height="2.4350984251968506in"}

To add a new month to the side menu:

1.  Copy the current month release note topic (IGC Releases.htm).

2.  Rename the copy following the naming convention of the other
    previous month's topics. For example, IGC Releases0518.htm.

3.  In the new topic's properties, apply the WhatsNew Master page
    **and** Condition tag to the new topic.

4.  Drag and drop the file to appropriate place in the the
    **WhatsNewMenu TOC.**

> ![](media/image16.png){width="4.524538495188102in"
> height="1.7585761154855644in"}

5.  Open the Properties dialog for the new TOC entry.

6.  Update the Label to the name of the month.

7.  Click **OK**.

8.  Update the table in IGC Releases.htm topic to start a new month.
