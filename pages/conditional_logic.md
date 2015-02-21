---
layout: page
title: Conditional logic
permalink: /conditional_logic/
tags: conditional_logic
---
{% include_relative reuse/variables.html %}
If you're a technical writer creating different outputs for different audiences, you can do all of this using a combination of Jekyll's Liquid markup and values in your configuration file.

{{alertinfo}} Definitely check out [Liquid's documentation](http://docs.shopify.com/themes/liquid-documentation/basics) for more details about how to use operators and other liquid markup. The notes here are a small, somewhat superficial sample from the site.{{end}}

## Where to store filtering values

You can filter content based on values that you have set in your config file or in a file in your _data folder. If you set the attribute in your config file, you need to restart the Jekyll server to see the changes. If you set the value in a file in your _data folder, you don't need to restart the server when you make changes. Therefore it's preferable to store values in your _data file rather than your config file, but do what makes sense to you.

## Conditional logic based on config file value

Here's an example of conditional logic based on a value in your config file. In my config_web.yml file, I have the following:

```
audience: web
```

On a page in my site (it can be html or markdown), I have the following:


{% comment %}
{% raw %}
```
{% if site.audience == "web" %}
The web audience should see this...
{% elsif site.audience == "acme" %}
The acme audience should see this ...
{% endif %}
```
 {% endraw %}
 {% endcomment %}


This uses simple `if-elsif` logic to determine what is shown. You access the configuration value through the site namespace, by using `site.audience`.

Here's an example of `if-else` logic inside a list:

{% raw %}
```liquid
To bake a casserole:

1. Gather the ingredients.
{% if site.audience == "omnivore" %}
2. Add in a pound of meat.
{% elsif site.audience == "vegetarian" %}
3. Add in an extra can of beans.
{% endif %}
3. Bake in oven for 45 min.
```
{% endraw %}

You can also add an `else` statement to handle all other conditions not handled by the `if` statements. 

{% comment %}
{% raw %}
```
{% if site.audience == "web" %}
show this web content...
{% elsif site.audience == "acme" %}
show this acme content...
{% else %}
this shows if neither of the above two if conditions are met.
{% endif %}
```

{% endraw %}
{% endcomment %}


## Or operator

You can use more advanced Liquid markup for conditional logic, such as an `or` command. See [Shopify's Liquid documentation](http://docs.shopify.com/themes/liquid-documentation/basics/operators) for more details. 

For example, here's an example using `or`:

{% raw %}
```
{% if page.tags contains "homepage" or page.tags == "featured" %}
    // run this.
{% endif %}
```
{% endraw %}


## Conditional logic based on data file value

You can also store values in your _data folder. The way you access the value is a little different. First, create a folder called `_data`. Next, create a YML file (you might call it options.yml) and put in similarly formatted content as in your config.yml file, such as: 

```
audience: web
```

To access values in the options.yml file in your _data folder, you use the ``site.data.options`` namespace, where data is the name of the folder and options is the name of the file.


Here's an example of conditional logic based on a value in a .yml file inside _data:

```liquid
{% raw %}
{% if site.data.options.audience == "web" %}
The web audience should see this...
{% elsif site.data.options.audience == "acme" %}
The acme audience should see this ...
{% endif %}
 {% endraw %}
```

You can also specify a `data_source` for your data location in your configuration file. Then you aren't limited to simply using `_data` to store your data. For example, with the Jekyll-doc theme, I am storing data values in settings/jekyll-docs. There are two files in there: one called options.yml and another called nav.yml. You access the data source through `site.data.nav` or `site.data.options` depending on the file name you want to access.

## Conditional logic based on page namespace

You can also create conditional logic based on the page namespace. For example, create a page with front matter as follows:

{% raw %}
```liquid
---
layout: page
type: homepage
---
```
 {% endraw %}


Now in any other file, you can create conditional logic based on the page namespace. For example, in your default.html file in your _layouts folder, you might have the following:

{% raw %}
```liquid
{% if page.type == "homepage" %}
{% include masthead.html %}
{% endif %}
```
{% endraw %}
