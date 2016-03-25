---
title: Install Jekyll on Windows
permalink: /mydoc_install_jekyll_on_windows/
keywords: jekyll on windows, pc, ruby, ruby dev kit
sidebar: mydoc_sidebar
---

{{site.data.alerts.tip}} For a better terminal emulator on Windows, download <a href="https://sourceforge.net/projects/console/">Console</a>. This terminal allows you to create tabs and gives you more functionality. {{site.data.alerts.end}}

## Install Ruby

First you must install Ruby because Jekyll is a Ruby-based program and needs Ruby to run. 

1. Go to [RubyInstaller for Windows](http://rubyinstaller.org/downloads/). 
2. Under **RubyInstallers**, download and install one of the Ruby installers (usually one of the first two options).
3. Double-click the downloaded file and proceed through the wizard to install it.

## Install Ruby Development Kit

Some extensions Jekyll uses require you to natively build the code using the Ruby Development Kit.

1. Go to [RubyInstaller for Windows](http://rubyinstaller.org/downloads/). 
2. Under the **Development Kit** section near the bottom, download one of the **For use with Ruby 2.0 and above...** options (either the 32-bit or 64-bit version).
3. Move your downloaded file onto your **C** drive in a folder called something like **RubyDevKit**.
4. Extract the compressed folder's contents into the folder.
5. Browse to the **RubyDevKit** location on your C drive using your Command Line Prompt.
   
   To see the contents of your current directory, type <code>dir</code>. To move into a directory, type <code>cd foldername</code>, where "foldername" is the name of the folder you want to enter. To move up a directory, type <code>cd ../</code> one or more times depending on how many levels you want to move up. To move into your user's directory, type <code>/users</code>. The <code>/</code> at the beginning of the path automatically starts you at the root.
   
6. Type `ruby dk.rb init`
7. Type `ruby dk.rb install`

If you get stuck, see the [official instructions for installing Ruby Dev Kit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit).

## Install Bundler

1. Using the command line, browse to the folder where you downloaded the Jekyll theme.
2. Delete the existing **Gemfile** and **Gemfile.lock** files:
   
   ```
   del Gemfile
   del Gemfile.lock
   ```
   
1. Install Bundler: `gem install bundler`
3. Initialize Bundler: `bundle init`
   
   This will create a new Gemfile.
   
4. Open the Gemfile in a text editor. 
   
   Typically you can open files from the Command Prompt by just typing the filename, but because Gemfile doesn't have a file extension, no program will automatically open it. You may need to use your File Explorer and browse to the directory, and then open the Gemfile in a text editor such as Notepad.
   
5. Remove the existing contents. Then paste in the following: 
   
   ```
   source "https://rubygems.org"
   
   gem 'wdm'
   gem 'jekyll'
   ```
   The [wdm gem](https://rubygems.org/gems/wdm/versions/0.1.1) allows for the polling of the directory and rebuilding of the Jekyll site when you make changes. This gem is needed for Windows users, not Mac users. 
   
   
6. Save and close the file.
7. Type `bundle install`.
   
   Bundle retrieves all the needed gems and gem dependencies and downloads them to your computer. At this time, Bundle also takes a snapshot of all the gems used in your project and creates a Gemfile.lock file to store this information.

## Serve the Jekyll site

1. Browse to the jekyll theme directory.
2. Type `jekyll serve`
3. Go to the preview address in the browser. (Make sure you include the `/` at the end.)
   
   Unfortunately, the Command Prompt doesn't allow you to easily copy and paste the URL, so you'll have to type it manually.
   
## Troubleshooting

Bundler retrieves the latest version of the jekyll gem that is compatible with the github-pages gem. Unfortunately, in my testing, I think that version of the jekyll gem has some issues with the kramdown gem. Later versions of the jekyll gem fix the kramdown compatibility issues. If you run into this issue, let me know (especially if you solved it).
