---
title: Alerts
tags: [formatting]
keywords: notes, tips, cautions, warnings, admonitions
last_updated: November 30, 2015
summary: "You can insert notes, tips, warnings, and important alerts in your content. These notes are stored as shortcodes made available through the linksrefs.hmtl include."
---
{% comment %} comment 4 by saphira {% endcomment %}

## About alerts
Alerts are little warnings, info, or other messages that you have called out in special formatting. In order to use these alerts or callouts, just reference the appropriate value stored in the alerts.yml file as described in the following sections.

## Alerts

You can insert an alert by using any of the following code.

{%raw%}
alert | code
------|---------
note | {{site.data.alerts.note}} your note {{site.data.alerts.end}}  
tip | {{site.data.alerts.tip}} your tip {{site.data.alerts.end}} 
warning | {{site.data.alerts.warning}} your warning {{site.data.alerts.end}}
important | {{site.data.alerts.important}} your important info {{site.data.alerts.end}} 
{%endraw%}

The following demonstrate the formatting associated with each alert.

{{site.data.alerts.tip}} Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. {{site.data.alerts.end}}

{{site.data.alerts.note}} Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. {{site.data.alerts.end}}

{{site.data.alerts.important}} Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. {{site.data.alerts.end}}

{{site.data.alerts.warning}} Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. {{site.data.alerts.end}}

## Callouts

In contrast to the alerts, the callouts don't have a pre-coded bold-formatted preface such as note or tip. You just add one (if desired) in the callout text itself.

{%raw%}
callout | code
------|---------
callout_default | {{site.data.alerts.callout_default}} your callout_default content  {{site.data.alerts.end}}  
callout_primary | {{site.data.alerts.callout_primary}} your callout_primary content {{site.data.alerts.end}} 
callout_success | {{site.data.alerts.callout_success}} your callout_success content {{site.data.alerts.end}}
callout_warning | {{site.data.alerts.callout_warning}} your callout_warning content {{site.data.alerts.end}} 
callout_info | {{site.data.alerts.callout_info}} your callout_info content {{site.data.alerts.end}} 
{%endraw%}

The following demonstrate the formatting for each callout. 

{{site.data.alerts.callout_danger}}<b>callout_danger</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{site.data.alerts.end}}


{{site.data.alerts.callout_default}}
<b>callout_default</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{site.data.alerts.end}}

{{site.data.alerts.callout_primary}}
<b>calloutprimary</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{site.data.alerts.end}}

{{site.data.alerts.callout_success}}
<b>calloutsuccess</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{site.data.alerts.end}}

{{site.data.alerts.callout_info}}
<b>calloutinfo</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{site.data.alerts.end}}

{{site.data.alerts.callout_warning}}
<b>calloutwarning</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{site.data.alerts.end}}


## Blast a warning to users

If you want to blast a warning to users on every page, add the alert or callout to the layouts/page.html page right below the frontmatter. Every page using the page layout (all, by defaut) will show this message.

## Using Markdown inside of notes

You can't use Markdown formatting inside alerts. This is because the alerts leverage HTML, and you can't use Markdown inside of HTML tags.

