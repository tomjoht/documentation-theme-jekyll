---
title: Conditional logic
permalink: /conditional_logic/
---
If you want to create different outputs for different audiences, you can do all of this using a combination of Jekyll's Liquid markup and values in your configuration file.

{{alertinfo}} Definitely check out [Liquid's documentation](http://docs.shopify.com/themes/liquid-documentation/basics) for more details about how to use operators and other liquid markup. The notes here are a small, somewhat superficial sample from the site.{{end}}

## Where to store filtering values

You can filter content based on values that you have set in your config file or in a file in your _data folder. If you set the attribute in your config file, you need to restart the Jekyll server to see the changes. If you set the value in a file in your _data folder, you don't need to restart the server when you make changes. Therefore it's preferable to store values in your _data file rather than your config file, but do what makes sense to you.  

## Conditional logic based on config file value

Here's an example of conditional logic based on a value in the _data/project.html file. In my project.html file, I have the following:

```
audience: web
```

On a page in my site (it can be HTML or markdown), I have the following:


{% comment %}
{% raw %}
```
{% if site.data.project.audience == "web" %}
The web audience should see this...
{% elsif site.audience == "acme" %}
The acme audience should see this ...
{% endif %}
```
 {% endraw %}
 {% endcomment %}


This uses simple `if-elsif` logic to determine what is shown (note the spelling of `elsif`). 

Here's an example of `if-else` logic inside a list:

{% raw %}
```liquid
To bake a casserole:

1. Gather the ingredients.
{% if site.data.project.audience == "omnivore" %}
2. Add in a pound of meat.
{% elsif site.data.project.audience == "vegetarian" %}
3. Add in an extra can of beans.
{% endif %}
3. Bake in oven for 45 min.
```
{% endraw %}

You can also add an `else` statement to handle all other conditions not handled by the `if` statements. 

{% comment %}
{% raw %}
```
{% if site.data.project.audience == "web" %}
show this web content...
{% elsif site.data.project.audience == "acme" %}
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
{% if site.data.project.audience contains "vegan" or site.data.project.audience == "vegetarian" %}
    // run this.
{% endif %}
```
{% endraw %}

## Specifying a data source

You can also specify a `data_source` for your data location in your configuration file. Then you aren't limited to simply using `_data` to store your data. 

For example, suppose you have 2 projects: alpha and beta. You might store all the data files for alpha inside data_alpha, and all the data files for beta inside data_beta. This way you can leave the file names the same for each project. 

In your configuration file, specify the data source like this:

```
data_source: data_alpha
```

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


Now in any other file, you can create conditional logic based on the page namespace. For example, in your default.html file in your _layouts folder, you might have the following:

{% raw %}
```liquid
{% if page.user_plan` == "full" %}
// run this code
{% endif %}
```
{% endraw %}
