---
title: Gemfiles
permalink: /gemfiles/
tags: plugins
---

it's pretty critical to set up your gemfile correctly and to understand what gems are all about -- this topic deserves more importance....

This isn't specific to Jekyll but rather common for Ruby applications in general, so you won't find much about Gemfiles on Jekyll's site specifically. 

here's the basic idea: ruby code chunks are called gems. you use bundler to install and manage the gems. the gems are specific to your own project, which avoids dependency issues when you share projects with other devs who may have diff versions of these gems.

## Create a gemfile

`cd` to your jekyll directory
`bundle init`
`ls` to see the new Gemfile
`subl Gemfile` to open up the gemfile. or type open Gemfile.
add the gems you want, such as `gem 'github-pages'
make sure you leave the rubygem source there (`source "https://rubygems.org"`)
now type `bundle install`
bundle will install all the gems you need for your project and add the specific versions in the gemfile.

some plugins are executed when you type `exec bundle`, such as the api gem. this is key to know. you are executing a script through bundle. with these setups, you don't have separate plugin files.

bundle also adds a gemfile.lock file to ensure that other devs don't change your gemfile and mess up your project.

in general, you will add gem references to your gemfile, and then run `bundler` to have bundle go and fetch the needed gems for your project. this way when you share the project, people just have to type `bundle` or `bundle install` in order to get all the dependencies they need. 

in contrast, if you start installing gems yourself, then when you share your project, the gems may not be available for the person and things will break. so never install a gem yourself. put it in your project file and make sure your users have bundler to go out and get the resources.

i think bundle and bundle install are the same commands.


one gotcha with Gemfiles is that you may have certain versions of gems that aren't compatible with other gems. so be careful. 

Conversion error: Jekyll::Converters::Scss encountered an error while converting 'stylesheets/jboot.scss':
                    Invalid CSS after " $theme-color: ": expected expression (e.g. 1px, bold), was "$;" on line 48