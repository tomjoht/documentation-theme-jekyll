---
title: Install Jekyll on Mac
tags: [getting_started, troubleshooting]
keywords: mac, macos, homebrew, ruby, chruby, install
summary: "The version of Ruby that comes with macOS is too old for current gems, and you shouldn't install gems into it anyway. Install a newer Ruby with Homebrew, and then use Bundler to install the gems the theme needs."
sidebar: mydoc_sidebar
permalink: mydoc_install_jekyll_on_mac.html
folder: mydoc
---

## Why not use the Ruby that comes with macOS?

macOS includes an old version of Ruby (2.6) that Apple has deprecated. It's too old for current versions of Jekyll and its gems. Additionally, it's owned by the system, so installing gems into it requires `sudo` and leads to errors like this:

```
ERROR:  While executing gem ... (Gem::FilePermissionError)
  You don't have write permissions for the /Library/Ruby/Gems/2.6.0 directory.
```

Instead of changing permissions on the system Ruby, install a separate, newer Ruby that you own.

## Install Homebrew

[Homebrew](https://brew.sh) is a package manager for the Mac. To install it, open Terminal and run the command shown on the Homebrew home page:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

If you already have Homebrew, update it:

```
brew update
```

## Install Ruby

The theme needs Ruby 3.0 or later. Install Ruby with Homebrew:

```
brew install ruby
```

Homebrew doesn't put this Ruby ahead of the system Ruby on your path, so add it yourself. Add these lines to ~/.zshrc (the default shell on macOS is zsh). On an Intel Mac, replace `/opt/homebrew` with `/usr/local`.

```
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(gem env gemdir)/bin:$PATH"
```

Open a new Terminal window and check the version:

```
ruby -v
```

You should see Ruby 3.x. If you see 2.6, the path change didn't take effect.

{% include tip.html content="If you work on several Ruby projects, a version manager such as <a href='https://github.com/postmodern/chruby'>chruby</a> or <a href='https://github.com/rbenv/rbenv'>rbenv</a> lets you switch between Ruby versions. The <a href='https://jekyllrb.com/docs/installation/macos/'>Jekyll on macOS</a> guide shows how to set up chruby." %}

## Install Bundler and the theme's gems {#bundler}

Recent versions of Ruby include Bundler. If yours doesn't, install it:

```
gem install bundler
```

Don't use `sudo` for this or any other `gem` command. If you get a permissions error, you're still using the system Ruby.

Then change directories (`cd`) to the theme's folder, install the gems listed in the Gemfile, and start the preview server:

```
bundle install
bundle exec jekyll serve
```

Open [http://127.0.0.1:4000](http://127.0.0.1:4000) in your browser to see the site. For more about what Bundler does, see [About Ruby, Gems, Bundler, etc.][mydoc_about_ruby_gems_etc]

## "No GitHub API authentication" warning {#githuberror}

When you build the site, you may see this message:

```
GitHub Metadata: No GitHub API authentication could be found. Some fields may be missing or have incorrect data.
```

The message comes from the jekyll-github-metadata plugin, which the github-pages gem includes. The theme doesn't use any of the data that plugin fetches, so you can ignore the message. If you want to get rid of it, [create a personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) on GitHub (it doesn't need any scopes) and add it to ~/.zshrc:

```
export JEKYLL_GITHUB_TOKEN=your_token_here
```

{% include links.html %}
