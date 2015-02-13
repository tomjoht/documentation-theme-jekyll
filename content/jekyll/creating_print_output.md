---
title: Creating a printed guide
permalink: /creating_print/
---


Although you can serve Jekyll sites locally, you have to run them on a server. You can't just deliver a set of static HTML files for anyone to view in a browser. The problem is that the paths to the stylesheets and other resources don't have a consistent to them. See this [StackOverflow question](http://stackoverflow.com/questions/18068423/jekyll-serve-locally-without-building) and especially this one: [StackOverflow](http://stackoverflow.com/questions/26778329/running-jekyll-generated-files-without-jekyll-local-server).

Here's the approach I'm taking. 

1. Create a special configuration file designed for the print output. Call it configuration_acme_print.yml.
2. Change the default page layout to print in this configuration file. Here's what that looks like: 


3. Clone the default.html layout, change it to print.html.
4. Create a markdown page that consists of nothing but the includes that you want for the print output. It will look something like this. Make sure it's a markdown file because you're inserting pages that include markdown, so you need them to be processed as such. just be careful with spacing in this file so your liquid tags aren't processed incorrectly.

{% raw %}

```liquid
---
title: Printed manual
permalink: /print/
layout: none
---

{% for p in site.pages %}
{% if p.permalink == "/troubleshooting_hmac/" %}
<h1>{{p.title}}</h1>
{{p.content}}
{% endif %}
{% endfor %}

{% for p in site.pages %}
{% if p.permalink == "/release_notes/" %}
<h1>{{p.title}}</h1>
{{p.content}}
{% endif %}
{% endfor %}

{% for p in site.pages %}
{% if p.permalink == "/overview/" %}
<h1>{{p.title}}</h1>
{{p.content}}
{% endif %}
{% endfor %}
```
{% endraw %}

make sure your layout is "none." you will get a build warning:  Build Warning: Layout 'none' requested in content/adtruth/printcompilation.md does not exist. But i think this is the only way to do it -- otherwise the page will be pushed through the default layout for the content -- the print layout as well as the existing layout specified here, such as page. then you'd end up with two instances of the content.

there will be a lot of loops on this page, so it's better to use switch case. 


  the include will only pull the guts out of the page, ie the page content. it will not pull the page.layout wrapper that surrounds the page content. in normal publishing, the content for a page is pushed into page.html, and page.html has a tag that says <h1>{{page.title}}</h1> that will print the title and such. but since the include only gets the page, it won't show the title because the include doesn't include the page's wrapper (page.html).

this also means that the frontmatter will also be included in the page. ugghhhh. 

first, you have to add the h1 headings here manually. we need a special class for these h1 headings too, because we'll need to create something called an adjacent sibling combinator selector. this page explains it: http://css-tricks.com/child-and-sibling-selectors/. "An adjacent sibling combinator selector allows you to select an element that is directly after another specific element."

so add this to your custom stylesheet:

h1.print + hr {
  display:none;
}

h1.print + hr + p {
  display:none;
}

h1.print + hr + p + hr{
  display:none;
}

now give the h1 elements a special class (called print).


but i decided to just manually add the h1's here. also give them a unique class.

  so we have to do some magic tricks here. 

here's a good stack overflow post: http://stackoverflow.com/questions/2606606/jekyll-documentation-to-pdf-with-toc

uh oh, when you have a tag or layout in the front matter, this is how it gets output in the html:

h2#tags:-implementation

i'm not sure how to strip this out...

Then simply print it. By default, you won't have a TOC, page numbers, cross references, or other details. Here is where need to hand it off to a more powerful tool comes in. I recommend using Prince XML, since you can use CSS to define the look and feel of the printed output. 

Prince CSS allows you to style XHTML documents using CSS. 

Install prince: http://www.princexml.com/doc/installing/

In your command line, cd to the directory that has your XHTML output to it (e.g., acme.html).

Type:

prince acme.html

Prince will render acme.pdf. 

Now create a CSS stylesheet in the same directory --e.g., acmestyle.css

Then enter:

prince -s acmestyle.css acme.html

You'll see that prince applies the CSS styling to the acme.pdf output. 

By using CSS instead of XSLT to create the PDF styling, you can single source between the styles you're already using for your CSS output online and your PDF styles.

Here's a powerpoint with more details: http://www.oxygenxml.com/events/2014/Slides_DITA_OT_Day_2014/DITA_Open_Toolkit_PDF_generation_with_CSS.pdf

Here's a sample: http://buildr.apache.org/contributing.html. Buildr uses prince xml to get a pdf version of their docs. includes a numbered toc.