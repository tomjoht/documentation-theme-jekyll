---
title: Getting started
permalink: /getting_started/
---
{% include_relative reuse/variables.html %}

## Prerequisites

* Git 
* Jekyll
* Ruby
* text editor (e.g., Sublime Text)
* iTerm
* Mac computer (recommended)

## Get set up

If you have just one project, do the following:

1. `mkdir acme`.
2. `cd acme`.
3. git clone `https://github.com/tomjohnson1492/jekyll-doc.git .`
4. Open _config.yml and customize all the values inside.
5. Add your pages inside the Pages folder.
5. Inside _data, open sidebar.yml and topnav.yml to customize the navigation.
6. Build your site with `jekyll serve`. 

If you have multiple projects, do the following:

1. `mkdir acme`
2. `cd acme`.
3. git clone `https://github.com/tomjohnson1492/jekyll-doc.git .`
4. Inside configurations, rename config_jekyll-doc.yml to config_acme.yml.
5. Open config_acme.yml and customize all the values inside.
6. In the root directory, rename and customize jekyll-doc.sh to point to the config_acme.yml file inside the configurations folder.
7. Repeat steps 4-7 for as many projects as you have -- create separate configuration files for each unique site you want to create.

If you have radically separate projects with no overlapping content, just create separate directories for each project.

## Include re-used components

{% include_relative reuse/variables.html %}

## Create a link


```
[Google](http://google.com)
```

```
[Syntax Highlighting]({{ "/tutorial_syntax_highlighting" | prepend: site.baseurl }})
```

```
<a href="{{ "/tutorial_syntax_highlighting" | prepend: site.baseurl }}">Syntax Highlighting</a>
```


{% raw %}
```
{% capture syntax_highlighting %}
{% for page in site.pages %}{% if page.permalink == '/syntax_highlighting/' %}<a href="{{ "/syntax_highlighting" | prepend: site.baseurl }}">{{page.title}}</a>{% break %}{% endif %}{% endfor %}
{% endcapture %}
```
{% endraw %}

Then use `{{ syntax_highlighting }}` where you want to insert the link.


## Create an image

```
![Sample Wiki Image]({{ "{{site.baseurl}}/images/web/samplewiki.png" | prepend: site.baseurl }})
```

```
<img src="{{ "/images/web/samplewiki.png" | prepend: site.baseurl }}">
```

## Insert a callout

{% raw %}
```
{% capture calloutdanger %}
<div class="bs-callout bs-callout-danger">
{% endcapture %}
```
{% endraw %}

{% raw %}
```
{% capture end %}
</div>
{% endcapture %}
```
{% endraw %}

{% raw %}
```
{{calloutdanger}}
<h4>This is a warning</h4>whatever you do, do not trip while getting off a skyscraper's viewpoint platform.
{{end}}
{% endraw %}
```



## Create a page

Make sure each page has frontmatter like this:

```
---
title: Getting started
permalink: /getting_started/
tags: newbies
---
```

## Reuse a note

{% raw %}
```
{% capture warning_message %}
Lock the door before you leave the building.
{% endcapture %}
```
{% endraw %}


Then use {% raw %}```{{ warning_message }}```{% endraw %} where you want to embed it.

## Add conditional filtering

{% raw %}
```
{% if site.audience == "web" %}
The web audience should see this...
{% elsif site.audience == "acme" %}
The acme audience should see this ...
{% endif %}
```
 {% endraw %}


## reuse a page

{% raw %}
```
{% include_relative reuse/notes.html %}
```
{% endraw %}

## cs help

Go directly to the search.json file in the output.

## Syntax highlighting

```ruby
    def foo
      puts 'foo'
    end
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

## Page-level variables

You can create custom variables in your front matter like this: 

```
---
layout: page
title: Page-level variables
permalink: /page_level_variables/
thing1: Joe
thing2: Dave
---
```

You can then access the values in those custom variables using the `page` namespace, like this:


{% raw %}
```
thing1: {{page.thing1}}

thing2: {{page.thing2}}
```
{% endraw %}


## Tag a page

```
---
layout: page
title: 2.0 Release Notes
permalink: /release_notes_2_0/
tags: release_notes
---
```

## Get 5 pages with a specific tag 

{% raw %}
```
{% for page in site.pages limit: 5 %}
{% for tag in page.tags %}
{% if tag == "squirrels" %}
<li><a href="{{ page.permalink | prepend: site.baseurl }}">{{page.title}}</a></li>
<div class="summary">{{page.summary}}</div>
{% endif %}
{% endfor %}
{% endfor %}
```
{% endraw %}


## Stop hung server

`ps aux | grep jekyll`

Find the PID (looks like "22298")

Type `kill -9 22298` where "22298" is the PID.


