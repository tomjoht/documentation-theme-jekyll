---
title: Alerts
tags: [formatting]
keywords: notes, tips, cautions, warnings, admonitions
last_updated: March 20, 2016
summary: "You can insert notes, tips, warnings, and important alerts in your content. These notes make use of Bootstrap styling and are available through data references such as site.data.alerts.note."
sidebar: mydoc_sidebar
permalink: /mydoc_alerts/
---

## About alerts
Alerts are little warnings, info, or other messages that you have called out in special formatting. In order to use these alerts or callouts, just reference the appropriate value stored in the alerts.yml file as described in the following sections.

## Alerts

You can insert an alert by using any of the following code.

```
{%raw%}{% include note.html content="This is my note. All the content I type here is treated as a single paragraph." %}{% endraw%}
```

Here's the result: 

{% include note.html content="This is my note. All the content I type here is treated as a single paragraph." %}

If you need multiple paragraphs, enter `<br/><br/>` tags, like this:

```
{%raw%}{% include note.html content="This is my note. All the content I type here is treated as a single paragraph. <br/><br/> Now I'm typing on a  new line." %}{% endraw%}
```

Here's the result: 

{% include note.html content="This is my note. All the content I type here is treated as a single paragraph. <br/><br/> Now I'm typing on a  new line." %}

## Types of alerts available

There are four types of alerts you can leverage: 

* note.html
* tip.html
* warning.html
* important.html

They function the same except they have a different color, icon, and alert word. You include the different types by selecting the include template you want. Here are samples of each alert:

{% include note.html content="This is my note." %}

{% include tip.html content="This is my tip." %}

{% include warning.html content="This is my warning." %}

{% include important.html content="This is my important info." %}


These alerts leverage includes stored in the \_include folder. The `content` option is a parameter that you pass to the include. In the include, the parameter is passed like this:


```
{% raw %}<div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> {{include.content}}{% endraw %}</div>
```

The content in `content="This is my note."` gets inserted into the `{% raw %}{{include.content}}}{% endraw %}` part of the template. You can follow this same pattern to build additional includes. See this [Jekyll screencast on includes](http://jekyll.tips/jekyll-casts/includes/) for more information.

## Callouts

There's another type of callout available called callouts. This format is typically used for longer callout that spans mreo than one or two paragraphs, but really it's just a stylistic preference whether to use an alert or callout.

Here's the syntax for a callout: 

```
{% raw %}{% include callout.html content="This is my callout. It has a border on the left whose color you define by passing a type parameter. I typically use this style of callout when I have more information that I want to share, often spanning multiple paragraphs. " type="primary" %} {% endraw %}
```

Here's the result:

{% include callout.html content="This is my callout. It has a border on the left whose color you define by passing a type parameter. I typically use this style of callout when I have more information that I want to share, often spanning multiple paragraphs." type="primary" %}

To include paragraph breaks, use `<br/><br/>` inside the callout: 

```
{% raw %}{% include callout.html content="**Important information**: This is my callout. It has a border on the left whose color you define by passing a type parameter. I typically use this style of callout when I have more information that I want to share, often spanning multiple paragraphs. <br/><br/>Here I am starting a new paragraph, because I have lots of information to share. You may wonder why I'm using line breaks instead of paragraph tags. This is because Kramdown processes the Markdown here as a span rather than a div (for whatever reason). Be grateful that you can be using Markdown at all inside of HTML. That's usually not allowed in Markdown syntax, but it's allowed here." type="primary" %} {% endraw %}
```

Here's the result: 

{% include callout.html content="**Important information**: This is my callout. It has a border on the left whose color you define by passing a type parameter. I typically use this style of callout when I have more information that I want to share, often spanning multiple paragraphs. <br/><br/>Here I am starting a new paragraph, because I have lots of information to share. You may wonder why I'm using line breaks instead of paragraph tags. This is because Kramdown processes the Markdown here as a span rather than a div (for whatever reason). Be grateful that you can be using Markdown at all inside of HTML. That's usually not allowed in Markdown syntax, but it's allowed here." type="primary" %}

The type options are as follows:

* `danger`
* `default`
* `primary`
* `success`
* `info`
* `warning`

These types just define the color of the left border. Each of these callout types get inserted as a class name in the callout template. These class names correspond with styles in Bootstrap. These classes are common Bootstrap class names whose style attributes differ depending on your Bootstrap theme and style definitions.

Here's an example of each different type of callout:

{% include callout.html content="This is my **danger** type callout. It has a border on the left whose color you define by passing a type parameter." type="danger" %} 

{% include callout.html content="This is my **default** type callout. It has a border on the left whose color you define by passing a type parameter." type="default" %} 

{% include callout.html content="This is my **primary** type callout. It has a border on the left whose color you define by passing a type parameter." type="primary" %} 

{% include callout.html content="This is my **success** type callout. It has a border on the left whose color you define by passing a type parameter." type="success" %} 

{% include callout.html content="This is my **info** type callout. It has a border on the left whose color you define by passing a type parameter." type="info" %} 

{% include callout.html content="This is my **warning** type callout. It has a border on the left whose color you define by passing a type parameter." type="warning" %} 

Now that in contrast to alerts, callouts don't include the alert word (note, tip, warning, or important).

## Markdown inside of callouts and alerts

You can use Markdown inside of callouts and alerts, even though this content actually gets inserted inside of HTML in the include. This is one of the advantages of Kramdown Markdown. The include template has an attribute of `markdown="span"` that allows for the processer to parse Markdown inside of HTML.

## Validity checking

If you have some of the syntax wrong with an alert or callout, you'll see an error when Jekyll tries to build your site. The error may look like this:

```
{% raw %}Liquid Exception: Invalid syntax for include tag: content="This is my **info** type callout. It has a border on the left whose color you define by passing a type parameter. type="info" Valid syntax: {% include file.ext param='value' param2='value' %} in mydoc/mydoc_alerts.md {% endraw %}
```
 
These errors are a good thing, because it lets you know there's an error in your syntax. Without the errors, you may not realize that you coded something incorrectly until you see the lack of alert or callout styling in your output.

In this case, the quotation marks aren't set correctly. I forgot the closing quotation mark for the content parameter include.

## Blast a warning to users on every page

If you want to blast a warning to users on every page, add the alert or callout to the \_layouts/page.html page right below the frontmatter. Every page using the page layout (all, by defaut) will show this message.

