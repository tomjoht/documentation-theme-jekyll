---
title: Checklist for DSP Documentation Workflow
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "This page includes a simplified checklist of the documentation team workflow."
permalink: BOADocProcess_CLDSPWorkflow.html
folder: BOADocProcess
---

## For Your Work

* Start looking at ticket as soon as it's assigned.
* Start writing as soon as ticket has made it past Story Review.
* Change the **Documentation Status** field to **In Process**.
* Open Git Bash and get to work!
* cd dsp-docs
* git checkout origin \<release branch name\>
* git pull origin \<release branch name\>
* git checkout -b \<new personal branch name\>
* Open up Flare and get to work!
* Check for spelling and grammar errors.
* Check that everything is written according to our standards.
* Test the links.
* Add appropriate Condition Tags.
* Add GUID's to alias for new pages in the DSP (mostly Field Descriptions topics).
* Save and close the project.
* Open Git Bash in dsp-docs folder
* git status
* git add .
* git commit -m "\<description of what you changed and where without any special characters\>"
* git push origin \<personal branch name\>
* Create pull request
* Assign reviewer and write them a descriptive message of what to review.
* Check the base branch is the current release branch you are working in and compare is your new branch name.
* Add PR link to JIRA tickets.
* Update Doc Status to Peer Review.
* Wait for reviewer to merge the PR.
* Update the Doc Status to Review and wait for the PM.
* Once it's PM reviewed and approved, then you can change the status to Doc Done.
* Once it's merged then you can delete the local branch.

## For Peer Reviewing

* Receive pull request.
* See author of PR and the name of the branch they committed to the PR.
* Open Git Bash.
* cd dsp-docs
* git pull origin \<release branch\>
* git fetch origin \<writer's branch name\>
* git checkout \<writer's branch name\>
* Open Flare and get to work!
* Review content for clarity.
* Test the steps.
* Check for spelling and grammar errors.
* Check that everything is written according to our standards.
* Test the links.
* If missing, add appropriate Condition Tags.
* If missing, add GUID's to alias for new pages in the DSP (mostly Field Descriptions topics)
* Check to make sure the TOC label has been updated and is not a system variable.
   <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> If the TOC title text is blue it is connected to a variable and needs to be updated.</div>
* Save and close the project.
* git status
   <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> This step is only necessary, if you have made an update during the peer review.</div>
* git add .
   <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> This step is only necessary, if you have made an update during the peer review.</div>
* git commit -m "\<description of what you changed and where without any special characters\>"
  <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> This step is only necessary, if you have made an update during the peer review.</div>
* git push origin < writer's branch name >
  <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> This step is only necessary, if you have made an update during the peer review.</div>
* Merge PR.
* Confirm merge.
* Delete that branch in github and locally so things don't get cluttered.
