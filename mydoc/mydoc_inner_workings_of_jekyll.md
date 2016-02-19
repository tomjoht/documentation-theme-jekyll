---
title: Inner Workings...
tags: [formatting]
keywords: images, screenshots, vectors, svg, markdown syntax
last_updated: November 30, 2015
summary: ""
published: false
---

In this page, I'm going to explain some of the inner workings of Jekyll, including some weaknesses of the theme that could be addressed. These points aren't in any particular order.
 
Location of build scripts
The build scripts (ending in ".sh") in the root directory are in the root directory rather than a subdirectory because for some reason, when I put them in a subdirectory, they didn't work. Things only seemed to work in the root directory, but maybe with some finagling or path adjustment the build scripts could be moved to a subfolder.
Grouping of projects
At one time in my architecting of the Jekyll theme, I tried to group all of the assets for each project into their own folders...the includes, the images, files, stylesheets, the data sources, and more. But in trying to make it work, it just didn't. Jekyll likes things distributed into different folders like this.
Redirect on home page
In order to allow different product doc sets within the same jekyll project, I created a series of subfolders that correlate with each project. This change required quite a bit of updates. 
With posts, Jekyll automatically extracts them from subfolders and puts them into the root folder. It's not the case with pages. Pages remain in the subfolders. 
With the relative linking strategy, having different pages in different subfolders created some serious challenges with links. You can't have a set of links that works when you keep jumping different levels of nesting. For example, if you're on the homepage the link to the CSS file is ../css/customstyles.css, but once you drill into a subfolder the same link becomes ../../css/customstyles.css.
I could have solved this issue a number of ways. One way would be to put an attribute on the homepage that referenced a different layout. For example, the homepage could have linked to default_home.html while all project pages could link to default.html's layout. That probably wouldn't be a bad approach, except for the way it duplicated content. Additionally, when you searched for something from the home page versus searching from a content page, the links would be messed up, as well as tags on the homepage versus a content page, and so on.
I decided to keep everything at the same level. When you go to the index.html file in the project, this is what appears:

{% raw %}
{% include custom/conditions.html %}
 
<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="0;url={{projectFolder}}/home.html">
    <script type="text/javascript">
        window.location.href = "{{projectFolder}}/home.html"
    </script>
 
</head>
<body>
 
</body>
</html>
The conditions.html file assigns the variable for projectFolder:
{% assign projectFolder = "resolve" %}
This makes the preceding block read like this:
{% include custom/conditions.html %}


 
<!DOCTYPE HTML>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="0;url={{projectFolder}}/home.html">
    <script type="text/javascript">
        window.location.href = "resolve/home.html"
    </script>
 
</head>
<body>
 
</body>
</html>

{% endraw %}
The code here is standard code for an HTTP redirect. When a browser sees this code, it automatically changes the location to resolve/home.html.
This is how the same index.html file can route to the right home.html file among different project folders.
The only downside of this approach is that it lengthens the URL. Now you have http://docs.the41.internal/resolve/fe/resolve/home.html instead of just  http://docs.the41.internal/resolve/fe/index.html. However, it makes it so that all the paths for all pages in the project are all at the same level. 
 
Relative paths
Jekyll is really designed to use an absolute link structure rather than relative links. However, the absolute link structure ties you to a specific domain, which doesn't work for tech docs when we're pushing content out to a number of different domains.
After some hacking, I converted the absolute or permalink structure to relative links. These link paths affect everything from the TOC links, inline links in a page, links in the top navigation, links from tags, links from search results, and so on. 
 
Search
The basic search in the Jekyll theme relies on a JSON file located in the root folder:
---
title: search
layout: none
search: exclude
---
{% raw %}
[
{% for page in site.pages %}
{% unless page.search == "exclude" %}
{
"title": "{{ page.title | escape }}",
"tags": "{{ page.tags }}",
"keywords": "{{page.keywords}}",
"url": "{{ page.url | prepend: '..' }}",
"summary": "{{page.summary}}"
},
{% endunless %}
 
{% endfor %}
null
]
{% endraw %}
This code iterates through each page in the site.pages namespace and pushes the page into a JSON structure. This content is used by the search feature, which is a simple technique explained in Simple Search by Christian Fei. 
You'll notice that body isn't a field pushed into this search. This is because not only does a lot of the formatting in the body element tend to make the JSON invalid, including the body here makes the keyword search highlighting problematic. For example, suppose you have a keyword in the body called "configuration." But you have another topic called "Configuration." Suppose you have 10 other topics that all mention the word "configuration" before Jekyll gets down to indexing the topic that starts with "Configuration." Well, the topic that starts with "Configuration" won't actually appear in your search results! WTF!
This is because there's no weighting of content in the JSON search index. Things are just weighted based on their occurrence in the results.
Overall, the JSON search is pretty poor. I highly recommend integrating Algolia or Swiftype. Algolia is cheaper ($50/month) but Swifttype ($200/month) will implement search for you. Unfortunately I didn't prioritize the integration of search into the theme. The more content you include in your docs, the more search will grow in importance. Our current file model is to make every product's output separate, so it's not that big of a deal. 
Sharing content across projects
When you share content across projects, you have to store the content in the includes folder, and you have to store any images in the common_images folder. I would have preferred storing images inside the includes folder as well, but you can only put html and md files in there, not images.
Content in the includes folder is only included based on the include tags in your content, but the content in the common_images folder will unfortunately 
I realize they're kind of spread out...
Misc. Weaknesses
If you want to improve the theme, here are some of the weaknesses/challenges to work on.
no markdown in notes. When you insert a note, tip, or caution, you have to use HTML formatting inside the curly braces. This is because these notes are just variables for some bootstrap code that provides the formatting, and you can't use markdown inside of HTML. However, I routinely put markdown inside these notes and don't realize it until looking at the output. It would be better to find an approach less prone to error.
complex markdown formatting. When your markdown formatting gets complex, such as a list in a subbullet within an ordered list, it can be a pain to get the formatting right. Sometimes I think it might be better just to use HTML throughout the project and scrap markdown altogether. HTML is a lot more reliable. BTW, if you are using HTML, to get the syntax highlighting, you must use the  more traditional syntax highlighting tags;
Unknown macro: {% highlight js %}
some js code...
Unknown macro: {% endhighlight %}
No error checking. if a link is broken, or markdown filtering doesn't work, you won't know until you see the output. We need better validity checking for broken links and broken code.
Links in topics shared across projects. If you're sharing content from one project to another, you can't include links in there except with conditions that would filter it out. This challenge is not really specific to jekyll, though, but is rather a larger challenge in tech comm.
More dropdown levels in TOC. At times I wanted to add another level in the TOC sidebar, but I never had a really compelling case for doing it.
Lavish.css overlaps. I used a tool called lavish bootstrap to speed up the color customization of the bootstrap theme. I have both the bootstrap css and the lavish css in the same page, so I'm sure there are tons of styles that are redundant and overwritten between the two, but I never tried to sort out any redundancy there.
TOC spacing is touchy. Getting the spacing right in the table of contents files can be tricky. I wish there was a better way to avoid errors there.
Duplication of values from config files into conditions.html file. Some of the same values (product, version, platform, etc.) are duplicated between the configuration file and the conditions.html file. I wish there wasn't any duplication, but I couldn't find a way around it.
No variables in frontmatter. You can't have variables in frontmatter. This can be a real pain if you need them, such as with the resourceDirectory / DIResource application naming.
No ability to lock down variables. It would be nice to lock down the core variables of product, platform, audience, etc. to a restricted set of terms. This would help everyone stay on the same page.
need to get on the same page about how we're using each of them. I think John might be using "version" different from how I'm using "version" in some of my project. I think the general usage of these variables is something to consider as a team since they impact the way content is shared across projects.
Search is weak. The JSON-based search sucks. You should implement Algolia or Swiftype intsead.

