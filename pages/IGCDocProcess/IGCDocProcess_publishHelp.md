---
title: Publish IGC Help
keywords: IGCDocProcess
summary: "This page describes the process the doc team uses to publish IGC online help."
sidebar: IGCDocProcess_sidebar
permalink: IGCDocProcess_publishHelp.html
folder: IGCDocProcess
---
Publish IGC™ Help
-----------------

IGC™ Help updates can be published anytime. When a ticket on the Kyber
board reaches Done status, it is deployed and the related documentation
should be published. Refer to Publish IGC™ Release Notes.

### To publish IGC™ Help:

1.  You can attach a Word doc to a ticket or you can link a Google doc
    in an IGC™ Dev team channel for review.

2.  Next, when Help updates are written and reviewed (if needed), inform
    the Doc Team in the appropriate Slack Channel that you are going to
    check out IGC™ Help.

3.  [Synchronize your local repo's develop branch with the remote
    develop branch](#_Synchronize_your_local)

4.  [Commit updates locally and push to
    remote](#commit-updates-locally-and-push-to-remote).

5.  [Peer Review updates -- no changes
    necessary](#peer-review-updates-no-changes-necessary)

6.  [Peer Review updates -- changes
    necessary](#peer-review-updates-changes-necessary)

[]{#_Synchronize_your_local .anchor}

#### Synchronize your local repo's develop branch with the remote develop branch

1.  Right-click in your local repo folder and select **Git Bash Here**
    from the dropdown menu to open the command prompt at that location.

2.  If you are not currently in the develop branch, switch to the
    develop branch by entering the git command cd develop.

    **NOTE:** You will know you are in the correct directory by the
    command prompt, ex. Documents/GitHub/igc-help (develop) - shows repo
    name and branch name.

    **NOTE:** If you do not have the develop branch in your local repo
    fetch it by entering the git command git fetch origin develop.

3.  Enter the git command git pull origin develop to synchronize your
    local copy of the develop branch with the remote copy.

> **NOTE:** You MUST perform these steps before you make updates to
> ensure you are working in the latest copy of the develop branch.

4.  Now you can open your project in Flare and make your updates and
    they will be saved on the correct branch.

5.  When you finish your updates, save your changes, and **build and
    publish** your target(s).

    **NOTE:** It is necessary to build the target first, then publish it
    so that the Help Build Date is updated.

    **NOTE:** You will need to update the path for the build folder
    (your desktop output folder) and publish destinations (make sure you
    select the correct folder for the correct help -- IGCHelp or
    IGCWhatsNew) to your local folders.

    ![](media/image7.png){width="5.03125in"
    height="2.604854549431321in"}

> **IMPORTANT**: The Publish checkbox must be checked for the current
> target only. In the screen shot below, it is selected for the HTML5
> IGC target, but not the HTML5 IGC What\'s New target. If both
> checkboxes are checked for a target, the help and the what\'s new help
> systems will have the same landing page (either Welcome.html or IGC
> Releases.html). ![](media/image8.png){width="5.645833333333333in"
> height="3.337435476815398in"}

6.  In File Explorer, verify your updates are appearing correctly in the
    correct publish folder (IGCHelp or IGCWhatsNew).

    ![](media/image9.png){width="4.40751968503937in"
    height="2.8521741032370955in"}

7.  Close Flare and Help output.

#### Commit updates locally and push to remote

1.  Return to Git Bash or open a new session.

2.  Navigate to your repo, and make sure you are in the correct branch.
    It is in parenthesis after your prompt.

3.  Enter the git command git status to see all of the changes you have
    made.

    **NOTE:** All of the updated files' paths will appear in red.

    **NOTE:** If you do not see them, you may have forgotten to save or
    you are in the wrong branch.

4.  Stage your updates for commit by entering the command git add .

    **NOTE:** The file paths will change from red to green after you
    stage them.

5.  Commit staged updates by entering the command git commit -m "commit
    message that informs everyone what you have done"

    **NOTE:** Do not use special characters, like apostrophes, in
    message.

6.  Push your updates to the remote repo by entering the command git
    push origin develop.

7.  Go to dev site(s) and check to see that the updates have been made.
    <http://dev.general.igchelp.com/>

    <http://dev.whatsnew.igchelp.com/>

8.  Open a PR in GitHub to merge develop with master and assign it to
    another tech writer. Make sure to include JIRA ticket numbers and
    explanations for the peer reviewer in your PR comments so they know
    what to review on the dev site.

9.  Message peer reviewer in Slack with link to PR in GitHub .

#### Peer Review updates -- no changes necessary

1.  As a reviewer, you will be notified via Slack chat or email you have
    been assigned a PR and you can click a link to view the pull
    request. Be sure to review the PR to see what updates the writer has
    made so you know what to check for on the dev site.

2.  Go to dev site and check to see that the updates have been made.
    <http://dev.general.igchelp.com/>

    <http://dev.whatsnew.igchelp.com/>

3.  If everything looks fine and no further updates are necessary, go to
    GitHub.com.

4.  Make sure the PR is to merge the develop branch into the Master
    branch.

5.  Click the **Merge Pull Request** button.

6.  Click the **Confirm Merge** button.

7.  All updates should show up on the main sites here:

    <https://general.igchelp.com/>

    <https://whatsnew.igchelp.com>

8.  Notify the PMs in the igc-help channel that the Help updates have
    been published.

#### Peer Review updates -- changes necessary

1.  As a reviewer, you will be notified via Slack chat or email you have
    been assigned a PR and you can click a link to view the pull
    request. Be sure to review the PR to see what updates the writer has
    made so you know what to check for on the dev site.

2.  Go to dev site and check to see that the updates have been made.

    <http://dev.general.igchelp.com/>

    <http://dev.whatsnew.igchelp.com/>

3.  If updates need to be made, right-click in your local repo folder
    and select **Git Bash Here** from the dropdown menu to open the
    command prompt at that location.

4.  Switch to the develop branch locally by entering the git command git
    checkout develop

    **NOTE:** The name in the parenthesis after the command prompt
    should change to the new branch name, meaning you can now open the
    files in Flare and see the changes.

5.  Synchronize your local develop branch with the remote by entering
    the git command git pull origin develop.

    **NOTE:** This step will pull down the updates made by the previous
    author.

6.  Open Flare and make updates.

7.  When you finish your updates, save your changes, and **build and
    publish** your target(s).

    **NOTE:** It is necessary to build the target first, then publish it
    so that the Help Build Date is updated.

    **NOTE:** You will need to update the path for the build folder
    (your desktop output folder) and publish destinations (make sure you
    select the correct folder for the correct help -- IGCHelp or
    IGCWhatsNew) to your local folders.

    ![](media/image7.png){width="5.03125in"
    height="2.604854549431321in"}

> **IMPORTANT**: The Publish checkbox must be checked for the current
> target only. In the screen shot below, it is selected for the HTML5
> IGC target, but not the HTML5 IGC What\'s New target. If both
> checkboxes are checked for a target, the help and the what\'s new help
> systems will have the same landing page (either Welcome.html or IGC
> Releases.html). ![](media/image8.png){width="5.645833333333333in"
> height="3.337435476815398in"}

8.  In File Explorer, verify your updates are appearing correctly in the
    correct publish folder (IGCHelp or IGCWhatsNew).

    ![](media/image9.png){width="4.40751968503937in"
    height="2.8521741032370955in"}

9.  Close Flare and Help output.

10. Return to Git Bash or open a new session.

11. Navigate to your repo, and make sure you are in the correct branch.
    It is in parenthesis after your prompt.

12. Enter the git command git status to see all of the changes you have
    made.

    **NOTE:** All of the updated files' paths will appear in red.

    **NOTE:** If you do not see them, you may have forgotten to save or
    you are in the wrong branch.

13. Stage your updates for commit by entering the command git add .

    **NOTE:** The file paths will change from red to green after you
    stage them.

14. Commit staged updates by entering the command git commit -m "commit
    message that informs everyone what you have done"

    **NOTE:** Do not use special characters, like apostrophes, in
    message.

15. Push your updates to the remote repo by entering the command git
    push origin develop.

16. Go to dev site and check to see that the updates have been made.

    <http://dev.general.igchelp.com/>

    <http://dev.whatsnew.igchelp.com/>

17. If everything looks fine and no further updates are necessary, go to
    GitHub.com.

18. Make sure the PR is to merge the develop branch into the Master
    branch.

19. Click the **Merge Pull Request** button.

20. Click the **Confirm Merge** button.

21. Click the **Confirm Merge** button.

22. All updates should show up on the main sites here:

    <https://general.igchelp.com/>

    <https://whatsnew.igchelp.com>

23. Notify the PMs in the igc-help channel that the Help updates have
    been published.
