---
title: Install Jekyll on Windows
permalink: mydoc_install_jekyll_on_windows.html
keywords: jekyll on windows, pc, ruby, ruby dev kit
sidebar: mydoc_sidebar
folder: mydoc
---

{% include tip.html content="For a better terminal emulator on Windows, use [Git Bash](https://git-for-windows.github.io/). Git Bash gives you Linux-like control on Windows." %}

## Install Ruby and Ruby Development Kit

First you must install Ruby because Jekyll is a Ruby-based program and needs Ruby to run.

1. Go to [RubyInstaller for Windows](http://rubyinstaller.org/downloads/).
2. Under **RubyInstallers**, download and install one of the Ruby installers under the **WITH DEVKIT** list (usually the recommended/highlighted option).
3. Double-click the downloaded file and proceed through the wizard to install it. Run the `ridk install` step on the last stage of the installation wizard. 
4. Open a new command prompt window or Git Bash session.

<h2 id="bundler">Install the Jekyll gem</h2>

At this point you should have Ruby and Rubygem on your machine.

Now use `gem` to install Jekyll:

```
gem install jekyll
```

You can now use Jekyll to create new Jekyll sites following the quick-start instructions on [Jekyllrb.com](http://jekyllrb.com).

## Installing dependencies through Bundler

Some Jekyll themes will require certain Ruby gem dependencies. These dependencies are stored in something called a Gemfile, which is packaged with the Jekyll theme. You can install these dependencies through Bundler. (Although you don't need to install Bundler for this Documentation theme, it's a good idea to do so.)

[Bundler](http://bundler.io/) is a package manager for RubyGems. You can use it to get all the gems (or Ruby plugins) that you need for your Jekyll project.

You install Bundler by using the gem command with RubyGems:


## Install Bundler

1. Browse to the directory where you downloaded the Documentation theme for Jekyll.
2. Delete or rename the existing `Gemfile` and `Gemfile.lock` files.
3. Install Bundler: `gem install bundler`
4. Initialize Bundler: `bundle init`

   This will create a new Gemfile.

3. Open the Gemfile in a text editor.

   Typically you can open files from the Command Prompt by just typing the filename, but because Gemfile doesn't have a file extension, no program will automatically open it. You may need to use your File Explorer and browse to the directory, and then open the Gemfile in a text editor such as Notepad.

4. Remove the existing contents. Then paste in the following:

   ```
   source "https://rubygems.org"

   gem 'wdm'
   gem 'jekyll'
   ```
   The [wdm gem](https://rubygems.org/gems/wdm/versions/0.1.1) allows for the polling of the directory and rebuilding of the Jekyll site when you make changes. This gem is needed for Windows users, not Mac users.

5. Save and close the file.
6. Type `bundle install`.

   Bundle retrieves all the needed gems and gem dependencies and downloads them to your computer. At this time, Bundle also takes a snapshot of all the gems used in your project and creates a Gemfile.lock file to store this information.

## Git Clients for Windows

Although you can use the default command prompt with Windows, it's recommended that you use [Git Bash](https://git-for-windows.github.io/) instead. The Git Bash client will allow you to run shell scripts and execute other Unix commands. 

## Serve the Jekyll Documentation theme

1. Browse to the directory where you downloaded the Documentation theme for Jekyll.
2. Type `jekyll serve`
3. Go to the preview address in the browser. (Make sure you include the `/` at the end.)

   Unfortunately, the Command Prompt doesn't allow you to easily copy and paste the URL, so you'll have to type it manually.

## Resolving Github Metadata errors {#githuberror}

After making an edit, Jekyll auto-rebuilds the site. If you have the Gemfile in the theme with the github-pages gem, you may see the following error:

```
GitHub Metadata: No GitHub API authentication could be found. Some fields may be missing or have incorrect data.
```

If so, you will need to take some additional steps to resolve it. (Note that this error only appears if you have the github-pages gem in your gemfile.) The resolution involves adding a Github token and a cert file.

See this post on [Knight Codes](http://knightcodes.com/miscellaneous/2016/09/13/fix-github-metadata-error.html) for instructions on how to fix the error. You basically generate a personal token on Github and set it as a system variable. You also download a certification file and set it as a system variable. This resolves the issue.

{% include links.html %}
