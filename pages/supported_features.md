---
title: Supported features
permalink: /supported_features/
excerpt: Before you get into exploring Jekyll as a potential platform for help content, you may be wondering if it supports some basic features. The following table shows what is supported in Jekyll.
---



Features | Supported | Notes
--------|-----------|-----------
Content re-use | Yes | Supports re-use through Liquid. You can re-use variables, snippets of code, entire pages, and more. In DITA speak, this includes conref and keyref.
Markdown | Yes | You can author content using Markdown syntax. This is a wiki-like syntax for HTML that you can probably pick up in 10 minutes. Where Markdown falls short, you can use HTML. Where HTML falls short, you use Liquid, which is a programming language that allows you do advanced things.
Responsive design | Yes | Uses Bootstrap framework. 
Translation | Yes | I haven't explored translation yet, but healthcare.gov, which is built on Jekyll, has a Spanish translation of the site. The dev team created this [Multilinqual plugin](https://sylvain.durand.tf/making-jekyll-multilingual/). See also [multilinqual sites](http://www.developmentseed.org/blog/multilingual-jekyll-sites/).
PDF | Yes, but ... | You can generate PDFs from your Jekyll site, but this will involve a little setup. You basically set up a page that uses Liquid logic to get all the pages you want, and then you use PrinceXML (not part of Jekyll) to convert that page into a PDF. It will require some setup. 
Offline access | Yes | You can send someone a zip file of your site. I use a tool called Sitesucker to slurp my site into an offline-viewable download. 
Collaboration |  Yes | You collaborate with Jekyll projects the same way that developers collaborate with software projects. (You don't need a CMS.) Because you're working with text file formats, you can use any version control software (Git, Mercurial, Perforce, Bitbucket, etc.) as a CMS for your files. Jekyll works exceptionally well with Github because Github Pages can act as a direct host to render your repository into a live site. 
Scalability | Yes | Your site can scale to any size. It's up to you to determine how you will design the information architecture for your thousands of pages. You can choose what you display at first, second, third, fourth, and more levels, etc. 
Lightweight architecture | Yes! | You don't need a LAMP stack (Linux, Apache, MySQL, PHP) architecture to get your site running. All of the building is done on your own machine, and you then push the static HTML files onto a server.
Multichannel output | Yes | This term can mean a number of things, but let's say you have 10 different sites you want to generate from the same source. Maybe you have 7 different versions of your product, and 3 different locations. You can assemble your Jekyll site with various configurations, variants, and more. Jekyll actually does all of this quite well.
Skinnability | Yes | You can skin your Jekyll site to look identical to pretty much any other site online. If you have a UX team, they can really skin and design the site using all the tools familiar to the modern designer -- JavaScript, HTML5, CSS, jQuery, and more. Jekyll is built on the modern web development stack rather than the XML stack (XSLT, XPath, XQuery). 
Support | Yes | The community for your Jekyll site isn't so much other tech writers (as is the case with DITA) but rather the wider web development community.
Blogging features | Yes | Jekyll was originally designed as a blogging engine, so it has a lot of blogging features you may be familiar with, such as tags and categories. But it also has some features similar to a CMS, such as pages, metadata, and other files.
CMS interface | No | Unlike with WordPress, you don't log into an interface and navigate to your files. You work with text files and preview the site dynamically in your browser. Don't worry -- this is part of the simplicy that makes Jekyll awesome. 
WYSIWYG interface | No, but ... | I use Sublime Text to author content, because I like working in text file formats. But you can use any Markdown editor you want (e.g., Lightpaper for Mac, Marked) to author your content. There is a WYSIWYG interface called Prose IO built by Development Seed, but I haven't tried it. There may be some other CMS type plugins that give you more of a portal to browsing and managing your files.
Versioning | Yes, but... | Jekyll doesn't version your files. You upload your files to a version control system such as Git. Your files are versioned there.
Free web hosting | Yes, if... | If you upload your files to a Git repository, the repository can act as your web host. You only need to run `git push` commands to push your changes to your Github repo, and the update is live. This enables some pretty amazing update speeds. 
PC platform | Yes, but ... | Jekyll isn't officially supported on Windows, and since I'm on a Mac, I haven't tried using Jekyll on Windows. See this [page in Jekyllrb help](http://jekyllrb.com/docs/windows/) for details about installing and running Jekyll on a Windows machine.
jQuery plugins | Yes! | You can use any jQuery plugins you and other JavaScript, CMS, or templating tools. However, note that if you use Ruby plugins, you can't directly host the source files on Github because Github doesn't allow Ruby plugins. Instead, you can just push your output to Github. If you're not planning to use Github, there are no restrictions on any plugins of any sort. Jekyll makes it super easy to integrate every kind of plugin imaginable. 
Bootstrap integration | Yes! | This theme is built on Bootstrap. If you don't know what Bootstrap is, basically this means there are hundreds of pre-built components, styles, and other elements that you can simply drop into your site. For example, the responsive quality of the site comes about from the Bootstrap code base.
Fast-loading pages| Yes! | This is one of the Jekyll's strengths. Because the files are static, they loading extremely fast, approximately 0.5 seconds per page. You can't beat this for performance. (A typicall database-driven site like WordPress averages about 2.5 + seconds loading time per page.)
