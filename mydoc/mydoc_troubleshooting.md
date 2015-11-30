---
title: Troubleshooting
tags: [getting_started]
keywords: trouble, problems, support, error messages, problems, failure, error, #fail
last_updated: November 30, 2015
summary: "This page lists common errors and the steps needed to troubleshoot them."
---


## Issues building the site

### Address already in use

When you try to build the site, you get this error in iTerm: 

```
jekyll 2.5.3 | Error:  Address already in use - bind(2)
```
This happens if a server is already in use. To fix this, edit your config file and change the port to a unique number.

If the previous server wasn't shut down properly, you can kill the server process using these commands:

`ps aux | grep jekyll`

Find the PID (for example, it  looks like "22298").

Then type `kill -9 22298` where "22298" is the PID.

Alternatively, type the following to stop all Jekyll servers:

```
kill -9 $(ps aux | grep '[j]ekyll' | awk '{print $2}')
```

### Build not entirely finishing

If your build doesn't entirely finish on the command line, check to see if you have a space after a comma when using multiple configuration files, like this:

```
jekyll serve --config config_base.yml, config_designer.yml
```

Remove the space after the comma, and the build will finish executing:

```
jekyll serve --config config_base.yml,config_designer.yml
```

### shell file not executable

If you run into permissions errors trying to run a shell script file (such as mydoc_multibuild_web.sh), you may need to change the file permissions to make the sh file executable. Browse to the directory containing the shell script and run the following:
    
```
chmod +x build_writer.sh
```

### Pygments not installed

The config file requires pygments for the highlighter. You must [download and install Pygments](http://pygments.org/download/), which requires Python, in order to use this syntax highlighter. If you don't want to bother with Pygments, open the configuration file and change `pygments` to `rouge`.

### "page 0" cross references in the PDF

 If you see "page 0" cross-references in the PDF, the URL doesn't exist. Check to make sure you actually included this page in the build. 
 
 If it's not a page but rather a file, you need to add a `noCrossRef` class to the file so that your print stylesheet excludes the counter from it. Add `class="noCrossRef"` as an attribute to the link. In the css/printstyles.css file, there is a style that should remove the counter from anchor elements with this class.
 
### The PDF is blank
 
 Check the prince-file-list.txt file in the output to see if it contains links. If not, you have something wrong with the logic in the prince-file-list.txt file. Check the conditions.html file in your \_includes to see if the audience specified in your configuration file aligns with the buildAudience in the conditions.html file

### Sidebar not appearing

 If you build your site but the sidebar doesn't appear, check the following: 

 Look in \_includes/custom/conditions.html and make sure the conditional values there match up with the values declared in the configuration file. Specifically, you need to make sure you've declared a value for project, product, platform, and version. 

 If you don't have any values for these properties, you still need to keep them in your configuration file. Just put something like `all` as the value. 

 {{site.data.alerts.note}} This theme is designed for single sourcing. If you're only building one site, you can remove these values from the \_includes/sidebar.html file and \_data/sidebar.yml files.{{site.data.alerts.end}}

 Understanding how the theme works can be helpful in troubleshooting. The \_includes/sidebar.html file loops through the values in the \_data/sidebar.yml file. There are `if` statements that check whether the conditions (as specified in the conditions.html file) are met. If the sidebar.yml item has the right product, platform, audience, and version, then it gets displayed in the sidebar. If not, it get skipped.

### Sidebar heading level not opening

 In your \_data/sidebar.yml file, you must also include the correct parameters (platform, product, audience version) for each heading. If an item contains something that should be displayed, the attributes for the heading should be listed.

 Without any attributes on heading levels, you could end up with scenarios where a section is entirely designed for one output but appears in every output regardless.

### Sidebar isn't collapsed

If the sidebar levels aren't collapsed, usually your JavaScript is broken somewhere. Open the JavaScript Console and look to see where the problem is. If one script breaks, then other scripts will break too, so troubleshooting it is a little tricky. 

### Search isn't working

If the search isn't working, check the JSON validity in the search.json file in your output folder. Usually something is invalid. Identify the problematic line, fix the file, or put `search: exclude` in the frontmatter of the file to exclude it from search.
 
 


