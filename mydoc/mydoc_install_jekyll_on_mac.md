---
title: Install Jekyll on Mac
tags: [getting_started, troubleshooting]
keywords:
summary: "Installation of Jekyll on Mac is usually less problematic than on Windows. However, you may run into permissions issues with Ruby that you must overcome. You should also use Bundler to be sure that you have all the required gems and other utilities on your computer to make the project run. "
sidebar: mydoc_sidebar
permalink: /mydoc_install_jekyll_on_mac/
---

## Ruby and RubyGems

Ruby and [RubyGems](https://rubygems.org/pages/download) are usually installed by default on Macs. Open your Terminal and type `which ruby` and  `which gem` to confirm that you have Ruby and Rubygems. You should get a response indicating the location of Ruby and Rubygems.
 
If you get responses that look like this:

```
/usr/local/bin/ruby
```

and 

```
/usr/local/bin/gem
```

Great! Skip down to the [Bundler](#bundler) section.
 
However, if your location is something like `/Users/MacBookPro/.rvm/rubies/ruby-2.2.1/bin/gem`, which points to your system location of Rubygems, you will likely run into permissions errors when trying to get a gem. A sample permissions error (triggered when you try to install the jekyll gem such as `gem install jekyll`) might look like this for Rubygems:
 
```
 >ERROR:  While executing gem ... (Gem::FilePermissionError)
  You don't have write permissions for the /Library/Ruby/Gems/2.0.0 directory.
```  
  
Instead of changing the write permissions on your operating system's version of Ruby and Rubygems (which could pose security issues), you can install another instance of Ruby (one that is writable) to get around this.

## Install Homebrew

Homebrew is a package manager for the Mac, and you can use it to install an alternative instance of Ruby code. To install Homebrew, run this command:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

If you already had Homebrew installed on your computer, be sure to update it:

```
brew update
```

## Install Ruby through Homebrew

Now use Homebrew to install Ruby:

```
brew install ruby
```

Log out of terminal, and then then log back in. 

When you type `which ruby` and `which gem`, you should get responses like this:

```
/usr/local/bin/ruby
```

And this:

```
/usr/local/bin/gem
```

Now Ruby and Rubygems are installed under your username, so these directories are writeable.

Note that if you don't see these paths, try restarting your computer or try installing rbenv, which is a Ruby version management tool. If you still have issues getting a writeable version of Ruby, you need to resolve them before installing Bundler.

<h2 id="bundler">Install Bundler</h2>

At this point you should have a writeable version of Ruby on your machine. Now you need to get all the gems (or Ruby plugins) that you need for your Jekyll project. [Bundler](http://bundler.io/) is a package manager for RubyGems.

You install Bundler by using the gem command with RubyGems:

```
gem install bundler
```

If you're prompted to switch to superuser mode (`sudo`) to get the correct permissions to install Bundler in that directory, avoid doing this. All other applications that need to use Bundler will likely not have the needed permissions to run.

## Customize the Gemfile

Bundler goes out and retreives all the gems that are specified in your project's Gemfile. If you have a gem that depends on other gems to work, Bundler will go out and retrieve all of the dependencies as well. (To learn more about Bundler, see {{site.data.urls.mydoc_about_ruby_gems_etc.link}}.

Open the Gemfile (in any text editor) in the Jekyll doc theme project:

```
open Gemfile
```

The theme's gemfile looks as follows:

```
# A sample Gemfile
source "https://rubygems.org"

# gem "rails"
gem 'github-pages'
gem 'jekyll'
```

If you're publishing on Github Pages, leave the `github-pages` gem there. But if not, remove `github-pages` because Github sometimes has dependencies that conflict with the latest versions of the Jekyll gem and Kramdown, which can be frustrating.

Use Bundler to install all the needed Ruby gems:

```
bundle install
```

Now run Jekyll serve to build the theme:

```
jekyll serve
```