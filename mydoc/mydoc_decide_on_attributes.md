---
title: 3. Decide on your project's attributes
tags: [getting_started]
last_updated: November 30, 2015
keywords: attributes, conditional filtering, audience, platform, product, version, output, DITA, variables
summary: "Each project has attributes that define the audience, platform, product, version, and output. These attributes are used in generating the outputs. The attributes function as filtering conditions that determine what content gets included in the navigation."
series: "Getting Started"
weight: 3
---
{% include custom/mydoc/getting_started_series.html %}

## Your attribute values
Before you can customize your project's settings, you have to make some decisions about the following:

* `audience`
* `platform`
* `product`
* `version`
* `output` (web, pdf)

Every project uses a value for these settings, so even if the attribute doesn't apply to your project, you will need to put some value for `audience`, `platform`, `product`, and `version` (a value such as `all` will work fine).

The `audience`, `platform`, `product`, and `version` settings derive from the same filtering attributes as in DITA. You can usually create any kind of filtered output by combining these attributes in different ways. 

For example, you might have different product lines (lite versus pro), different versions (1.0 versus 2.0), different platforms (such as Java versus C++), and different audiences (administrators versus analysts) and so on. You'll need to know the values you want to use for each attribute in order to configure the project successfully to build the different outputs. 

If you aren't sure of your outputs, just put `all` for the `audience`, `platform`, `product`, and `version`. For the `output` value, the options are fixed to either `web` or `pdf` (or both &mdash; `web, pdf` &mdash; separated by a comma).

{% include custom/mydoc/getting_started_series_next.html %}
