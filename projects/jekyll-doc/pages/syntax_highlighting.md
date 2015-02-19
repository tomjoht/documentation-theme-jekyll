---
layout: page
title: "Syntax highlighting"
permalink: /syntax_highlighting/
tags: formatting
---


## Sample syntax in your code

For syntax highlighting, use fenced code blocks with the language identifier to highlight code:

<pre>
```ruby
    def foo
      puts 'foo'
    end
```
</pre>


```ruby
    def foo
      puts 'foo'
    end
```

Fenced code blocks require a blank line before and after.

You can also use the `highlight` command with Liquid markup:

{% comment %}
```
{% highlight ruby %}
    def foo
      puts 'foo'
    end
{% endhighlight %}
```
{% endcomment %}



## Sample syntax with line numbers




For other code options, see this page from Pygments on [Lexers](http://pygments.org/docs/lexers/). If you omit the programming language identifier ("lexer"), the highlighting fails -- there is no fallback or default lexer.

## Common short names

```
cpp, json, java, js, javascript, cpp, csharp, php, html
```


## Config file setup

Make sure this is in your _config.yml file:

```js
markdown: redcarpet

redcarpet:
  extensions: ["no_intra_emphasis", "fenced_code_blocks", "autolink", "tables", "with_toc_data"]
highlighter: pygments

The pygments highlighter comes pre-installed with Jekyll.

Download this syntax.css file, add it to the stylesheets directory, and add a reference to it in your default.html file like this:

 <link rel="stylesheet" href="{{ "/stylesheets/syntax.css" | prepend:site.baseurl }}">
```

You can read more about the [Red Carpet and the extensions here](https://github.com/vmg/redcarpet).

## Other highlighters

In contrast to Red Carpet, you can also use Kramdown. However, Red Carpet has an extension to automatically generate ID tags for headers (that's what the `with_toc_data` option does in the parameters above). This is critical to the function of the auto-toc. Without these IDs, the auto-toc feature won't work.

The pygments highlighter comes pre-installed with Jekyll.


## More information

* [Pygments](http://pygments.org/)
* [Jekyll doc](http://jekyllrb.com/docs/templates/#code-snippet-highlighting)



