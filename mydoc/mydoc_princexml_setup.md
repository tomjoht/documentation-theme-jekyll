---
title: 9. Set up Prince XML
tags: 
  - publishing
keywords: "pdf generation, prince xml"
last_updated: "November 30, 2015"
summary: "Prince XML is the utility used for creating PDFs. Though not free, this utility gets a list of links and compiles them into a PDF."
series: "Getting Started"
weight: 9
---

{{site.data.alerts.tip}} More details about generating PDFs are listed in {{site.data.mydoc.mydoc_urls.mydoc_generating_pdfs.link}}. {{site.data.alerts.end}}

## Install Prince XML

Prince XML is a utility I've decided to use to create PDFs. The Prince XML utility requires a list of web pages from which it can construct a PDF. 

You need to install Prince. See the [instructions on the Prince website](http://www.princexml.com/doc/installing/#macosx) for installing Prince.

Prince will work even without a license, but it will imprint a small Prince image on the first page.

## Customize PDF headers and footers

Open up the css/printstyles.css file and customize the email address (`youremail@domain.com`) that is listed there. This email address appears in the bottom left footer of the PDF output.

