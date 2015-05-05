---
title: Create PDF
permalink: /create_pdf/
tags: publishing
keywords: 
audience: 
last_updated: 
summary: 
---
{% include linkrefs.html %} 

{% comment %}
remaining tasks:

- in build script, serve jekyll, build pdf, then kill server.
- handle tables that have 5 columns in a way that doesn't end up getting cut off
- handle link to .zip workbook file
- handle page 0 links -- which indicate that there is no cross reference. maybe add note in instructions.
{% endcomment %}

{{warning}} The PDF creation process has some bugs and is still being worked out... {{end}}

This process for creating a PDF relies on Prince to transform the HTML content into PDF. Prince costs about $500 per license.

1. Download and install [Prince](http://www.princexml.com/).
2. Create a new config file for each of your PDF targets. The only notable difference is the following:
 * The default page layout is page_print.
 * The baseurl and port should be different. 
 * There's a `print: true` toggle in case you want to make some of your content unique to PDF output. 
     
     {{note}} Although you're creating a PDF, you must still build a web target before running Prince. Prince will pull from the HTML files and from the file-list for the TOC.{{end}}
     
3. In the css folder, open the print-header-writer.css and print-header-designer.css files. Change the filenames to your audiences. Customize what appears in each of the page margins.
4. In the default_print.html file in the layout folder, customize the conditional logic to match your audience with the stylesheets you created in the previous step.
5. In the _data folder, open sidebar.yml and add `print: true` for each page that you want to appear in the print version. (The pages in the topnav aren't pushed to PDF, so if you need some of the pages there, add them to the sidebar and add a `web: false` property to each of them (in addition to a `print: true` property).)
    {{note}} In addition to adding the right audience to the page, you must also add the audience to the section's audience attribute. This is because the theme logic first checks whether the section contains the right audience attribute, and then checks whether the items in that section have the right audience attribute.{{end}}
6. In the project's root directory, the logic in the prince-file-list.txt will pull all files from the sidebar.yml file to be included in the PDF. You can adjust any of the logic there as needed, but you shouldn't need to do anything to the file.
5. In the root directory, rename the build_writer_pdf.sh file and customize its contents to point to the right paths on your computer.
5. In the root directory, rename the build_writer_prince.sh file and customize the input and output directories. The input should point to where this project builds, so the script can find the processed prince-file-list.txt file and so it knows where to build the output. 
6. In the root directory, open titlepage.html and customize the link to the logo and other details. The `site_print_title` and `site_version` variables will pull from the config_writer_pdf.yml file, so make sure there are values defined there. The titlepage.html also constructs the TOC by looping through the sidebar.yml file in the same way that the sidebar.html file loops through it. The main purpose is to replicate the hierarchy (headings and subitems). 
7. The titlepage.html file is specified in the sidebar.yml file, with a property of `web: false` so that it's not included in the online output. Very few items are specific to print only, but if you have other, add `web: false` to them to ensure they are likewise excluded from the online output.
7. Open the _data/sidebar.yml file and add `print: true` or `print: false` depending on what files you want to include in the PDF.
7. In iTerm, first run `. build_writer_pdf.sh` to get the pdf version of the content ready.
8. Now run `. build_writer_prince.sh` to generate the PDF from this version. 
8. Check for links to non-existent topics in the PDF by looking for "page 0".
9. For those broken links, conditionalize the content to whether site.print == true or not.
10. Stop the server that has the build_writer_pdf preview.

{{note}} Ideally, I wanted to create a script that launched the server, then built prince, and then stopped the server, but I haven't figured that out yet. You have to detach the server, and once you detach it, the only way to kill it is by referencing a dynamically generated PID. {{end}}
