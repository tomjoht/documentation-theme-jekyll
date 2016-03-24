---
title: Install Jekyll on Windows
permalink: /mydoc_install_jekyll_on_windows/
keywords: jekyll on windows, pc, ruby, ruby dev kit
sidebar: mydoc_sidebar
---

{% comment %} 

## Install Chocolately

1. Go to **Start** and type **cmd**.
2. Right-click the Command Line Prompt and select **Run as Administrator.**
3. Copy the following code: 

   ```
   @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
   ```
4. Right-click in the Command Line Prompt and select **Paste**.
5. Press **Enter**.
6. Close the Command Line Prompt.

## Install Ruby

1. Go to **Start** and type **cmd**.
2. Right-click the Command Line Prompt and select **Run as Administrator.**
3. Type the following:
   
   ```
   choco install ruby -y
   ```
3. Press **Enter**.
4. Close the Command Line Prompt. 

{% endcomment %}

{{site.data.alerts.tip}} For a better terminal emulator on Windows, download <a href="https://sourceforge.net/projects/console/">Console</a>. This terminal allows you to create tabs and gives you more functionality. {{site.data.alerts.end}}

## Install Ruby

1. Go to [RubyInstaller for Windows](http://rubyinstaller.org/downloads/). 
2. Under **RubyInstallers**, download and install one of the Ruby installers (usually one of the first two options).
3. Double-click the downloaded file and proceed through the wizard to install it.

## Install Ruby Development Kit

1. Go to [RubyInstaller for Windows](http://rubyinstaller.org/downloads/). 
2. Under the **Development Kit** section near the bottom, download one of the **For use with Ruby 2.0 and above...** options (either the 32-bit or 64-bit version).
3. Move your downloaded file onto your **C** drive in a folder called something like **RubyDevKit**.
4. Extract the compressed folder's contents into the folder.
5. Browse to the **RubyDevKit** location on your C drive using your Command Line Prompt.
   
   {{site.data.alerts.tip}} To see the contents of your current directory, type <code>dir</code>. To drill into a directory, type <code>cd foldername</code>, where "foldername" is the name of the folder you want to enter. To move up a directory, type <code>cd ../</code>. To move into your user's directory, type <code>/users</code>.{{site.data.alerts.end}}
   
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
   
4. Open the Gemfile in a text editor. You may need to use your File Explorer and browse to the directory, and then open the Gemfile in a text editor such as Notepad.
   
5. Remove the existing contents and paste in the following: 
   
   ```
   source "https://rubygems.org"
   
   gem 'wdm'
   gem 'jekyll'
   ```
   
6. Save and close the file.
7. Type `bundle install`.

## Serve the Jekyll site

1. Browse to the jekyll theme directory.
2. Type `jekyll serve`
3. Go to the preview address in the browser. (Make sure you include the `/` at the end.)
