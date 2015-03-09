---
title: Alerts
permalink: /alerts/
---

Alerts are little warnings, info, or other messages that you have called out in special formatting.

##  Sample callouts

This page demonstrates the various kinds of alerts and callouts you can use.

{{site.data.callouts.calloutdanger}}
<b>calloutdanger</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{site.data.callouts.end}}

{{site.data.callouts.calloutdefault}}
<b>calloutdefault</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{site.data.callouts.end}}

{{site.data.callouts.calloutprimary}}
<b>calloutprimary</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{site.data.callouts.end}}

{{site.data.callouts.calloutsuccess}}
<b>calloutsuccess</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{site.data.callouts.end}}

{{site.data.callouts.calloutinfo}}
<b>calloutinfo</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{site.data.callouts.end}}

{{site.data.callouts.calloutwarning}}
<b>calloutwarning</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{site.data.callouts.end}}

## Sample alerts

{{site.data.callouts.alertsuccess}}<b>alertsuccess</b>: Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. {{site.data.callouts.end}}

{{site.data.callouts.alertinfo}}<b>alertinfo</b>: Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. {{site.data.callouts.end}}

{{site.data.callouts.alertwarning}}<b>alertwarning</b>: Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. {{site.data.callouts.end}}

{{site.data.callouts.alertdanger}}<b>alertdanger</b>: Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. {{site.data.callouts.end}}

## Blast a warning to users

If you want to blast a warning to users on every page, add some text to the layouts/page.html page above the toc reference, like this:

```html
<div class="bs-callout bs-callout-warning"><b>Note:</b> This note will appear on every page in the site. </div>
```

Every page using the page layout (all, by defaut) will show this message.

