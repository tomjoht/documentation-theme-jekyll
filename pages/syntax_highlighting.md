---
title: Syntax highlighting
permalink: /syntax_highlighting/
---

For syntax highlighting, use fenced code blocks optionally followed by the language syntax you want:

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


The theme has syntax highlighting configured in the configuration file as follows:

```
highlighter: pygments
```