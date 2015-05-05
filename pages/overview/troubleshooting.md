---
title: Troubleshooting
permalink: /troubleshooting/
tags: []
keywords: 
audience: 
last_updated: 
summary: 
---
{% include linkrefs.html %} 

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

### build_writer.sh file not executable

If you run into permissions errors trying to run the build_writer.sh file, you may need to change the file permissions to make the sh file executable. Browse to the directory containing build_writer.sh and run the following:
    
```
chmod +x build_writer.sh
```

### Pygments not installed

The config file requires pygments for the highlighter. You must [download and install Pygments]([pygments](http://pygments.org/download/)), which requires Python, in order to use this syntax highlighter. If you don't want to bother with Pygments, open the configuration file and change `pygments` to `rouge`.

## PDF issues

### "page 0" cross references in the PDF

 If you see "page 0" cross-references in the PDF, the URL doesn't exist. Check to make sure you actually included this page in the build. 
 
 If it's not a page but rather a file, you need to add a class to the file so that your print stylesheet excludes the counter from it. Try adding `class="noCrossRef"` as an attribute to the link. In the css/printstyles.css file, there is a style that should remove the counter from anchor elements with this class.
 
 ### The PDF is blank
 
 Check the prince-file-list.txt file in the output to see if it contains links. If not, you have something wrong with the logic in the prince-file-list.txt file. Check the conditions.html file in your _includes to see if the audience specified in your configuration file aligns with the buildAudience in the conditions.html file
 
 
 


