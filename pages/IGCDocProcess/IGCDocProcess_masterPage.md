---
title: Master Page
keywords: IGCDocProcess
summary: "This page describes how the master page is setup in the IGC Help project."
sidebar: IGCDocProcess_sidebar
permalink: IGCDocProcess_masterPage.html
folder: IGCDocProcess
---

All topics use the TopNav master page.

To apply a master page, select the appropriate master page from the **Topic Properties** dialog in the **Topic Style Class** drop-down.

 Master pages contain the code for the Google Analytics Global site tag. When adding a new master page, add this code to the \<HEAD\> tag.

> \<!\-- Global site tag (gtag.js) - Google Analytics \--\>
>
> \<script async=\"\"
> src=\"https://www.googletagmanager.com/gtag/js?id=UA-121391607-2\"\>\</script\>
>
> \<script\>
>
> window.dataLayer = window.dataLayer \|\| \[\];
>
> function gtag(){dataLayer.push(arguments);}
>
> gtag(\'js\', new Date());
>
> gtag(\'config\', \'UA-121391607-2\');
>
> gtag(\'config\', \'UA-121391607-2\', {\'anonymize\_ip\':true});
>
> \</script\>

-   -   -   -   
