---
title: Generating PDFs
tags: [publishing, single-sourcing, content-types]
keywords: PDF, prince, prince XML, ant, xsl fo
last_updated: August 12, 2015
summary: "You can generate a PDF from your Jekyll project. You do this by creating a web version of your project that is printer friendly. You then use utility called Prince to iterate through the pages and create a PDF from them. It works quite well and gives you complete control to customize the PDF output through CSS, including page directives and dynamic tags from Prince."
---
{% include linkrefs.html %} 

## PDF overview
This process for creating a PDF relies on Prince XML to transform the HTML content into PDF. Prince costs about $500 per license. That might seem like a lot, but if you're creating a PDF, you're probably working for a company that sells a product, so you likely have access to some resources.

The basic approach is to generate a list of all pages that need to be added to the PDF, and then add leverage Prince to package them up into a PDF.

It may seem like the setup is somewhat cumbersome, but it doesn't take long. Once you set it up, building a pdf is just a matter of running a couple of commands.

Also, creating a PDF this way gives you a lot more control and customization capabilities than with other methods for creating PDFs. If you know CSS, you can entirely customize the output.

## Demo

You can see an example of the finished product here: 

{% if site.audience == "designers" %}
<a target="_blank" class="noCrossRef" href="doc_designers_pdf.pdf"><button type="button" class="btn btn-default" aria-label="Left Align"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> Designers PDF Download</button></a>
{% endif %}

{% if site.audience == "writers" %}
<a target="_blank" class="noCrossRef" href="doc_writers_pdf.pdf"><button type="button" class="btn btn-default" aria-label="Left Align"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> Writers PDF Download</button></a>
{% endif %}

## 1. Set up Prince

Download and install [Prince](http://www.princexml.com/doc/installing/).

You can install a fully functional trial version. The only difference is that the title page will have a small Prince PDF watermark.

## 2. Create a new configuration file for each of your PDF targets

The PDF configuration file will build on the settings in the regular configuration file but will some additional fields. Here's the configuration file for the config_designers.yml file for this theme:

```
destination: ../doc_designers-pdf
url: "http://127.0.0.1:4002"
baseurl: "/doc_designers"
port: 4002
print: true
print_title: Jekyll Documentation Theme for Designers
print_subtitle: version 3.0
defaults:
  -
    scope:
      path: ""
      type: "pages"
    values:
      layout: "page_print"
      comments: true
      search: true
```

{{note}} Although you're creating a PDF, you must still build a web target before running Prince. Prince will pull from the HTML files and from the file-list for the TOC. Prince won't be able to find files if they simply have relative paths, such as /sample.html. The must have full URLs it can access &mdash; hence the <code>url</code> and <code>baseurl</code>. {{end}}

Unlike the other configuration files, the PDF configuration files require a `url` and `baseurl`. This is because the Prince utility needs to access the pages in a specific place. While you could probably set up locations via absolute paths to file folders, it's easier just to provide the locations here as `url` and `baseurl`.

Also note that the default page layout is `page_print`. This layout strips out all the sections that shouldn't appear in the print PDF, such as the sidebar and top navigation bar.

Finally, note that there's a `print: true` toggle in case you want to make some of your content unique to PDF output. For example, you could add conditional logic that checks whether `site.print` is true or not. If it's true, then include information only for the PDF, and so on. 

In the configuration file, customize the values for the `print_title` and `print_subtitle` that you want. These will appear on the title page of the PDF.
     
## 3. Make sure your sidebar_doc.yml file has a titlepage.html and tocpage.html

There are two template pages in the root directory that are critical to the PDF:

* titlepage.html
* tocpage.html

These pages should appear in your sidebar YML file (in this theme, sidebar_doc.yml):

```json
entries:
 - title: Sidebar
   subcategories:
     - title: Frontmatter
       audience: writers, designers
       platform: all
       product: all
       version: all
       web: false
       items:
         - title: Title Page
           url: /titlepage.html
           audience: writers, designers
           platform: all
           product: all
           version: all
           web: false
 
         - title: Table of Contents
           url: /tocpage.html
           audience: writers, designers
           platform: all
           product: all
           version: all
           web: false
```

Leave these pages here in your sidebar. (The `web: false` property means they won't appear in your online TOC because the conditional logic of the sidebar.html checks whether `web` is equal to `false` or not before including the item in the web version of the content.)

The code in the tocpage.html is nearly identical to that of the sidebar.html page except that it includes the `site` and `baseurl` for the URLs. This is essential for Prince to create the page numbers correctly with cross references.

There's another file (in the root directory of the theme) that is critical to the PDF generation process: prince-file-list.txt. This file simply iterates through the items in your sidebar and creates a list of links. Prince will consume the list of links from prince-file-list.txt and create a running PDF that contains all of the pages listed, with appropriate cross references and styling for them all.

## 4. Customize your headers and footers

Open up the css/printstyles.css file and customize what you want for the headers and footers. At the very least, customize the email address that appears in the bottom left.

{% if site.audience == "designers" %}
Exactly how the print styling works here is pretty cool. You don't need to understand the rest of the content in this section unless you want to customize your PDFs to look different from what I've configured. 

This style creates a page reference for a link:

```css
a[href]::after {
    content: " (page " target-counter(attr(href), page) ")"
}
```

You don't want cross references for any link, so this style specifies that the content after should be blank:

```css
a[href*="mailto"]::after, a[data-toggle="tooltip"]::after, a[href].noCrossRef::after {
    content: "";
}
```

If you have a link to a file download, for example, add `noCrossRef` as a class to avoid having it say "page 0" in the cross reference.

This style specifies that after links to web resources, the URL should be inserted instead of the page number: 

```css
a[href^="http:"]::after, a[href^="https:"]::after {
    content: " (" attr(href) ")";
}
```

This style sets your page margins:

```css
@page {
    margin: 60pt 90pt 60pt 90pt;
    font-family: sans-serif;
    font-style:none;
    color: gray;

}
```

To set a specific style property for a particular page, you have to name the page. This allows Prince to identify the page. 

First you add frontmatter to the page that specifies the type. For the titlepage.html, here's the frontmatter:

```
---
type: title
---
```

For the tocpage, here's the frontmatter:

```
---
type: frontmatter
---
```

For the index.html page, we have this type tag (among others):

```
---
type: first_page
---
```

The default_print.html layout will change the class of the `body` element based on the type value in the page's frontmatter:

```liquid
{% raw %}
<body class="{% if page.type == "title"%}title{% elsif page.type == "frontmatter" %}frontmatter{% elsif page.type == "first_page" %}first_page{% endif %} print">
{% endraw %}
```

Now in the css/printstyles.css file, you can assign a page name based on a specific class:

```css
body.title { page: title }
```

This means that for content inside of `body class="title"`, we can style this page in our stylesheet using `@page title`.

Here's how that title page is styled: 

```css
@page title {
    @top-left {
        content: " ";
    }
    @top-right {
        content: " "
    }
    @bottom-right {
        content: " ";
    }
    @bottom-left {
        content: " ";
    }
}
```

As you can see, we don't have any header or footer content, because it's the title page.

For the tocpage.html, which has the `type: frontmatter`, this is specified in the stylesheet: 

```css
body.frontmatter { page: frontmatter }
body.frontmatter {counter-reset: page 1}


@page frontmatter {
    @top-left {
        content: prince-script(guideName);
    }
    @top-right {
        content: prince-script(datestamp);
    }
    @bottom-right {
        content: counter(page, lower-roman);
    }
    @bottom-left {
        content: "youremail@domain.com";   }
}
```

We reset the page count to 1 so that the title page doesn't start the count. Then we also add some header and footer info. The page numbers start counting in lower-roman numerals.

Finally, for the first page, we restart the counting to 1 again and this time use regular numbers. 

```css
body.first_page {counter-reset: page 1}

h1 { string-set: doctitle content() }

@page {
    @top-left {
        content: string(doctitle);
        font-size: 11px;
        font-style: italic;
    }
    @top-right {
        content: prince-script(datestamp);
        font-size: 11px;
    }

    @bottom-right {
        content: "Page " counter(page);
        font-size: 11px;
    }
    @bottom-left {
        content: prince-script(guideName);
        font-size: 11px;
    }
}
```

You'll see some other items in there such as `prince-script`. This means we're using JavaScript to run some functions to dynamically generate that content. These JavaScript functions are located in the \_includes/head_print.html:

```js
<script>
    Prince.addScriptFunc("datestamp", function() {
        return "PDF last generated: {{ site.time | date: '%B %d, %Y' }}";
    });
</script>

<script>
    Prince.addScriptFunc("guideName", function() {
        return "{{site.print_title}} User Guide";
    });
</script>
```

There are a couple of Prince functions that are default functions from Prince. This gets the heading title of the page:

```js
        content: string(doctitle);
```

This gets the current page: 

```js
        content: "Page " counter(page);
```

Because the theme uses JavaScript in the CSS, you have to add the `--javascript` tag in the Prince command (detailed later on this page).

{% endif %}

## 5. Customize the doc_multiserve_pdf.sh script

Open the doc_multiserve_pdf.sh file in the root directory and customize it for your specific configuration files. 

```
echo 'Killing all Jekyll instances'
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
clear

# serve all di print deliverables

# Writers
echo "Serving Writers PDF"
jekyll serve --detach --config configs/config_writers.yml,configs/config_writers_pdf.yml

# Designers
echo "Serving Designers PDF"
jekyll serve --detach --config configs/config_designers.yml,configs/config_designers_pdf.yml
```

Note that the first part kills all Jekyll instances. This way you won't try to server Jekyll at a port that is already occupied.

The `jekyll serve` command serves up the PDF configurations for our two projects. This web version is where Prince will go to get its content.

## 6. Configure the Prince scripts

Open up doc_multibuild_pdf.sh and look at the Prince commands:

```
prince --javascript --input-list=../doc_designers-pdf/prince-file-list.txt -o /Users/tjohnson/projects/documentation-theme-jekyll/doc_designers_pdf.pdf;
```

This script issues a command to the Prince utility. JavaScript is enabled (`--javascript`), and we tell it exactly where to find the list of files (`--input-list`) &mdash; just point to the prince-file-list.txt file. Then we tell it where and what to output (`-o`).

Make sure that the path to the prince-file-list.txt is correct. For the output directory, I like to output the PDF file into my project's source. Then when I build the web output, the PDF is included and something I can refer to.

## 7. Add a download button for the PDF

You can add a download button for your PDF using some Bootstrap button code:

```html
<a target="_blank" class="noCrossRef" href="doc_designers_pdf.pdf"><button type="button" class="btn btn-default" aria-label="Left Align"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> Designers PDF Download</button></a>
```

Here's what that looks like:

{% if site.audience == "designers" %}
<a target="_blank" class="noCrossRef" href="doc_designers_pdf.pdf"><button type="button" class="btn btn-default" aria-label="Left Align"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> Designers PDF Download</button></a>
{% endif %}

{% if site.audience == "writers" %}
<a target="_blank" class="noCrossRef" href="doc_writers_pdf.pdf"><button type="button" class="btn btn-default" aria-label="Left Align"><span class="glyphicon glyphicon-download-alt" aria-hidden="true"></span> Writers PDF Download</button></a>
{% endif %}

## 8. Run the scripts

To generate the PDF, you just run several scripts that have the commands packaged up:

1. First run doc_multiserve_pdf.sh to serve up the PDF sites. The commands will detach the site from the preview server so that you can serve up multiple Jekyll sites in the same command terminal.
2. Then run doc_multibuild_pdf.sh to build the PDF files. 
3. Now run doc_multibuild_web.sh to build the web version that includes the generated PDF files.

{{note}} If you don't like the style of the PDFs, just adjust the styles in the printstyles.css file.{{end}}

## JavaScript conflicts

If you have JavaScript on any of your pages, Prince will note errors in Terminal like this:

```
error: TypeError: value is not an object
```

However, the PDF will still build.

You need to conditionalize out any JavaScript from your PDF web output before building your PDFs. Make sure that the PDF configuration files have the `print: true` property.

Then surround the JavaScript with conditional tags like this:

```
{% raw %}
{% unless site.print == true %}
javascript content here ...
{% endunless %}
{% endraw %}
```

For more detail about using `unless` in conditional logic, see {{doc_conditional_logic}}. What this code means is basically the opposite of `{% raw %}if site.print == true {% endraw %}`.
