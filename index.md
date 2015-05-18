---
title: Documentation Theme for Jekyll
permalink: "/"
tags: overview
homepage: true
---
{% include linkrefs.html %}

{% if site.audience == "writer" %}
{{note}} This is the version of the documentation designed for writers. It has a subset of topics from the designers output.{{end}}

{% include custom/homepage.md %}

{% endif %}


{% if site.audience == "designer" %}
{{note}} This is the version of the documentation designed for designers. The set of topics included here is comprehensive.{{end}}

{% include custom/homepage.md %}

{% endif %}
