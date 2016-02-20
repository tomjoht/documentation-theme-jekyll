---
title: Adding all project dependencies
tags: [getting-started]
keywords:
summary: ""
---

You want to be sure that you have all the required gems and other utilities on your computer to make the project run. Jekyll runs on Ruby, and there are various plugins for Ruby that enable different functionality. These Ruby plugins are referred to as gems, and you install the gems you need for your projects.

To manage the various gems and their versions needed for your project, you can use a package manager called Bundler. Many projects will have a gemfile in their project that lists the gems required for the project. You then run Bundler in order to automatically install the required gems and any dependencies for those gems on your machine.


## RubyGems

Make sure you have RubyGems. This should be installed by default.

Open Terminal and type `which gem`. You should get a response indicating the location of Rubygems, such as `/Users/MacBookPro/.rvm/rubies/ruby-2.2.1/bin/gem`.

If you need to install Rubygems, see [Download RubyGems](https://rubygems.org/pages/download).

## Install Bundler

[Bundler](http://bundler.io/) is a package manager for RubyGems.

You install Bundler by using the gem command with RubyGems:

```
gem install bundler
```

If you're prompted to which to superuser mode (`sudo`) to get the correct permissions to install Bundler in that directory, avoid doing this. All other applications that need to use Bundler will likely not have the needed permissions to run.


If you get a permissions error when trying to install Bundler, use Homebrew to install a Ruby package manager called rbenv.

Install Homebrew:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Use brew to install rbenv:

```
brew install rbenv
```

Initialize rbenv:

```
rbenv init
```

Log out of terminal, and then then log back in.

Install Bundler:

```
gem install bundler
```

Open the gemfile:

```
open gemfile
```

You should see some gems listed. If you don't have a gemfile, your project may not need any gems, or those gems may not be managed at the project level but rather directly installed manually. You can create a gemfile by typing `bundle init`.

Your gemfile might look like this:

```
# A sample Gemfile
source "https://rubygems.org"

# gem "rails"
gem 'github-pages'
gem 'pygments.rb'
gem 'redcarpet'
```

Use Bundler to install the needed gems:

```
bundle install
```

Finally, you can run the following to make sure the installed gems get associated or initialized with your project:

```
bundle exec jekyll serve
```