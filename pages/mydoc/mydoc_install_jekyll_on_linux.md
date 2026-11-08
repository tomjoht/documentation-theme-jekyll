---
title: Install Jekyll on Linux
tags: [getting_started, troubleshooting]
keywords: linux, ubuntu, debian, fedora, ruby, install
summary: "On Linux, install Ruby and its build tools from your distribution's package manager, set up a gem folder in your home directory, and then use Bundler to install the gems the theme needs."
sidebar: mydoc_sidebar
permalink: mydoc_install_jekyll_on_linux.html
folder: mydoc
---

## Install Ruby

The theme needs Ruby 3.0 or later, plus the compilers that some gems use when they install. The package names depend on your distribution.

On Ubuntu or Debian:

```
sudo apt-get install ruby-full build-essential zlib1g-dev git
```

On Fedora:

```
sudo dnf install ruby ruby-devel openssl-devel redhat-rpm-config gcc-c++ @development-tools git
```

Check the version with `ruby -v`. If your distribution ships an older Ruby, a version manager such as [rbenv](https://github.com/rbenv/rbenv) or [chruby](https://github.com/postmodern/chruby) can install a newer one alongside it.

## Install gems in your home directory

Avoid installing gems with `sudo`. Instead, tell RubyGems to use a folder in your home directory by adding these lines to ~/.bashrc (or ~/.zshrc if you use zsh):

```
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
```

Then reload the file:

```
source ~/.bashrc
```

## Install Bundler and the theme's gems

Install Bundler:

```
gem install bundler
```

Then change directories (`cd`) to the theme's folder, install the gems listed in the Gemfile, and start the preview server:

```
bundle install
bundle exec jekyll serve
```

Open [http://127.0.0.1:4000](http://127.0.0.1:4000) in your browser to see the site.

## More information

For other distributions, see the [Jekyll on Linux](https://jekyllrb.com/docs/installation/other-linux/) and [Jekyll on Ubuntu](https://jekyllrb.com/docs/installation/ubuntu/) pages in the Jekyll documentation. If you'd rather not install Ruby at all, you can [run the site in Docker](index.html#docker).

{% include links.html %}
