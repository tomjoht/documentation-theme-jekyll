---
title: JIRA Workflow
keywords: IGCDocProcess
summary: "This page describes the JIRA workflow writers follow when writing IGC online help."
sidebar: IGCDocProcess_sidebar
permalink: IGCDocProcess_jiraWorkflow.html
folder: IGCDocProcess
---
JIRA Tickets Workflow for Documentation
=======================================

All work is tracked on the Kyber board.

The Documentation team produces documentation for new features and
enhancements and bug fixes. A Jira epic is opened for new features and
enhancements, A Technical Writer is assigned to the teams that are
developing these features and attends the weekly meetings.

Bug tickets are tracked on the Kyber board. Technical Writers document
bug tickets that affect how the user uses the project, and updates to
the UI.

For Documentation work that is not associated with a Dev (feature or
bug) ticket, open a DT ticket and track the work on the DocTeam ToDos
project. Add the IGC label to the tickets. You can add comments and "@
mention" SMEs and Tech Writers for reviews and peer reviews in the
ticket as needed.

![](media/image2.png){width="2.2291666666666665in"
height="1.924815179352581in"}

The Dev teams have Slack channels and weekly team status meetings where
tech writers can ask questions about features and get updates on pending
deployments. Requests for information regarding what teams are handling
which feature projects can be addressed to PM in the igc-help slack
channel. You must join the appropriate Slack channels and then you can
request to be added to the weekly meeting invitations in the appropriate
Slack channel.

Use the Documentation Status field to track progress on the tickets,

-   **Not Started** --- Default value. No work has been done on the
    ticket

-   **In Process** --- Technical writer researches and writes draft
    content and adds it to the ticket or a google doc.

-   **Review** ---PM/Dev is reviewing content

-   **Approved** --- Content has been approved by PM.\
    After UI is deployed, as announced in igc-releases Slack channel,
    author adds content to help and assigns to another TW for peer
    review.

-   **Peer Review** --- Technical Writer reviews content added to help

-   **Doc Done** --- Doc is complete. Documentation is published
    following the steps in Publish IGC™ Help And Publish IGC™ Release
    Notes

IGC™ QA Lead (Karen Dunson) @ mentions documentation team on Jira
tickets once the ticket has passed testing. Tickets are usually deployed
within 24 hours of passing testing. Some changes can be deployed as
"hidden" behind a feature flag. Refer to Feature Flags and Release
Darkly Process for more information. Feature Flags and Launch Darkly
Process

Launch Darkly allows Dev to release features and set a "flag" that hides
the feature from certain tenants. For example, feature can be visible
only on the PM tenant or the Customer Success tenants and hidden for all
other customer tenants. This allows developers to release feature to be
reviewed internally or only to certain clients for a first look.

The VP of Customer Success updates release darkly to make a feature
visible when all parties have signed off that a feature is ready to be
Generally Available (GA). This information is communicated in the
igc\_feature\_deploys channel.

When a ticket on the Kyber board reaches the Done swimlane, it is
deployed and the documentation for that ticket should be added to help
with the date the ticket moved to Done.
