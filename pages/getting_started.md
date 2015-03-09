---
title: Getting started
permalink: /getting_started/
---

## Prerequisites

* Ruby. This should already be installed. Type `which ruby` to confirm. 
* [Rubygems](https://rubygems.org/pages/download). This is a package manager for Ruby (gems).
* [Git](http://git-scm.com/download/mac). Type `which git` to see if you already have it installed.
* Jekyllrb. To install: `gem install jekyll`
* text editor (e.g., [Sublime Text](http://www.sublimetext.com/))
* [iTerm](http://iterm.sourceforge.net/) - optional but recommended instead of Terminal. 
* Mac computer (recommended). If you have a PC, you need to see [Jekyll on Windows](http://jekyllrb.com/docs/windows/)

{{calloutdanger}} These instructions are designed for users on Macs. Jekyllrb works on Windows but is not officially supported on that platform. See <a href="Jekyll on Windows">http://jekyllrb.com/docs/windows/</a> for more details. {{end}}

## Get set up

{{alertprimary}}

If you have just one project, do the following. In these instructions, I'll assume your project's name is "acme."

1. Using your terminal prompt, go to the directory where you want to install the project. I like using ~[username]/projects, because ~[username] is the default directory that appears when you open Terminal on a Mac.
2. git clone `https://github.com/tomjohnson1492/documentation-theme-jekyll.git .`
3. Rename the documentation-theme-jekyll folder to acme.
4. Open _config.yml and customize all the values based on the instructions in that file.
5. Add your pages inside the Pages folder. (Subfolders and sub-subfolders inside Pagess is all right.)
5. Inside _data, open sidebar.yml and topnav.yml to customize the navigation.
6. Build your site with `jekyll serve`. 


## Questions

If you have questions, contact me at tomjohnson1492@gmail.com. My regular site is [http://idratherbewriting.com](idratherbewriting.com). 

This theme is still under ongoing development.


