---
title: Conditional logic
permalink: /conditional_logic/
tags: single-sourcing
audience: writer, designer
keywords: 
last_updated: 
summary: 
---
{% include linkrefs.html %} 

If you want to create different outputs for different audiences, you can do all of this using a combination of Jekyll's Liquid markup and values in your configuration file.

{{tip}} Definitely check out [Liquid's documentation](http://docs.shopify.com/themes/liquid-documentation/basics) for more details about how to use operators and other liquid markup. The notes here are a small, somewhat superficial sample from the site.{{end}}

## Where to store filtering values

You can filter content based on values that you have set either in your config file or in a file in your _data folder. If you set the attribute in your config file, you need to restart the Jekyll server to see the changes. If you set the value in a file in your _data folder, you don't need to restart the server when you make changes. 

## Conditional logic based on config file value

Here's an example of conditional logic based on a value in the configs/config_writer.yml file. In my config_writer.yml file, I have the following:

```
audience: writer
```

On a page in my site (it can be HTML or markdown), I can conditionalize content using the following:


{% comment %}
{% raw %}
```
{% if site.audience == "writer" %}
The writer audience should see this...
{% elsif site.audience == "designer" %}
The designer audience should see this ...
{% endif %}
```
 {% endraw %}
 {% endcomment %}


This uses simple `if-elsif` logic to determine what is shown (note the spelling of `elsif`). The `else` statement handles all other conditions not handled by the `if` statements. 

Here's an example of `if-else` logic inside a list:

{% raw %}
```liquid
To bake a casserole:

1. Gather the ingredients.
{% if site.audience == "writer" %}
2. Add in a pound of meat.
{% elsif site.audience == "designer" %}
3. Add in an extra can of beans.
{% endif %}
3. Bake in oven for 45 min.
```
{% endraw %}

Here's an example of using conditional logic based on a value in a data file:

{% comment %}
{% raw %}
```
{% if site.data.options.audience == "web" %}
show this web content...
{% elsif site.data.options.audience == "acme" %}
show this acme content...
{% else %}
this shows if neither of the above two if conditions are met.
{% endif %}
```
{% endraw %}
{% endcomment %}

Here is my _data folder I have a file called options where the audience property is stored.


## Or operator

You can use more advanced Liquid markup for conditional logic, such as an `or` command. See [Shopify's Liquid documentation](http://docs.shopify.com/themes/liquid-documentation/basics/operators) for more details. 

For example, here's an example using `or`:

{% raw %}
```
{% if site.audience contains "vegan" or site.audience == "vegetarian" %}
    // run this.
{% endif %}
```
{% endraw %}

With conditional statements, you don't need the elsif or else options.

## Specifying a data source

You can also specify a `data_source` for your data location in your configuration file. Then you aren't limited to simply using `_data` to store your data. 

For example, suppose you have 2 projects: alpha and beta. You might store all the data files for alpha inside data_alpha, and all the data files for beta inside data_beta.

In your configuration file, specify the data source like this:

```
data_source: data_alpha
```

Then create a folder called data_alpha.

## Conditional logic based on page namespace

You can also create conditional logic based on the page namespace. For example, create a page with front matter as follows:

{% raw %}
```liquid
---
layout: page
user_plan: full
---
```
 {% endraw %}

Now you can run logic based on the conditional property in that page's front matter:

{% raw %}
```liquid
{% if page.user_plan` == "full" %}
// run this code
{% endif %}
```
{% endraw %}
