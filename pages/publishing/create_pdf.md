---
title: Create PDF
permalink: /create_pdf/
tags: publishing
---

{% comment %}
remaining tasks:

- in build script, serve jekyll, build pdf, then kill server.
- handle tables that have 5 columns in a way that doesn't end up getting cut off
- handle link to .zip workbook file
- handle page 0 links -- which indicate that there is no cross reference. maybe add note in instructions.
{% endcomment %}

This process for creating a PDF relies on Prince to transform the HTML content into PDF. Prince costs about $500 per license.

1. Download and install [Prince](http://www.princexml.com/).
2. Create a new config file for each of your PDF targets. The only notable difference is the following:
 * The default page layout is page_print.
 * The baseurl and port should be different. 
 * There's a `print: true` toggle in case you want to make some of your content unique to PDF output. 
     
     {{note}} Although you're creating a PDF, you must still build a web target before running Prince. Prince will pull from the HTML files and from the file-list for the TOC.{{end}}
     
3. In the css folder, open the print-header-fe.css file. Change the filename to your audience. Customize what appears in each of the page margins.
4. In the default_print.html file in the layout folder, customize the conditional logic to match your audience with the stylesheets you created in the previous step.
5. In the _data folder, open sidebar.yml and add `print: true` for each page that you want to appear in the print version. (The pages in the topnav aren't pushed to PDF, so if you need some of the pages there, add them to the sidebar and add a `web: false` property to each of them (in addition to a `print: true` property).)
6. In the project's root directory, the logic in the prince-file-list.txt will pull all files from the sidebar.yml file to be included in the PDF. You can adjust any of the logic there as needed, but you shouldn't need to do anything to the file.
5. In the root directory, rename the pdf_fe.sh file and customize its contents to point to the right folders on your computer (the configuration file and the output destination).
6. In the root directory, open the pdf_writer.sh file and customize the directory paths. They should point to where this project builds, so the script can find the processed prince-file-list file and so it knows where to build the output. This .sh file allows you to run the PDF build.
7. Browse to the directory containing pdf_writer.sh file and type `. pdf_writer.sh`.
8. Check for links to non-existent topics in the PDF by looking for "page 0".
9. For those broken links, conditionalize the content to whether site.print == true or not.
