---
title: DSP Documentation Workflow
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summar: "The Documentation team uses Jira, Github, Git Bash and Flare when
updating online help content. This section describes that process, which
is driven by the Documentation Status field in Jira."
permalink: BOADocProcess_DSPDocWorkflow.html
folder: BOADocProcess
---
## The Documentation Status Field
Used by the Documentation team only, the Documentation Status field defines where the content for that JIRA ticket is in the workflow.

{% include important.html content="[GitHub Initial Setup][BOADocProcess_GitInitSetup] contains the initial
configuration and setup steps for Git and GitHub. These steps must be
performed by a new employee." %}

The Documentation Status field contains the following values:
-   **Not Started** --- Default value. No work has been done on the
    ticket except for initial assignment in the Writer Assigned field
    and an estimate in the Documentation Hours Remaining field.
-   **In Process** --- Technical writer researches and writes draft
    content and adds it to Flare.
-   **Peer Review** --- Technical Writer reviews content added to help.
-   **Review** ---PM/Dev is reviewing content.
-   **Approved** --- Content has been approved by PM.
-   **Doc Done** --- Doc is complete.

{% include tip.html content="A checklist of the steps in this process is included in the appendix, [Checklist for DSP Documentation Workflow][BOADocProcess_CLDSPWorkflow]." %}

## No Documentation Required

If the ticket does not change or require new documentation, add a comment on the ticket stating that documentation is not required. Update the **Documentation Status** field to **Doc Done**.

## Assign Ticket and Set Documentation Status

The **Writer Assigned** and **Documentation Status** fields must be complete for all tickets requiring documentation in the DSP project.

Technical Writers review tickets when they are added to the board and assign the tickets as appropriate, either to themselves or other team members.

To assign a writer:

1.  Click the **Edit** button on the ticket.
2.  Select the writer in the **Writer Assigned** list box.
3.  Set the status in the **Documentation Status** field.
4.  Click **Save**.

## Not Started: PM Enters a Ticket in Aha! or Dev/PM/Others Add Tickets Manually in Jira

Technical Writers track all documentation content in JIRA, including:
-   New features and updates
-   All Bug issues
-   Customer Support issues
-   Other tickets (tasks, defects) that describe changes to behavior or the UI that were previously released.

{% include tip.html content="Technical Writers enter issues related to how the online help works, and unrelated to content (as in, typos, broken links, Map ID corrections) on the DocTeamToDos board in JIRA." %}

The process begins when a ticket is moved to the board for the current release.

Either:
-   PM enters the initial ticket in Aha! A Jira ticket is automatically created, or
-   PM/Dev/QE enter the ticket manually in Jira, or
-   JIRA users may also enter documentation-only issues with an Issue Type of **Document** on the DSP board.

## In Process: Technical Writer Drafts content in Flare {#draftcontent}

Technical Writers begin work on tickets as soon as possible after the ticket has made it past User Story review and completes the draft content in Flare.

When writing content, the TW communicates with PM/Dev as needed to ask questions, get clarification etc. The TW must provide information on the Jira ticket about where to find the updates in the Help system. It may be necessary to generate a Google document to show the updates. Both PM and the Peer Reviewer rely on this information, so it is vital that it is included.

To add content to the help:

1.  [Synchronize your release branch with the BackOfficeAssoc GitHub Repo](#synchronize-your-release-branch-with-the-backofficeassoc-github-repo)
2.  [Create a branch for your updates based on the release branch](#create-a-branch-for-your-updates-based-on-the-release-branch)
3.  [Commit updates locally and push them to the BackOfficeAssoc GitHub Repo](#commitlocally)
4.  [Open a pull request for a peer reviewer to review your work](#open-a-pull-request-for-a-peer-reviewer-to-review-your-work)

{% include important.html content="Always use Git Bash. Do not use the **GitHub Desktop** application." %}

### Synchronize your release branch with the BackOfficeAssoc GitHub Repo

{% include warning.html content="You **MUST** perform these steps each time you checkout a branch to ensure you are working in the latest copy of the release branch." %}

1.  In Windows-Explorer, right-click on your dsp-docs local folder and select **Git Bash Here**.
    {% include image.html file="gitBashHere.png" alt="Right-click menu with Git Bash Here option" caption="Right-click menu with Git Bash Here option" %}
2.  Switch to the release branch you are working in now, for example, develop\_67.
    <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> The git command to switch to the release branch is <code class="highlighter-rouge">git checkout &lt;release branch name&gt;</code>.</div>
3.  Enter the git command, `git pull origin <release branch name>`
    {% include tip.html content="If at this point you wish to see a list of branches that are available in your local repo, enter the command `git branch`. All of the available local branches are listed." %}

### Create a branch for your updates based on the release branch

1.  Navigate to the release branch in Git Bash if you are not already in it.
2.  Enter the command `git checkout -b \<new branch name\>`
    {% include note.html content="Name the branch after the JIRA ticket number if applicable. Use the naming convention DSP-NNNN. If changes are not related to a Jira ticket, give the branch a meaningful name, such as 'releasenotesupdates'." %}
3.  Open the project in Flare and make your updates and your updates are saved on the correct branch.
4.  When you finish your updates, save your changes and **close Flare**.

### Commit updates locally and push them to the BackOfficeAssoc GitHub Repo dsp-docs {#commitlocally}

1.  Return to Git Bash or open a new session.
2.  Navigate to your repo, and make sure you are in the correct branch. It is in parenthesis after your prompt.
3.  Enter the git command `git status` to see all of the changes you have made.
    {% include note.html content="If you do not see your changes, you may have forgotten to save or you are in the wrong branch." %}
4.  Stage the updates for commit by entering the git command `git add .`
    {% include note.html content="Include the period in the command." %}
    {% include tip.html content="Comments change from red to green after you stage them." %}
5.  Commit staged updates by entering the command `git commit -m "<commit message that informs everyone what you have done>"`
    {% include note.html content="Do not use special characters in message." %}
6.  Push your changes to the remote by entering the command `git push origin <new branch name>`
    {% include tip.html content="Now your new branch is visible on GitHub and available for others to access for review." %}

### Open a pull request for a peer reviewer to review your work {#openPR}

1.  Go to GitHub.com and click the **Compare and pull request** button next to your recently pushed branch.
2.  Make sure the **base** is the current release branch you are working in and **compare** is your new branch name.
    {% include image.html file="githubPR.png" alt="GitHub PR, base and compare branches" caption="GitHub PR, base and compare branches" %}
3.  Add notes and a reviewer to the pull request and click the **Create pull request** button.
    {% include note.html content="Message the reviewers in Slack with link to PR." %}
4.  Add the PR URL to the Jira ticket.
5.  Update the **Documentation Status** on the JIRA ticket to **Peer Review**.

## Peer Review: Peer Reviews Content in Flare {#peerreview}

1.  In Windows-Explorer, right-click on your dsp-docs local file and select **Git Bash Here**.
    {% include image.html file="gitBashHere.png" alt="Right-click menu with Git Bash Here option" caption="Right-click menu with Git Bash Here option" %}
2.  Switch to the release branch you are working in now, for example, develop\_67.
    {% include note.html content="The git command for switching branches is `git checkout <branch name>`" %}
3.  Synchronize your release branch by entering the git command `git pull origin <release branch name>`
    {% include note.html content="If at this point you wish to see a list of branches that are available in your local repo, enter the command `git branch`. All of the available *local* branches are listed." %}
4.  As a reviewer, you are notified by email when you are assigned a PR and you can click a link to view the pull request in GitHub. Otherwise, the writer may include a link when they message you in Slack.
5.  To pull the new branch to your local repo so you can view the changes in Flare, in Git Bash navigate to your local dsp-docs repo and enter the git command `git fetch origin <new branch name>`  Ex. `git fetch origin DSP-2345`
    {% include tip.html content="The new branch name is in the PR." %}
    {% include image.html file="prBranchName.png" alt="Where to find PR branch name in GitHub" caption="Where to find PR branch name in GitHub" %}
6.  Switch to the new branch locally by entering the git command `git checkout <new branch name>`
    {% include tip.html content="The name in the parenthesis after the command prompt updates to the new branch name, indicating you can now open the files in Flare and see the changes." %}
    {% include important.html content="If at this point you receive a message like, `error: Your local changes to the following files would be overwritten by checkout: <list of files>.` This means you have made changes to the files on this branch since last checkout. If you do not want to save them, before you can checkout a new branch, you need to reset your directory with the following command: `git reset --hard`. **All changes noted above will be lost, so be sure before you enter the command that you do not want to keep the updates.**" %}
7.  Once the appropriate branch has been checked out, open the **BackOffice Associates Solutions.flprj** project file from your local dsp-docs repo.
    {% include tip.html content="Check for broken links and bookmarks as well. On the **Analysis** tab, select **Broken Links** from the **Project Analysis** drop-down. Then select the **Broken Bookmarks** option from the drop-down. It is good practice to check for broken links after Help is fetched and after any changes are made before the commit to GitHub." %}
8.  Review the content for clarity.
9.  Test the steps.
10. Check the content for the standard styles and content organization, if applicable.
11. Check grammar and spelling.
12. Test links.
13. View the Build log to check for build warnings and errors. Refer to the [Build Help Targets][BOADocProcess_BuildHelpTargets] section for moreinformation.
14. If a new page has been added to the product, confirm that a Map ID was added to the alias file. See [Add Context-sensitive Help Links][BOADocProcess_UpdateOnlineHelp.html#addcslinks] for more information.

{% include tip.html content="The Peer Review can either pass or fail." %}

### Peer Review Passes: Peer Reviewer has made no updates to content during review.

#### Merge the updates and delete the branch in GitHub

1.  If everything looks good, close Flare.
2.  Make sure the branch you are merging into is the correct release branch. If it is not, click the **Edit** button and select the correct release branch.
    {% include image.html file="editBranch.png" alt="How to edit branch in GitHub" caption="How to edit branch in GitHub" %}
3.  Click the **Add your review** button, select **Approve**, then click **Submit review**.
    {% include image.html file="addYourReview.png" alt="Add your review in GitHub" caption="Add your review in GitHub" %}
4.  Click the **Merge pull request** button.
    {% include important.html content="If this button is not active, resolve the conflicts by following the steps in [Resolving metadata merge conflicts in GitHub.](#resolving-metadata-merge-conflicts-in-github)" %}
5.  Click the **Confirm merge** button.
6.  Click the **Delete branch** button to remove the branch from GitHub.

#### Delete the branch in your local repo

1.  Open Git Bash and navigate to your dsp repo.
2.  Switch out of the branch you want to delete by entering the git command `git checkout <release branch name>`
    {% include warning.html content="Make sure you have merged the changes before you enter the following command or your changes will be lost." %}
3.  Delete the branch by entering the git command `git branch -D <new branch name>`

{% include tip.html content="Next, refer to [Review: PM Reviews and Approves Documentation](#review-pm-reviews-and-approves-documentation)." %}

### Peer Review Fails: Edits are necessary in review

1.  Make updates in Flare on the writer's branch that you pulled from GitHub.
2.  Stage the updates for commit by entering the git command `git add .`
    {% include note.html content="Include the period in the command." %}
3.  Commit the updates to your local repo by entering the git command `git commit -m '<put a message that describes your updates>'`.
    {% include tip.html content="Do not include special characters in commit message." %}
4. Push the updates to the dsp-docs remote repo by entering the git command `git push origin <branch name>`
2.  Go to the PR in GitHub to ensure that your commit was added to the PR.
6.  Make sure the branch you are merging into is the correct release branch. If it is not, click the **Edit** button and select the correct release branch.
    {% include image.html file="editBranch.png" alt="How to edit branch in GitHub" caption="How to edit branch in GitHub" %}
7.  Click the **Add your review** button, select **Approve**, then click **Submit review**.
8.  Click the **Merge pull request** button.
    {% include important.html content="If this button is not active, resolve the conflicts by following the steps in [Resolving metadata merge conflicts in GitHub.](#resolving-metadata-merge-conflicts-in-github)" %}
9.  Click the **Confirm merge** button.
10. Click the **Delete branch** button to remove the branch from GitHub.com.
{% include tip.html content="Next, refer to [Review: PM Reviews and Approves Documentation](#review-pm-reviews-and-approves-documentation)." %}

### Resolving metadata merge conflicts in GitHub

Sometimes Flare adds metadata/XML markup updates to topics in the XML Editor that are not displayed in the Text Editor. These "behind the scenes" code updates can cause merge conflicts if another team member has altered the same topic. This situation is likely to occur when updating the What's New topic because it is updated with a release note for each JIRA ticket that is written during a release.

1.  When you go to the PR page a note from GitHub that tells you when there are merge conflicts.
    {% include image.html file="mergeConflicts.png" alt="Merge conflicts message in GitHub" caption="Merge conflicts message in GitHub" %}
2.  After peer reviewing the updates in Flare, click the **Resolve conflicts** button.
3.  Delete from the equal signs `========` down to the `>>>>>` including the feature branch name.
    {% include warning.html content="Be careful to leave one of the XML tags to avoid XML errors in Flare." %}
    {% include image.html file="avoidXMLErrors.png" alt="What to delete when solving merge conflicts in GitHub" caption="What to delete when solving merge conflicts in GitHub" %}
4.  Delete the `<<<<<<` and your new branch name.
5.  Click the **Mark as resolved** button when it displays. Then a green checkmark is displayed to indicate the conflict is resolved.
6.  Click the green **Commit merge** button to merge the updates.

### Keep your repo clean of merged branches

After you receive notification that your branch has been merged into the main feature branch, it is best to delete your branch from your local repo. Otherwise you end up with a lot of unused branches in your repos.

{% include warning.html content="Once a branch is deleted it is gone, so make sure all updates have been merged before you perform the delete." %}

To delete branches on your local repo, open Git Bash and enter the git
command `git branch -D <name of branch>`

{% include important.html content="This won't work if you are on the branch you are attempting to delete. Checkout a different branch, then complete the command." %}

## Review: PM Reviews and Approves Documentation

There are two sites for the hosted help, one for dev and one for prod.

Content is pushed to the dev site for testing when it's added to any \`develop\_xxx\` branch. So pushing to \`develop\_70\` will add content to the dev site for online help for version 7.0.

For prod, the build tools are watching the \`develop\` branch. That's where the latest version of the documentation lives. In order to ensure that only the intended pushes to \`develop\` go to prod and to the right version, the build tools are only watching and pushing updates that have been merged.

So when branch \`develop\_70\` is merged into \`develop\`, Jenkins checks for the commit message, checks that \`develop\_70\` has been merged, and pushes to version 7.0 in prod.

Documentation is built on a Jenkins node server and takes a bit of time. From the moment a commit is made to when it becomes available is roughly 10 minutes, give or take. This is for both dev and prod.

{% include tip.html content="You may also need to clear your cache or open an incognito window to see updates." %}

When the Author gets an email that the content has been merged, she updates the Documentation Status field to Review, and @ mentions PM on the ticket.

PM confirms that new and updated features are described completely and correctly from a user's perspective.

Either:

-   PM approves the content by setting the Documentation Status field to Approved.

Or

-   PM notes on the Jira ticket what needs to be updated, and the process begins again at the In Process step.

### Doc Done: Change status

Once approved, the Author moves the **Documentation** Status to **DocDone**. Open a PR to merge the changes to the production site. Refer to Update the Production Site when Documentation is Approved.

### Update the Help on the Dev and Prod Sites

Each release has a branch in the dsp-docs repo with the naming convention develop\_nnn, where nnn is the release number (develop\_701, for example). When a pull request is merged to that branch, a Technical Writer logs in to Jenkins and builds the helpn.

The URL for the full version is:

> https://dsphelpdev.boaweb.com/nnn/general/Home.htm

The URL for the Solex version is:

> https://dsphelpdev.boaweb.com/nnn/solex/Home.htm

The URL for the prod full help is:

> https://dsphelp.boaweb.com/nnn/general/Home.htm

For Solex:

> https://dsphelp.boaweb.com/nnn/solex/Home.htm

{% include links.html %}

To update the help on the sites:
1.  Log in to Jenkins.
2.  In the Name column, click DSPDocs.
3.  Click  the Schedule a Build icon for either DSPDocDev or DSPDocProd.
4.  Enter the version number in the VERSION field.
5.  Click Build. 
The build status displays in the left column under Build History. 




