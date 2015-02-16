---
layout: page
title: Conditional logic
permalink: /conditional_logic/
tags: conditional_filtering
---

If you're a technical writer creating different outputs for different audiences, you can do all of this using a combination of Jekyll's Liquid markup and values in your configuration file.

Note: Definitely check out [Liquid's documentation](http://docs.shopify.com/themes/liquid-documentation/basics) for more details about how to use operators and other liquid markup. The notes here are a small, somewhat superficial sample from the site.

## Where to store filtering values

You can filter content based on values that you have set in your config file or in a file in your _data folder. If you set the attribute in your config file, you need to restart the Jekyll server to see the changes. If you set the value in a file in your _data folder, you don't need to restart the server when you make changes. 

However, if you're doing conditional filtering, you probably have a different site title (and other elements) as well. Since you can't use Liquid markup (to do conditional filtering) in your config file, then most likely you'll want separate config files for the different outputs anyway. In that case, storing attributes in your config file might make more sense. 

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

{% comment %}
{% raw %}
```liquid
{% if page.type == "homepage" %}
{% include masthead.html %}
{% endif %}
```
{% endraw %}
{% endcomment %}

## Setting up conditional logic

Probably the best approach to conditional filtering when you have multiple outputs for different audiences is to use different configuration files. 

Instead of using _config.yml, create configuration files such as config_gizmo.yml and config_acme.yml. (You can delete _config.yml).

Note that you can't use Liquid markup inside a YML file. 


## Excluding files of directories from an output


 By default pages get included in the output, even if they're not specifically listed in any navigation. To filter out the pages you don't want, you use the `exclude` property in your configuration file, like this:

```liquid
 exclude:
  - content/gizmo
  - content/tutorials
  - readme.md
```

This will make it so any pages in the content/gizmo or content/tutorials directories are not included. Additionally, the readm.md file will be excluded. 

Now when you create content only for one specific audience, you exclude the inapplicable directories. For your acme audience, you might want to exclude all content in your web directory. And vice versa. 

## Page references

Interestingly, even though you may group content into subfolders, when you reference a page, you reference it by the permalink regardless of the subfolder it happens to be in. So even if you have content/tutorial_link, you link to it with tutorial_link instead of content/tutorial_link because that's what the permalink of the topic says.

## Conditional navigation

You can apply `if-else` statements to the layout files as well. Suppose you want to have different navigation for two different projects (a likely scenario). You can use the same if-else logic in your default.html file.

First extract the varying navigation element from your default.html file into something like topnav.html. Then use conditional logic to build it: 

{% comment %}
{% raw %}
```liquid
{% if site.audience == "acme" %}
{% include topnav_acme.html %}
{% elsif site.audience == "gizmo" %}
{% include topnav_gizmo.html %}
{% endif %}
```
{% endraw %}
{% endcomment %}


Now you can define the navigation you want for each project without adding a ton of if-else statements in your code. On the other hand, if you just have a few slight differences between the outputs, you probably won't want to create completely separate files.


