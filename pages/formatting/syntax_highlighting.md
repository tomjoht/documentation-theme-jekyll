---
title: Syntax highlighting
permalink: /syntax_highlighting/
audience: writer, designer
tags: formatting
keywords: 
last_updated: 
summary: 
---
{% include linkrefs.html %} 

For syntax highlighting, use fenced code blocks optionally followed by the language syntax you want:

```ruby
    def foo
      puts 'foo'
    end
```

Fenced code blocks require a blank line before and after.

If you're using an HTML file, you can also use the `highlight` command with Liquid markup:

{% raw %}
```ruby
{% highlight ruby %}
    def foo
      puts 'foo'
    end
{% endhighlight %}
```
{% endraw %}


The theme has syntax highlighting configured in the configuration file as follows:

```
highlighter: rouge
```