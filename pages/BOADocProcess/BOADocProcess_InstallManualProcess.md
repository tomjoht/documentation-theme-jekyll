---
title: Install Manual Process
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
toc: false
permalink: BOADocProcess_InstallManualProcess.html
folder: BOADocProcess
---
Installation Manual Process
===========================

The following steps describe the collaboration, review, approval and
final formatting process to get the Installation Manuals ready for
publishing for each software release.

1.  The Tech Writer creates a new Staging branch based on the Master
branch in the dsp-install-manuals repo.

2.  The Tech Writer opens a Jira ticket for each manual to track the updates to the install manuals. The Documentation Status field is set to Review. A link to the manual on OneDrive is included in the description of the ticket. The manuals are stored in Mike Avon's OneDrive here:
><https://boaweb-my.sharepoint.com/:f:/p/michaelavon/Eu1S90tG2lFKp5jIydpl_PsBQU81K97fM0rNhfoG3hBkbw?e=WaOlfs>.

The description can be worded as follows:

>The document is located on OneDrive, which is part of Microsoft Office 365. To edit the document, click the following Edit Document link, which opens the document in Word Online. You may have to enter your Outlook username and password to log in to OneDrive. You can edit the document in Word if you wish by clicking on \'Edit Document\' and selecting \'Edit in Word\'. However, DO NOT Save As and create a new version of the document.

 **NOTE:** If you choose to update the document in Word Online, all marked changes, including yours, are not displayed though they are tracked. However, when the document is reviewed in Word (by clicking Edit in Word) the changes are marked by Track Changes.

>\[link title\|http://example.com\]

3.  Technical Writer and contributors review and update the manuals in
    OneDrive as needed.

4.  Once the collaboration is complete and the content is final, the
    approver sets the Documentation Status field to Approved.

5.  The Tech Writer makes the required changes in Flare and updates the
    Appendix A -- Version History section to reflect the current
    version.

6.  Once all changes for a release are in Flare, the Tech Writer sets
    the Documentation Status field of the installation manual epic Jira
    ticket to Peer Review.

7.  Peer reviewer makes any necessary edits in Flare. The reviewing tech
    writer does not need to review content, because collaborators must
    address and approve all content changes during the collaboration
    step.

8.  Once the review is complete, the peer reviewer merges all of the
    changes in the Staging branch to the Master branch.

9.  After the Staging branch is merged, the Tech Writer who owns the
    manual generates the file version and the secured pdfs and sends
    notification that the final manuals are ready to Support, and then
    closes the Jira ticket.

#### To Clone the dsp-install-manuals directory to your local repo:

1.  Open Git Bash and navigate to the directory that you wish to
    download to.

 **NOTE:** The repository will be cloned into a new directory below the one you specify, with the same name as the repository, ex. C:\\heathercloward\\github\\dsp-install-manuals
                                       
 **NOTE:** In Windows Explorer, you can right-click in a folder and
select **Git Bash Here** from the dropdown menu to open the command
prompt at that location.

> ![https://lh5.googleusercontent.com/SyCR6JXEWHt-sitWXBTtOJnTY9D4GBqYo46KTc4M8sD8iU0zY4SL-Ie40xnsdqL6ngFfJKHWpz-Ep7inPl1ASMKYIZGnyT21jvfcn99\_hsCHbrFlZ4A\_GzbINcsgDUTLSRzNu4sA](media/image57.png)

2.  Enter the git clone command using the SSH URL from step 1.

>Example: git clone git\@github.com:BackOfficeAssoc/dsp-install-manuals.git

3.  Switch into your new directory by entering the git command cd dsp-install-manuals

>You will know you are in the correct directory by the command prompt, ex. Documents/GitHub/dsp-install-manuals (master) - shows repo name and branch name

Once you have cloned the dsp-install-manuals repository:

1.  Open a Git Bash command prompt window.

2.  Navigate to your dsp-install-manuals repo.

3.  If you are not currently in the correct staging branch, checkout the staging branch you need to work from by entering the command **git checkout < current Staging branch >.**

 **NOTE:** If you do not have the newest staging branch in your local repo you can fetch it from the remote by entering the git command **git fetch origin < current staging branch >**. Afterwards, you need to switch into the branch using the git command **git checkout < current staging branch >**.

 **NOTE:** To list the branches currently in your local repo enter the git command **git branch**.

4.  Enter **git pull origin < current Staging branch >** to pull down the latest changes from the most current branch**.**

5.  Enter **git branch checkout -b < name of personal branch >** to create a personal branch in which to make edits to merge to the Staging branch.

6.  Open the Flare project with File Explorer.

7.  Edit the manuals in Flare, save changes and close Flare.

8.  Open a Git Bash command prompt window.

9.  Enter **git status** to view files that have been updated.

 **NOTE:** If you made changes that you would like to remove from your personal branch, you can enter the command **git checkout --< dsp-install-manuals/ProjectFiles/< topicfilename.htm\ >** (fill in brackets with complete file path for the topic you made unwanted changes to, as displayed in the command prompt window after executing the "git status" command) and it will remove the file from the staging area. Changes made in that file will be discarded and will not be included in the commit.

10. Enter **git add .** to add all changes to the commit to be pushed to the Staging branch.

11. Enter **git commit -m** **"< message about updates made without using any special characters >"**.

12. Switch to the current Staging branch by entering the git command **git checkout < current Staging branch name >**.

13. Merge your updated branch with the Staging branch by entering the git command **git merge \<personal branch\>**.

 **NOTE:** Do NOT merge changes into the **master** branch without having another writer review the Pull Request.

14. Push updates to remote current Staging branch by entering the git command **git push origin < staging branch name >**.

    ![](media/image58.png)

Now you can go to GitHub.com and you should see your latest commits
added to the current Staging branch.

When updating targets for different manuals:

1.  Update the Master TOC for the target.

2.  Save the Output file path to a destination you can access.

3.  Update the Variable file in the Project Explorer and the Variables in each target. These updates include:

-   ProductNameShort

-   ProductNameFull

-   ManualType

-   SetupVersion

-   CopyrightDate

4.  Select the correct Condition Tags for the BOA and SAP manuals. The BOA manuals must exclude everything with the SAP tags, and the SAP manuals must exclude everything with the BOA tags.

When all content for the manuals has been approved for release:

1.  Send a pull request to another writer for final review. See the [Open a pull request for a peer reviewer to review your work section](#open-a-pull-request-for-a-peer-reviewer-to-review-your-work) for more information on opening

2.  Peer reviewer must merge the Staging branch into the master branch. See the *[Merge the updates and delete the branch](#merge-the-updates-and-delete-the-branch-in-github) in GitHub* section for more information on merging pull requests.

3.  Peer reviewer messages the Tech Writer who owns the manuals for the release cycle.

4.  Tech Writer produces Word and secured PDF outputs. The PDFs must be encrypted using Adobe Acrobat.

> The master branch must be updated with the latest changes at the close
> of each release, and a new Staging branch must be created at the
> beginning of every release cycle from the master branch by the Tech
> Writer who is handling the manuals that release cycle. Sometimes
> customers need manuals specific to the version of DSP that they are
> running, so the Staging branches must not be updated or deleted once
> they have been merged into the master branch.
