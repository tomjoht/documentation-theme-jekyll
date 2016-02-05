---
title: Conditional logic
tags: [single_sourcing]
keywords: if else logic, conditions, conditional attributes, conditional filtering
last_updated: November 30, 2015
summary: "You can implement advanced conditional logic that includes if statements, or statements, unless, and more. This conditional logic facilitates single sourcing scenarios in which you're outputting the same content for different audiences."
---

## About Liquid and conditional statements
If you want to create different outputs for different audiences, you can do all of this using a combination of Jekyll's Liquid markup and values in your configuration file.

You can then incorporate conditional statements that check the values in the configuration files.

{{site.data.alerts.tip}} Definitely check out <a href="http://docs.shopify.com/themes/liquid-documentation/basics">Liquid's documentation</a> for more details about how to use operators and other liquid markup. The notes here are a small, somewhat superficial sample from the site.{{site.data.alerts.end}}

## Where to store filtering values

You can filter content based on values that you have set either in your config file or in a file in your \_data folder. If you set the attribute in your config file, you need to restart the Jekyll server to see the changes. If you set the value in a file in your \_data folder, you don't need to restart the server when you make changes. 

## Required conditional attributes

This theme requires you to add the following attributes in your configuration file:

* project 
* audience
* product 
* platform 
* version

If you've ever used DITA, you probably recognize these attributes, since DITA has mostly the same ones. I've found that most single_sourcing projects I work on can be sliced and diced in the ways I need using these conditional attributes.

If you're not single sourcing and you find it annoying having to specify these attributes in your sidebar, you can rip out the logic from the sidebar.html, topnav.html file and any other places where conditions.html appears; then you wouldn't need these attributes in your configuration file.

## Conditional logic based on config file value

Here's an example of conditional logic based on a value in the configs/config_writer.yml file. In my config_writer.yml file, I have the following:

```
audience: writers
```

On a page in my site (it can be HTML or markdown), I can conditionalize content using the following:

{% raw %}

```liquid
{% if site.audience == "writers" %}
The writer audience should see this...
{% elsif site.audience == "designers" %}
The designer audience should see this ...
{% endif %}
```

{% endraw %}

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

You don't need the `elsif` or `else`. You could just use an `if` (but be sure to close it with `endif`).

## Or operator

You can use more advanced Liquid markup for conditional logic, such as an `or` command. See [Shopify's Liquid documentation](http://docs.shopify.com/themes/liquid-documentation/basics/operators) for more details. 

For example, here's an example using `or`:

{% raw %}
```liquid
{% if site.audience contains "vegan" or site.audience == "vegetarian" %}
    // run this.
{% endif %}
```
{% endraw %}

Note that you have to specify the full condition each time. You can't shorten the above logic to the following:

{% raw %}
```liquid
{% if site.audience contains "vegan" or "vegetarian" %}
    // run this.
{% endif %}
```
{% endraw %}

This won't work.

## Unless operator

You can also use `unless` in your logic, like this:

{% raw %}
```liquid
{% unless site.output == "pdf" %}
...
{% endunless %}
```
{% endraw %}

When figuring out this logic, read it like this: "Run the code here *unless* this condition is satisfied." Or "If this condition is satisfied, don't run this code."

Don't read it the other way around or you'll get confused. (It's not executing the code only if the condition is satisfied.)

In this situation, if `site.print == true`, then the code will *not* be run here.

## Storing conditions in the \_data folder

Here's an example of using conditional logic based on a value in a data file:

{% raw %}
```liquid
{% if site.data.options.output == "alpha" %}
show this content...
{% elsif site.data.options.output == "beta" %}
show this content...
{% else %}
this shows if neither of the above two if conditions are met.
{% endif %}
```
{% endraw %}

To use this, I would need to have a \_data folder called options where the `output` property is stored.

I don't really use the \_data folder as much for project options. I store them in the configuration file because I usually want different projects to use different values for the same property. 

For example, maybe a file or function name is called something different for different audiences. I currently single source the same content to at least two audiences in different markets.

For the first audience, the function name might be called `generate`, but for the second audience, the same function might be called called `expand`. In my content, I'd just use {% raw %}`{{site.function}}`{% endraw %}. Then in the configuration file I change its value appropriately for the audience.

## Specifying the location for \_data

You can also specify a `data_source` for your data location in your configuration file. Then you aren't limited to simply using `_data` to store your data files.

For example, suppose you have 2 projects: alpha and beta. You might store all the data files for alpha inside data_alpha, and all the data files for beta inside data_beta.

In your alpha configuration file, specify the data source like this:

```
data_source: data_alpha
```

Then create a folder called \_data_alpha.

For your beta configuratoin file, specify the data source like this:

```
data_source: data_beta
```

Then create a folder called \_data_beta.


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
{% if page.user_plan == "full" %}
// run this code
{% endif %}
```
{% endraw %}

## Conditions versus includes

If you have a lot of conditions in your text, it can get confusing. As a best practice, whenever you insert an `if` condition, add the `endif` at the same time. This will reduce the chances of forgetting to close the if statement. Jekyll won't build if there are problems with the liquid logic. 

If your text is getting busy with a lot of conditional statements, consider putting a lot of content into includes so that you can more easily see where the conditions begin and end.

