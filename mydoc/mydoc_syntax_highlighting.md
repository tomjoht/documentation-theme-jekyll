---
title: Syntax highlighting
tags: [formatting]
keywords: rouge, pygments, prettify, color coding,
last_updated: November 30, 2015
summary: "You can apply syntax highlighting to your code. This theme uses pygments and applies color coding based on the lexer you specify."
---

{% comment %}
## About syntax highlighting
For syntax highlighting, use fenced code blocks optionally followed by the language syntax you want:

<pre>
```ruby
    def foo
      puts 'foo'
    end
```
</pre>

This looks as follows:

```ruby
    def foo
      puts 'foo'
    end
```

Fenced code blocks require a blank line before and after.

If you're using an HTML file, you can also use the `highlight` command with Liquid markup:

{% raw %}
<pre>
{% highlight ruby %}
    def foo
      puts 'foo'
    end
{% endhighlight %}
</pre>
{% endraw %}

It renders the same: 

{% highlight ruby %}
    def foo
      puts 'foo'
    end
{% endhighlight %}


The theme has syntax highlighting specified in the configuration file as follows:

```
highlighter: rouge
```

The syntax highlighting is done via the css/syntax.css file.
{% endcomment %}
## Available  lexers

The keywords you must add to specify the highlighting (in the previous example, `ruby`) are called "lexers." You can search for "lexers." Here are some common ones I use:

* js
* html
* yaml
* css
* json
* php
* java
* cpp
* dotnet
* xml
* http

