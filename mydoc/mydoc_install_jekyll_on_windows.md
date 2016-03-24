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


## Install Ruby

1. Go to [RubyInstaller for Windows](http://rubyinstaller.org/downloads/). 
2. Under **RubyInstallers**, download and install one of the Ruby installers (usually one of the first two options).
3. Double-click the downloaded file and proceed through the wizard to install it.

## Install Ruby Development Kit

1. Go to [RubyInstaller for Windows](http://rubyinstaller.org/downloads/). 
2. Under the **Development Kit** section near the bottom, download one of the **For use with Ruby 2.0 and above...** options.
3. Extract Ruby onto your **C** drive in a folder called something like **RubyDevKit**.
3. Browse to the **RubyDevKit** location on your C drive using your Command Line Prompt.
3. Type `ruby dk.rb init`
3. Type `ruby dk.rb install`

If you get stuck, see the [official instructions for installing Ruby Dev Kit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit).

## Install Bundler

1. In the downloaded theme, *delete* the existing **Gemfile** and **Gemfile.lock** files.
1. Type `gem install bundler`.
2. Browse to the documentation-jekyll-theme directory.
3. Type `bundle init`
4. Open the Gemfile in a text editor. 
5. Paste in the following: 
   
   ```
   # A sample Gemfile
   source "https://rubygems.org"
   
   gem 'wdm', '>= 0.1.0' if Gem.win_platform?
   gem 'jekyll', '~> 3.1', '>= 3.1.2'
   ```
   
6. Save and close the file.
7. Type `bundle install`.

## Serve the Jekyll site

1. Browse to the documentation-jekyll-theme directory.
2. Type `jekyll serve`
3. Go to the preview address in the browser. (Make sure you include the `/` at the end.)
