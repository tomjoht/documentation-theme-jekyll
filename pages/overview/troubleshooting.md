---
title: Troubleshooting
permalink: /troubleshooting/
---

## Address already in use

When you try to build the site, you get this error: 

```
jekyll 2.5.3 | Error:  Address already in use - bind(2)
```
This happens if a server is already in use. To fix this, edit your config file and change the port to a unique number.

If the previous server wasn't shut down properly, you can kill the server process using these commands:

`ps aux | grep jekyll`

Find the PID (for example, it  looks like "22298").

Then type `kill -9 22298` where "22298" is the PID.

# "page 0" cross references in the PDF

 If you see "page 0" cross-references in the PDF, the URL doesn't exist. Check to make sure you actually included this page in the build. If it's not a page but rather a file, you need to add a class to the file so that your print stylesheet excludes the counter from it. Try adding `class="noCrossRef"` as an attribute to the link. In the css/printstyles.css file, there is a style that should remove the counter from anchor elements with this class.


