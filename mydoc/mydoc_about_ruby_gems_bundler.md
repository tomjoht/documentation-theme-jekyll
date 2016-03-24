---
title: About Ruby, Gems, Bundler, and other Prerequisites
tags: [getting_started, troubleshooting]
keywords:
summary: "Ruby is a programming language you must have on your computer in order to build Jekyll locally. Ruby has various gems (or plugins) that provide various functionality. Each Jekyll project usually requires certain gems."
sidebar: mydoc_sidebar
permalink: /mydoc_about_ruby_gems_etc/
---

## About Ruby

Jekyll runs on Ruby, a programming language. You have to have Ruby on your computer in order to run Ruby-based programs like Jekyll. Ruby is installed on the Mac by default, but you must add it to Windows. 

## About Ruby Gems

Ruby has a number of plugins referred to as "gems." Just because you have Ruby doesn't mean you have all the necessary Ruby gems that your program needs to run. Gems provide additional functionality for Ruby programs. There are literally *millions* of [Rubygems](https://rubygems.org/) available for you to use.

Some gems depend on other gems for functionality. For example, the Jekyll gem might depend on 20 other gems that must also be installed. 

Each gem has a version associated with it, and not all gem versions are compatible with each other. 

## Rubygem package managers
 
[Bundler](http://bundler.io/) is a gem package manager for Ruby, which means it goes out and gets all the gems you need for your Ruby programs. If you tell Bundler you need the Jekyll gem, it will retrieve all the dependencies on the Jekyll gem as well -- automatically. 

Not only does Bundler retrieve the right gem dependencies, but it's smart enough to retrieve the right versions of each gem. For example, if you get the [github-pages](https://rubygems.org/gems/github-pages) gem, it will retrieve all of these other gems:

```
github-pages-health-check = 1.1.0
jekyll = 3.0.3
jekyll-coffeescript = 1.0.1
jekyll-feed = 0.4.0
jekyll-gist = 1.4.0
jekyll-github-metadata = 1.9.0
jekyll-mentions = 1.1.2
jekyll-paginate = 1.1.0
jekyll-redirect-from = 0.10.0
jekyll-sass-converter = 1.3.0
jekyll-seo-tag = 1.3.2
jekyll-sitemap = 0.10.0
jekyll-textile-converter = 0.1.0
jemoji = 0.6.2
kramdown = 1.10.0
liquid = 3.0.6
mercenary ~> 0.3
rdiscount = 2.1.8
redcarpet = 3.3.3
RedCloth = 4.2.9
rouge = 1.10.1
terminal-table ~> 1.
```

Note that Bundler goes out and retrieves not only the gem, but the right version of the gem. 

You'll see here that the github-pages gem requires version 3.0.3 of the jekyll gem. 

However, the latest version of the jekyll gem is 3.1.2. This means that github-pages is compatible with only an older version of the jekyll gem.
 
Trying to keep track of which gems and versions are appropriate for your project can be a nightmare. This is the problem Bundler solves. They [explain](http://bundler.io/):
 
> Bundler provides a consistent environment for Ruby projects by tracking and installing the exact gems and versions that are needed. 
>
> Bundler is an exit from dependency hell, and ensures that the gems you need are present in development, staging, and production. Starting work on a project is as simple as bundle install.

## Gemfiles

Bundler looks in a project's "Gemfile" (no file extension) to see which gems are required by the project. The Gemfile lists the source and then any gems, like this:
 
```
source "https://rubygems.org"

gem 'github-pages'
gem 'jekyll'
```

The source indicates the site where Bundler will retrieve the gems: https://rubygems.org.

The gems it retrieves are listed separately on each line. 

Here no versions are specified. Sometimes gemfiles will specify the versions like this:

```
gem 'kramdown', '1.0'
```

This means Bundler should get version 1.0 of the kramdown gem.

To specify a subset of versions, the Gemfile looks like this:

```
gem 'jekyll', '~> 2.3'
```
The `~>` sign means greater than or equal to the last digit before the last period in the number. 

Here it will get any gem equal to 2.3 but less than 3.0.

If it adds another digit, the scope is affected:

```
gem `jekyll`, `~>2.3.1'
```

This means to get any gem equal to 2.3.1 but less than 2.4.

If it looks like this:

```
gem 'jekyll', '~> 3.0', '>= 3.0.3'
```

This will get any Jekyll gem between versions 3.0 and up to 3.0.3.

See this [Stack Overflow post](http://stackoverflow.com/questions/5170547/what-does-tilde-greater-than-mean-in-ruby-gem-dependencies) for more details.

