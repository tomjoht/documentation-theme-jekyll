---
title: Content reuse
tags: [single_sourcing]
keywords: includes, conref, dita, transclusion, transclude, inclusion, reference
last_updated: November 30, 2015
summary: "You can reuse chunks of content by storing these files in the includes folder. You then choose to include the file where you need it. This works similar to conref in DITA, except that you can include the file in any content type."
---

## About content reuse
You can embed content from one file inside another using includes. Put the file containing content you want to reuse (e.g., mypage.html) inside the \_includes/mydoc folder (replacing "mydoc" with your project's name), and then use a tag like this:

{% raw %}
```
{% include mydoc/mypage.html %}
```
{% endraw %}

With content in your \_includes folder, you don't add any frontmatter to these pages because they will be included on other pages already containing frontmatter.

Also, when you include a file, all of the file's contents get included. You can't specify that you only want a specific part of the file included. However, you can use parameters with includes. See [Jekyll's documentation](http://stackoverflow.com/questions/21976330/passing-parameters-to-inclusion-in-liquid-templates) for more information on that.

## Re-using content across projects

When you want to re-use a topic across projects, store the content in the \includes folder (it can be in any project's subfolder). Any folder that begins with an underscore (`_`) isn't included in the site output. 
 
Also be sure to put any images in the common_images folder. None of the assets in the common_images folder should be excluded in the configuration files. This means every project's output will include the resources from the common_images folder.

However, each project will likely exclude content from the specific folders where the pages are stored. This is why reuse across projects requires you to use the \_includes folder and the common_images folder. (Unfortunately you can't include an image from the \_includes folder.)

## Page-level variables

You can also create custom variables in your frontmatter like this: 

{% raw %}
```yaml
---
title: Page-level variables
permalink: /page_level_variables/
thing1: Joe
thing2: Dave
---
```
{% endraw %}

You can then access the values in those custom variables using the `page` namespace, like this:

{% raw %}
```
thing1: {{page.thing1}}
thing2: {{page.thing2}}
```
{% endraw %}

I haven't found a use case for page-level variables, but it's nice to know they're available. 

I use includes all the time. Most of the includes in the \_includes directory are pulled into the theme layouts. For those includes that change, I put them inside custom and then inside a specific project folder. 


