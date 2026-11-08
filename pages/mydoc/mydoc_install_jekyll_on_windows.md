---
title: Install Jekyll on Windows
permalink: mydoc_install_jekyll_on_windows.html
keywords: jekyll on windows, pc, ruby, rubyinstaller, devkit
summary: "On Windows, install Ruby with RubyInstaller (including the DevKit), and then use Bundler to install the gems the theme needs."
sidebar: mydoc_sidebar
folder: mydoc
---

## Install Ruby

Jekyll is a Ruby program, so you need Ruby first. The theme needs Ruby 3.0 or later.

1.  Go to the [RubyInstaller downloads page](https://rubyinstaller.org/downloads/).
2.  Download the recommended installer from the **WITH DEVKIT** list. The DevKit includes the compilers that some gems need when they install.
3.  Run the installer and accept the defaults. On the last screen, leave the `ridk install` option selected.
4.  When a command window opens and asks which components to install, press **Enter** to accept the default (MSYS2 and the MINGW development toolchain).
5.  Open a new command prompt and check the version with `ruby -v`.

## Install Bundler and the theme's gems {#bundler}

Recent versions of Ruby include Bundler. If yours doesn't, install it:

```
gem install bundler
```

Then change directories (`cd`) to the theme's folder, install the gems listed in the Gemfile, and start the preview server:

```
bundle install
bundle exec jekyll serve
```

Open [http://127.0.0.1:4000](http://127.0.0.1:4000) in your browser to see the site.

The theme's Gemfile already includes the Windows-only gems that Jekyll needs, such as wdm (which watches for file changes) and tzinfo-data (time zone data), so you don't need to edit it.

## Use Git Bash for shell scripts

The theme includes shell scripts such as pdf-mydoc.sh, which don't run in the Windows command prompt. To run them, use [Git Bash](https://gitforwindows.org/), which comes with Git for Windows, or the Windows Subsystem for Linux.

## "No GitHub API authentication" warning {#githuberror}

When you build the site, you may see this message:

```
GitHub Metadata: No GitHub API authentication could be found. Some fields may be missing or have incorrect data.
```

The message comes from the jekyll-github-metadata plugin, which the github-pages gem includes. The theme doesn't use any of the data that plugin fetches, so you can ignore the message. If you want to get rid of it, [create a personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) on GitHub (it doesn't need any scopes) and set it as a user environment variable named `JEKYLL_GITHUB_TOKEN`.

For more details, see [Jekyll on Windows](https://jekyllrb.com/docs/installation/windows/) in the Jekyll documentation.

{% include links.html %}
