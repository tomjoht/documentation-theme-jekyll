---
title: CS Shares Project
keywords: cs, shares, file, share
sidebar: helpatcs_sidebar
permalink: helpatcs_cs_shares.html
folder: helpatcs
---

## Project Overview

Project Proposal for a Shared Drive and Calendars

Creation Date: 05/01/2018

Proposal for: Department of Computer Science Proposal by: Computing Infrastructure Committee


## Executive Summary

Our department is staffed by highly skilled personal that have developed many innovative ways to leverage our given resources to retain and communicate necessary documentation. While the department was small, everyone could easily provide any necessary information to their peers and co-workers. This intercommunication was a strength of the department and provided an efficient search and retrieve facility. However, the ever increasing growth has restricted this tight network of peers and created a burden on those people who need to constantly dispatch their wealth of knowledge.

In order to reduce this burden, we propose a shared file storage and calendar(s) to streamline the management and distribution processes. From the user perspective, they would have a single location that contains all relevant departmental documentation. This would also include calendars that contain events relevant to their role in the organization. This infrastructure will leverage programatic access control to ensure these resources are available to authorized members of the department.

## Introduction

The Computing Infrastructure Committee was formed to identify strategic direction and deploy common-good services, network, compute, storage, and training that supplement the Office of Information Technology (OIT) for the current and future needs of the students, staff and faculty in computer science education, research, and administration.

## Problem Description and Background

It was brought to our attention though-out the process of on-boarding new hires that the procedures that detail the necessary steps were scattered between various people. This leads to a lengthy back and forth with various university staff that ultimately produced a hand-full of documents with the necessary details. These documents are being stored in an individuals’ email or cloud/local drive.

After the boarding process, there continues to be complications involving department calendar events. Tenure faculty, instructors, and staff all have events that must be communicated to all members in order to ensure that participants are aware of important dates. This is currently handled by new employees discovering the events and adding them to their calendar. Only new events after hire are communicated and even these often require a manual calendar entry.
Other process and procedural documents are also not readily available to people seeking to participate for the first time. From a new team member needing access to printers to long time employees discovering well established request processes, the information is no readily available. This slows the overall process and in some cases, makes the information inaccessible to those that need it.

While these issues are not new, our department has been small and close-knit that in turn allowed us to efficiently distribute documents and information without impeding our daily duties. As we have grown in student and faculty population, our ability to distribute this information has become strained and sluggish. In addition, the nature of the ad-hoc distributed storage leaves documents tied to individual storage that would not be accessible when employees move into different positions.

## Objectives / Goals

* Centralized storage for public, private and protected documents
* Shared Calendars for communicating communal events
* Automated addition and notification of users to Calendar(s) and Drive folders

## Scope
The scope of work is detailed below and is mostly simple point and click tasks. The bulk of the work will be happen in steps 2 and 6 where software will need to be written to connect our local LDAP replica with the Google Groups API to ensure that the proper membership lists are maintained.

1. Request a Google account (csdepartment) from OIT
2. Engage OIT to create Google Groups
3. Design & create a Google Drive initial folder layout
4. Identify & create Google Calendars as needed
5. Assign permissions using Google Groups to Drive & Calendar
6. Ensure LDAP and Google Group synchronization is running daily
7. Introduction to Department
8. Add additional Groups, Calendars, and Folders as needed

## Requirements

The initial steps will require existing Staff to request a Google account form OIT, setup the initial layout of Drive & Calendar(s), and create Google Groups. For this project to be successful, we will need access to existing personal that currently manage any information that is owned by the department and can reasonably be hosted in a central repository. This would likely happen in one or two meetings. The first would be used to understand the managed resources and how they should be shared. If the meeting leads to the discover of a new group that is needed to restrict access to document, the second meeting would be used to migrate the data into the new shared repository. Otherwise, the first meeting would be used to
orientate the new contributor and migrate files into the shared repository.

## Timeline

| Description of Work      | Start and End Dates |
| Phase One Google Account | Starting within 3 days of approval and completing in 10 days |
| Phase Two Google Groups  | Starting within 3 days of approval and completing in Summer 2018 |
| Phase Three Boarding users, documents, and calendars | Starting in Summer 2018 and completing in Fall 2018 |

## Project Budget

| Description of Work Budget | Expense |
| Phase One Google Account & Groups Creation | Included in overhead expense |
| Phase Two LDAP Sync w/ Google Groups  | Included in overhead expense |
| Phase Three Boarding users & documents | Included in overhead expense |
|  | Total $ 0.00 |

## Key Stakeholders / Personnel

Client Department of Computer Science
Sponsor Evan Chang
Project Manager Sangtae Ha
Team Timothy Coleman, Brett Shouse

## Monitoring and Evaluation

The project manager will monitor our progress and ensure that the proper steps are being taken to reach completion in our allocated timeframe. Our team will meet at our regularly scheduled Infrastructure Committee meeting, present our progress report, and evaluate the progress made.

## Risks of undertaking project
The technical aspects of this project are minor and unlikely to encounter failure. The biggest risk in this project is that of user adoption. Members of the department must be made aware of the shortcomings of the current methods and the value of this new shared repository. However, if department members are resistant, the success of the project will be limited by incomplete documentation and leave the process fractured and crippled.

## Success Criteria

* Google Drive & Calendar established 10 days after approval
* Automated synchronization of Google Groups by end of Summer 2017
* Document Migration by the end of Fall 2018
* Calendar(s) adoption by the end of Fall 2018


## Endorsements / Authorizations
Evan Chang, Associate Professor
Sangtae Ha, Assistant Professor
Timothy Coleman, Staff
Brett Shouse, Staff

## Next Steps

To formalize this proposal an approval from the Department of Computer Science must be received by the Computing Infrastructure committee.

## Issues

### Group / Drive Sync

When the membership of a Google Group is changed, the files/folders shared with that group are not automatically updated. It is necessary to re-share the files/folders with the group in order for the new members to have access.

2018/10/30: I will request that Google Drive API be enabled on the service account created by OIT when we meet.

**Google does not allow the organization to delegate limited power to users over a limited subset of data**

### Disallow Access

At the department meeting it was brought up that there are cases when a particular person or persons should be forbidden from seeing particular files/folders.


We have setup a department share on Google Drive and have a few use cases where we need to explicitly exclude a person from a share. For example, when doing promotion reviews the notes are shared with Tenured Faculty (Google) Group. However, if the target of the review is promoted, they are Tenured Faculty and have access to the review documents. So, we are looking for a way to share folders with The Tenured Faculty Group, and still exclude the target of the review contained in that folder.

**Google does not offer an option to restrict access to an individual or group**

### Colorado.edu API Access

Access to the API cannot be granted directly by the csdepartment@colorado.edu user and must be handled by the colorado.edu domain administrator.


2018/10/30: I have been in communication with OIT and we will be setting up a meeting this week to establish a service account with the necessary authorizations

2018/10/31: I met with Joel.Criger@colorado.edu and he confirmed that OIT will need to create the service account. He is unable to create the account and will be meeting with his manager Nov. 1st to see what can be done.

**Google does not allow the organization to delegate limited power to users over particular subsets of data**

*Follow up with Joel Criger to check on progress*
