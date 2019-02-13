---
title: Install Manual Process
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "The following steps describe the collaboration, review, approval and
final formatting process to get the Installation Manuals ready for
publishing for each software release."
permalink: BOADocProcess_InstallManualProcess.html
folder: BOADocProcess
---

{% include important.html content="The master branch must be updated with the latest changes at the close of each release, and a new Staging branch must be created at the beginning of every release cycle from the master branch by the Tech Writer who is handling the manuals that release cycle. Sometimes customers need manuals specific to the version of DSP that they are running, so the Staging branches must not be updated or deleted once they have been merged into the master branch." %}

## The Install Manual Process
### Manuals to Update
The following Installation Manuals are updated for each release _if there are changes to be made._
* BackOffice Associates Solutions Installation and Upgrade Manual
* BackOffice Associates Solutions Software Requirements and Hardware Sizing Guide
* SAP Accelerators by BackOffice Associates Implementation Quick Start Guide
* SAP Accelerators by BackOffice Associates Installation and Upgrade Manual
* SAP Accelerators by BackOffice Associates Operations Guide
* SAP Accelerators by BackOffice Associates Software Requirements and Hardware Sizing Guide
 
For instructions on updating Release Notes, refer to [Prepare What's New topic/Release Notes.] (#repare-what-’-s-new-topic-/-release-notes-content).

### Source of Content
Changes to the Installation Manuals are tracked in jira. Source of changes include:
* Other Jira tickets
* Slack 
* Chris Alberts
Pay attention to conversations and tickets to pick up on what needs to change in the Installation Manuals. It may be helpful to create the Jira ticket at the start of the release schedule as a location to store installation manual changes. 

### Organization of the InstallManuals Flare Project
The project is organized by manual. Several sections are used across multiple manuals, with conditional tags applied. 
The Version History topic (located towards the bottom of the Content Explorer, beneath all the folders) is updated in one location and used across all manuals with the most recent entry at the top.

### Update the Installation Manuals
The following steps describe the collaboration, review, approval and final formatting process to get the Installation Manuals ready for publish for each software release. 

Members of the Documentation Team rotate, taking turns to be in charge of updating the Installation Manuals for each release. 


Follow these steps to update the install manuals:
1. [The Tech Writer synchronizes her local master branch with the BackOfficeAssoc dsp-install-manuals master branch](#synchronize-your-master-branch-with-the-backofficeassoc-github-repo).
   {% include note.html content="If you do not have a local copy of the install manuals on your laptop, see [Clone the dsp-install-manuals repo](#clone-the-dsp-install-manuals-repo)." %}
2. [The TW creates a new Staging branch based on the Master branch in the dsp-install-manuals repo](#create-a-branch-for-your-updates-based-on-the-master-branch).
3. [The TW creates a release folder in OneDrive for the current release, copies the current Word files of the manuals into the new release folder, and updates the file titles](#create-a-release-folder-on-onedrive).
   {% include note.html content="The TW will include a link to this folder in the next step when they create the JIRA epic/subtasks." %}
4. [The TW creates a Jira epic for updating the manuals for this release](#create-a-jira-epic-for-the-release).
5. [The TW adds subtasks for each manual that will require updates to the release epic to track the updates](#add-subtasks-for-manuals-in-jira-epic).
5. The TW and contributors review and update the manuals in OneDrive and Flare as needed.
6.  Once the collaboration is complete and the content is final, the approver sets the **Documentation Status** field to of the installation manual epic Jira issue to **Approved**.
7.  [The TW makes the required changes in Flare and updates the **Appendix A -- Version History** section to reflect the updates made to the current version](#make-updates-in-flare).
8.  The TW sets the **Documentation Status** field of the installation manual epic Jira issue to **Peer Review** and requests a peer review from another tech writer on the team.
    {% include note.html content="See the 'Open a pull request for a peer reviewer to review your work' section of the [DSP Documentation Workflow][BOADocProcess_DSPDocWorkflow] page for more information on this process. The process for the Install Manuals is identical, except that for the install manuals the **base** branch will be the **master** branch and the **compare** branch will be the **staging** branch you are making your updates on." %}
9.  The Peer reviewer makes any necessary edits in Flare and merges the Staging branch with the Master branch.
    {% include note.html content="The reviewing tech writer does not need to review content, because collaborators must address and approve all content changes during the collaboration step." %}
    {% include note.html content="See the 'Peer Review: Peer Reviews Content in Flare' section of the [DSP Documentation Workflow][BOADocProcess_DSPDocWorkflow] page for more information on the peer review process. The process for the Install Manuals is identical, except that the content from the Staging branches should be merged with the Master branch not the develop branch." %}
10.  After the Staging branch is merged, the Tech Writer who owns the manuals for the release [updates the targets for the manuals](update-the-targets-for the-manuals), generates new Word versions and the [secured pdfs][BOADocProcess_DevManConfigGuides.html#securitysettings], saves them to the release folder, sends notification that the final manuals are ready to Support, and then closes the Jira ticket.

### Clone the dsp-install-manuals repo

To clone the dsp-install-manuals repo, follow the instructions for [cloning the dsp-docs repo][BOADocProcess_GitInitSetup], but all Staging branches should be based on the **Master** branch from this repo.

### Synchronize your master branch with the BackOfficeAssoc GitHub Repo

{% include warning.html content="You **MUST** perform these steps each time you checkout a branch to ensure you are working in the latest copy of the master branch." %}

1.  In Windows-Explorer, right-click on your dsp-install-manuals local folder and select **Git Bash Here**.
    {% include image.html file="gitBashHere.png" alt="Right-click menu with Git Bash Here option" caption="Right-click menu with Git Bash Here option" %}
    {% include note.html content="If you do not have a local dsp-install-manuals repo, see [Clone the dsp-install-manuals repo](#clone-the-dsp-install-manuals-repo) for instructions." %}
2.  Switch to the master branch.
    <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> The git command to switch to the master branch is <code class="highlighter-rouge">git checkout master</code>.</div>
3.  Enter the git command, `git pull origin master`
    {% include tip.html content="If at this point you wish to see a list of branches that are available in your local repo, enter the command `git branch`. All of the available local branches are listed." %}

### Create a branch for your updates based on the master branch

1.  Navigate to the master branch in Git Bash if you are not already in it.
    {% include important.html content="Make sure you synchronize your Master branch before completing step 2." %}
2.  Enter the command `git checkout -b <new branch name>`
    {% include note.html content="Name the branch after the release number. Use the naming convention StagingNNN (NNN is the release number)." %}
3.  Open the project in Flare and make your updates and your updates are saved on the correct branch.
4.  When you finish your updates, save your changes and **close Flare**.

### Create a Release Folder on OneDrive
1. Navigate to the **Product Documentation** folder one OneDrive.
2. Click **+New** and select **Folder**.
3. Enter the release number into the **Folder Name** field.
4. Click **Create**.
5. Open the prior version folder and select the Word files of the different manuals.
6. Click **Copy to** and select the new release folder you just created.
7. Update the titles of the manuals to reflect the new release.

### Create a JIRA Epic for the Release
1. In JIRA click the plus sign on the left side of the **System Dashboard**.
2. Select the correct project from the **Project** dropdown.
3. Select **Epic** from the **Issue Type** dropdown.
4. Enter an epic name in the **Epic Name** field. Ex. "Documentation for 7.0.1 Release (\Installation Manuals and Release Notes)\".
5. Enter a summary in the **Summary** field. Ex. "Update manuals with changes for 7.0.1."
6. Enter a description in the **Description** text box. Ex. "Each subtask has a Word document link to the manuals with 7.0 updates. Link to OneDrive folder."
   {% include note.html content="Make sure to include a link to the OneDrive folder that you created for this release." %}
7. Add the **Fix Version**, as the release number.
8. Add the **Assignee**, as yourself.
9. Click **Update**.

### Add Subtasks for Manuals in JIRA Epic

1. Click on the manual updates JIRA Epic for the release.
2. Click the plus button to add Subtasks.
3. Create a subtask for each manual that needs updating.
4. Enter a summary in the **Summary** field. Ex. BackOffice Associates Installation and Upgrade Manual 7.0.
5. Add the **Assignee**, as yourself.
6. Enter the description in the **Description** field. Ex. "The document is located on OneDrive, which is part of Microsoft Office 365. To edit the document, click the following Edit Document link, which opens the document in Word Online. You may have to enter your Outlook username and password to log in to OneDrive. You can edit the document in Word if you wish by clicking on \'Edit Document\' and selecting \'Edit in Word\'. However, DO NOT Save As and create a new version of the document.
 **NOTE:** If you choose to update the document in Word Online, all marked changes, including yours, are not displayed though they are tracked. However, when the document is reviewed in Word (by clicking Edit in Word) the changes are marked by Track Changes."
   {% include note.html content="Include a link to the OneDrive folder at the bottom of the desciption so that reviewers who do not have access to Flare can see the content and provide comments and edits." %}

### Make Updates in Flare

To make updates in Flare follow the instructions in the 'Commit updates locally and push them to the BackOfficeAssoc GitHub Repo dsp-docs' section of the [DSP Documentation Workflow][BOADocProcess_DSPDocWorkflow].

{% include note.html content="Do NOT merge changes into the **master** branch without having another writer review the Pull Request." %}


### Update the Targets for the Manuals

To update the targets for the manuals:

1.  Update the Master TOC for the target.
2.  Save the Output file path to a destination you can access.
3.  Update the Variable file in the Project Explorer and the Variables in each target. These updates include:
-   ProductNameShort
-   ProductNameFull
-   ManualType
-   SetupVersion
-   CopyrightDate

4.  Select the correct Condition Tags for the BOA and SAP manuals. The BOA manuals must exclude everything with the SAP tags, and the SAP manuals must exclude everything with the BOA tags.

4.  Tech Writer produces Word and secured PDF outputs. [The PDFs must be encrypted using Adobe Acrobat][BOADocProcess_DevManConfigGuides.html#securitysettings].

{% include links.html %}
