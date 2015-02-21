---
title: Getting started
permalink: /getting_started/
---
{% include_relative reuse/variables.html %}

## Prerequisites

* [Git](http://git-scm.com/download/mac). Type `which git` to see if you already have it installed.
* Jekyllrb. To install: `gem install jekyll`
* Ruby. This should already be installed. Type `which ruby` to confirm. 
* [Rubygems](https://rubygems.org/pages/download). This is a package manager for Ruby plugins (gems).
* text editor (e.g., [Sublime Text](http://www.sublimetext.com/))
* [iTerm](http://iterm.sourceforge.net/) - recommended instead of Terminal. 
* Mac computer (recommended). If you have a PC, you need to see [Jekyll on Windows](http://jekyllrb.com/docs/windows/)

{{calloutdanger}} These instructions are designed for users on Macs. Jekyllrb works on Windows but is not officially supported on that platform. See [Jekyll on Windows](http://jekyllrb.com/docs/windows/) for more details. {{end}}

## Get set up

If you have just one project, do the following:

1. `mkdir acme` (assuming you want to call your program "acme")
2. `cd acme`.
3. git clone `https://github.com/tomjohnson1492/jekyll-doc.git .`
4. Open _config.yml and customize all the values inside.
5. Add your pages inside the Pages folder.
5. Inside _data, open sidebar.yml and topnav.yml to customize the navigation.
6. Build your site with `jekyll serve`. 

If you have multiple projects (meaning you will be generating multiple outputs from the same site files) do the following:

1. `mkdir acme`
2. `cd acme`.
3. git clone `https://github.com/tomjohnson1492/jekyll-doc.git .`
4. Inside configurations, rename config_jekyll-doc.yml to config_acme.yml.
5. Open config_acme.yml and customize all the values inside.
6. In the root directory, rename and customize jekyll-doc.sh to point to the config_acme.yml file inside the configurations folder.
7. Repeat steps 4-7 for as many projects as you have -- essentially create separate configuration files for each unique site you want to create.

If you have radically separate projects with no overlapping content, just create separate directories for each project.


## Create a page

Use a text editor such as Sublime Text to create pages. Make sure each page has frontmatter at the top like this:

```
---
title: Getting started
permalink: /getting_started/
tags: newbies
---
```

Frontmatter is always formatted with three hyphens at the top and bottom. You must have a `title` and `permalink` value. The `tags` is optional. To add multiple tags, add them with brackets, like this: `tags: [newbies, implementation]`.

Pages can be either Markdown or HTML format. If you use Markdown, you can also include HTML formatting where needed. But not vice versa -- if you use HTML (as your file extension), you can't insert Markdown content. 

Store pages inside the pages folder. 

## Create a link

There are several ways to create links. 

Markdown link pointing to an external site:

```
[Google](http://google.com)
```
Markdown link pointing to an internal site:

```
[Syntax Highlighting]({{ "/tutorial_syntax_highlighting" | prepend: site.baseurl }})
```

HTML link pointing to an internal site:

```
<a href="{{ "/tutorial_syntax_highlighting" | prepend: site.baseurl }}">Syntax Highlighting</a>
```

You can also store a link in a reuse file so it's easy to reuse the link. This method allows you to reuse the link; it also gets the page's title.

First, inside pages/reuse/links.html, add the following:
    
{% raw %}
```
{% capture syntax_highlighting %}
{% for page in site.pages %}{% if page.permalink == '/syntax_highlighting/' %}<a href="{{ "/syntax_highlighting" | prepend: site.baseurl }}">{{page.title}}</a>{% break %}{% endif %}{% endfor %}
{% endcapture %}
```
{% endraw %}
    
Then use `{{ syntax_highlighting }}` where you want to insert the link.

If you ever change the permalink, you can just update your links file to change the permalink, and all references pointing to the keyword you're using will be updated. 

Even though you may group pages into subfolders, when you reference a page, you reference it by the permalink regardless of the subfolder it happens to be in. So even if you have formatting/syntax_highlighting, you link to it with `syntax_highlighting` instead of `formatting/syntax_highlighting` because that's the topic's permalink. Jekyll iterates through all pages in the page namespace to locate one that contains the matching permalink. 

Note that to include any content from your reuse directory, you must add this on each page:

{% raw %}
```
{% include_relative reuse/variables.html %}
```
{% endraw %}

## Create an image

Put images inside the `images` folder in your root directory. You can create subdirectories inside this directory.

Markdown image: 

{% raw %}
```
![Sample Wiki Image]({{ "{{site.baseurl}}/images/samplewiki.png" | prepend: site.baseurl }})
```
{% endraw %}

HTML image:

{% raw %}
```
<img src="{{ "/images/samplewiki.png" | prepend: site.baseurl }}">
```
{% endraw %}


## Syntax highlighting

For syntax highlighting, use fenced code blocks optionally followed by the language syntax you want:

```
```ruby
    def foo
      puts 'foo'
    end
```
```

Fenced code blocks require a blank line before and after.

You can also use the `highlight` command with Liquid markup:

{% raw %}
```
{% highlight ruby %}
    def foo
      puts 'foo'
    end
{% endhighlight %}
```
{% endraw %}

## Pages versus posts

Most of the theme is designed for using pages, but you can also use posts. Posts are intended for blog entries. They have dates in the filenames, and they sort chronologically when get the posts. Create posts inside the _posts folder.

The latest_posts.html file shows the latest posts. The tagindex.html file sorts posts by tags. The archive.html sorts posts by date.

## Comments

Disqus, a commenting system, is integrated into the theme. In the configuration file, specify the Disqus code for the universal code, and Disqus will appear. If you don't add a Disqus value, the Disqus code isn't included.

## Google Analytics

Google Analytics is included. Similar to Disqus, add your Google Analytics identifier in the configuration file. If not provided, the Google Analytics isn't included.

## Customizing the sidebar and topnav

The sidebar and top navigation bar read their values from yml files inside the _data folder. Follow the YML syntax shown in the file. You can only nest content two levels, not three. If you want the URL to point to an external site, use <code>external&#95;url</code> instead of `url`.

The sidebar.yml file also includes a value that lets you choose whether to use the accordion feature in the sidebar or not.

## Excluding folders

By default, all files in your project are included in your output. To exclude files, note them in the `exclude` section in the configuration file. If you have different outputs for your site, you'll want to customize the exclude sections in your different configuration files.

If you're working on a draft, put it inside the pages/drafts folder. Specify in your `exclude` section in the configuration file that this folder should be excluded. You can also create a folder called `_drafts` in the root directory. Content inside `_drafts` will automatically be excluded from builds by Jekyll.

## Custom styles and scripts

You can specify custom stylesheets and JS scripts for each project. Assuming you have multiple configuration files (one per project), put custom stylesheets inside the css folder, and custom scripts inside the js folder. In the configuration file, specify the names of the stylesheets or js files in the `project_css` and `project_js` values.

## FAQ page

See the faq.html page for an example of the FAQ format. This code is from Bootstrap.

## Homepage and footer

Because you may be creating multiple outputs from the same source files, I separate out the homepage and footer. For your homepage, put `id: homepage` in the frontmatter a page (make sure only one page in the project has it -- exclude any others). The footer is pulled in through the `id: footer` in the frontmatter.

## Search

The search is configured through the search.json file. If you want to exclude a page from search add `search: exclude` in the frontmatter. 

## Questions

If you have questions, contact me at tomjohnson1492@gmail.com. My regular site is [http://idratherbewriting.com](idratherbewriting.com). 

This theme is still under ongoing development.


