---
title: Mercurial notes and tips
summary: "If you're using Mercurial to collaborate on a project, see the tips and notes on this page."
tags: collaboration
keywords: mercurial, hg, collaboration, interaction, project teams
---


This is my reference notes and quick reference for using Mercurial.

## Terminology

<dl>

<dt>Distributed revision control</dt><dd>Mercurial is distributed revision control instead of centralized revision control. This means everyone keeps a copy of the repo on their local machine, and then they merge back the changes. With centralized revision control, team members check out a version that remains in a central repo, and it becomes locked when checked out. The latter results in more wait time to check out files, little innovation for experimentation without committing, latency, and other issues.</dd>

<dt>Working directory</dt> <dd>The files that Mercurial is tracking in a directory.</dd>

<dt>Changeset</dt> <dd>A list of the most recent changes to the repo.</dd>

<dt>Tip</dt> <dd>The name of the latest changeset.</dd>

<dt>Tags</dt> <dd>A more user-friendly way to name changesets.</dd>

<dt>Default</dt> <dd>The name of the main repo. This is defined in the .hg/hgrc file in the `[paths]` section. When you run `hg push` and other commands, if you don't specify another source, the default path gets used.</dd>

<dt>Diff</dt> <dd>A list of differences with a file.</dd>

<dt>Patch</dt> <dd>Synonym for diff.</dd>

<dt>Repo</dt> <dd>The directory where Mercurial is activated.</dd>

<dt>head</dt> <dd>A changeset with no child changesets. When you get two heads, it's because you pulled in changes.</dd>

<dt>parent</dt> <dd>The previous changeset before the latest change.</dd>

<dt>child</dt> <dd>Later in the changeset history. the first parent is the first changeset, and then you have a list of descendants, which are the children.</dd>

<dt>merge conflict scenarios</dt> <dd>Merge conflicts happen when add or modify a file that another has removed from one commit to another, you make conflicting changes to the same file from one commit to another, or Mercurial notes some other file discrepancy. When a merge conflict happens, Mercurial launches a merge program to resolve the conflict. When merge conflicts happen, Mercurial removes the problematic files from the working directory until you fix them. You have to add them again to the working directory.
</dd>

<dt>bookmarks:</dt><dd>This is a way to create branches in Mercurial. First run <code>hg bookmark hell</code>. Then <code>hg checkout hell</code>. Now you're working in hell. Then run <code>hg bookmark --delete hell</code> to delete hell. </dd>

<dt>branches</dt><dd> You don't really work with branches in Mercurial. If you create a branch, it's considered a separate line of code. Rarely do you merge branches back in. In this regard, Mercurial differs greatly from Git. However, Mercurial's approach to branching is that you should simply clone the repository. When you want to merge your clone, you pull changes from your clone. There's really no reason to add in this new "branching" functionality when all you're doing is basically the same clone operation. </dd>.

</dl>


## Commands
 
| Commands | Description |
| ------ | ------ |
| clone | copy a specific repository (can be URL or local path) |
| init | initialize Mercurial in the existing repository |
| outgoing | show changes committed locally but not yet pushed | 
| incoming | show changes committed to remote but not yet pulled |
| pull | pull the latest changeset into local repo|
| pull -u | pull the latest changeset into local repo and update working directory to that changeset |
| fetch | pull -u + merge + commit (if merge was successful)  all in one command |
| help -v | show help in verbose mode|
| help (command) | shows help about a specific command |
| summary | summarizes the state of the current local working directory |
| summary --remote | summarizes the state of the remote working directory |
| log | show history of all change sets in the repo |
| log -r 2 -v| show the history of changeset 2 in the repo, with verbose details |
| log -r 2:4 | show history of change sets from ranges 2 to 4
| log -p home.md  | show log of changes (patches) for specific file|
| log -v -p -r 2 or log -vpr2 | show a diff of what has changed in a specific changeset (2) |
| diff (filename) | shows differences in a file|
| status | gives you details about the repo's files that have been modified, added, or removed since the last change. The files in the response will show ? for untracked, A for added, M for modified, and R for removed.|
| tip | show the latest changset|
| tip -vp | show the latest changeset and list verbose details of the differences |
| update | pull the latest changeset into the working directory.  By default pull just brings in the changeset, but it doesn't change your working directory to the latest changeset. |
| heads | Shows the heads in the repo|
| addremove | add all files in directory, remove missing files from previous tracking. (This is the equivalent of using hg add and hg rm for all the files.)|
| merge | After you do a merge, you have to commit the merge.|
| commit -m 'Merged remote changes' ||
| add | add a file to Mercurial's working directory. You can list a filename or a directory. Or " ." to select all.|
| remove | delete the file and tell Mercurial to stop tracking it. (addremove is a way of bulk doing this.)|
| resolve --mark ||
| forget (filename) | tells Mercurial to stop tracking a file|
| branches | lists the branches created for the repo | 
| bookmarks | lists the bookmarks you have set |
| bookmark {bookmark_name} | creates a bookmark named sophia | 
| checkout {bookmark_name} | checks out the bookmark. now you're working in bookmark_name. |
| bookmark --delete {bookmark_name | deletes the bookmark |
| revert | go back to the way the files were at the last commit |

{{site.data.alerts.note}} You can add a source for all of these commands. If no source is specified, the default repo (from which the existing repo was cloned) is used. For example, pull (source) will pull from a source other than the default if specified.{{site.data.alerts.end}}

When you run `hg status`, there are various icons next to the files. 

|hg status icons | Description |

| ! | Mercurial can't find the file. You probably deleted it manually and didn't do an hg rm filename or hg addremove. 
| ? | Mercurial doesn't know anything about this file, even though it's in the same directory as other files you're tracking.
| M | you modified this file.
| A | Mercurial added this file to the list of files you're tracking. 
| R |  removed from tracking and the directory.


## General workflow

As a general worfklow:

1. Commit
2. Pull -u (or fetch)
3. Merge
4. Push


## Merge conflicts

When a conflict happens, the default merge program configured in .hgrc launches. [P4Merge](https://www.perforce.com/product/components/perforce-visual-merge-and-diff-tools) works well. 
To configure Mercurial to use p4merge, install P4Merge, and then put this into your .hgrc file (if it's not already there).

```
p4merge.executable = /Applications/p4merge.app/Contents/MacOS/p4merge
p4merge.priority = 50
p4merge.premerge = True
p4merge.gui = True
p4merge.args = $base $local $other $output
p4merge.binary = True
```

When P4Merge launches to resolve a merge conflict, you select the change you want, or add your own. Then Save. Then quit P4merge completely.

(I am not sure if you have to run `hg addremove` and then `hg resolve --mark` to mark the conflict as resolved.)

For more details, see [P4Merge](https://www.mercurial-scm.org/wiki/P4Merge).

## Binary files

P4Merge can't handle merges with binary files. However, you can run a diff to see the differences between files. You would need to clone your repository and use a different changeset for that repo. Then compare the same file in the different repos in different changesets.

## Ignoring certain files

Some files you don't want in Mercurial because they only have relevance locally. Here is the list of files to ignore to add to your .hgignore file:

```
.jekyll-metadata
 _site 
.DS_Store
.idea
```

If you forget to add certain files to your ignore list, you can add them later and apply the ignore rule retroactively. See [this stackoverflow thread](http://stackoverflow.com/questions/8129912/mercurial-and-xcuserdata-ds-store-and-git) for more details. once you make the update, run `hg forget "set:hgignore()"`.

## Merge conflicts

Here's the scenario. After you do `hg pull -u`, you get this error message:

```
abort: untracked files in working directory differ from files in requested revision
```

The problem is that you modified files in your working directory, such as adding or removing a file. Another person added or removed the same file and committed to the repo. Now when you get the latest changeset that has a discrepancy with the added/removed files, Mercurial complains.

For example, Writer A removes file apple.md from his working directory. Writer B adds file apple.md to his working directory.  Writer B commits. Now Writer A does a pull -u. At this point, Mercurial responds with the abort message listed above because Writer A's files don't match up with the incoming revision.

Theoretically, you can do an hg merge and resolve the issue. However, when I tried this, the abort message didn't go away.
Saga continued. I'm actually unclear how to resolve this. After fruitless attempts to fix it, I moved on to the nuclear option.

## Exercising the Nuclear Option

When you run into problems with Mercurial, you should try to sort it out the best you can. However, if things just won't behave, you can always exercise the nuclear option. 

1. Change the name of your "repo" to "repo-old".
2. Reclone the project.
3. Copy over the contents from repo-old into repo. (Don't copy over the .hg. idea, .DS_Store, or .hgignore files.)

Now follow the standard Commit and Push instructions here. It should fix the issue.

## Creating a Mercurial Test Playground on Your Local Machine

You can create some local Mercurial repos on your machine so you can play around with commits, merges, and other experiments.

Create a folder and initialize Mercurial in the folder:

```
hg init hgrepo
```

This creates a folder called hgrepo. This is your main repository. 

Now change into hgrepo and add a file:

```
cd hgrepo
touch mytestfile.txt
open mytestfile.txt
```

Type some text and then click Ctrl + S to save it. Then Ctrl + W to close.

Add the file to Mercurial's tracking and make a commit:

```
hg addremove
hg commit -m "my first commit"
```

Now make a couple of clones of the repo:

```
cd ../
hg clone /Users/tjohnson/projects/hgrepo hgclone1
```

and 

```
hg clone /Users/tjohnson/projects/hgrepo hgclone2
```

(Replace /Users/tjohnson/projects/hgrepo with the path to your repo.)

You should now have a file structure that looks like this:

```
hgrepo
 - mytestfile.txt
hgclone1
 - mytestfile.txt
hgclone2
 - mytestfile.txt
```

In iTerm, open two separate tabs and go into hgclone1 and hgclone2 on the different tabs. Now you can make changes to mytestfile.txt and commit and push it into the main repo.


## Stop Tracking a File
Sometimes you inadvertently add a file into Mercurial that you really don't want to track. One example is the .jekyll-metadata file that is included by default when you do incremental builds. This file is used locally to remember what changes have been made to your build and what haven't.

This file shouldn't be pushed to Mercurial because it will conflict with the content of other people's .jekyll-metadata files. You need to tell Mercurial to stop tracking the file and then add it to the ignore list.

To stop tracking a file:

```
hg forget filename.txt
```

If you run the hg addremove command, Mercurial will simply add back the file you ignored.

You should add this file to an ignore list. 

1. Go to the root directory of your jekyll project.
2. Create a file called .hgignore.
3. Add each file you want to ignore (e.g., .jekyll-metadata) on a separate line.
4. Now make sure that everyone else adds these files to their ignore list. If someone else commits a file that you've ignored, Mercurial will complain when you pull the latest revision.