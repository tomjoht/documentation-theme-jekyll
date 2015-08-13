---
title: Alerts
tags: [formatting]
keywords: notes, tips, cautions, warnings, admonitions
last_updated: August 12, 2015
summary: "You can insert notes, tips, warnings, and important alerts in your content. These notes are stored as shortcodes made available through the linksrefs.hmtl include."
---
{% include linkrefs.html %} 

## About alerts
Alerts are little warnings, info, or other messages that you have called out in special formatting. In order to use these alerts or callouts, put this include at the top of your page, just below your frontmatter:

{%raw%}
```liquid
{% include linkrefs.html %}
```
{%endraw%}

Then insert any an alert or callout as described in the following sections.

## Alerts

You can insert an alert by using any of the following code.

{%raw%}
alert | code
------|---------
note | {{note}} your note {{end}}  
tip | {{tip}} your tip {{end}} 
warning | {{warning}} your warning {{end}}
important | {{important}} your important info {{end}} 
{%endraw%}

The following demonstrate the formatting associated with each alert.

{{tip}} Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. {{end}}

{{note}} Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. {{end}}

{{important}} Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. {{end}}

{{warning}} Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. {{end}}

## Callouts

In contrast to the alerts, the callouts don't have a pre-coded bold-formatted preface such as note or tip. You just add one (if desired) in the callout text itself.

{%raw%}
callout | code
------|---------
callout_default | {{callout_default}} your callout_default content  {{end}}  
callout_primary | {{callout_primary}} your callout_primary content {{end}} 
callout_success | {{callout_success}} your callout_success content {{end}}
callout_primary | {{callout_primary}} your callout_primary content {{end}} 
callout_warning | {{callout_warning}} your callout_warning content {{end}} 
callout_info | {{callout_info}} your callout_info content {{end}} 

{%endraw%}

The following demonstrate the formatting for each callout. 

{{callout_danger}}<b>callout_danger</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{end}}


{{callout_default}}
<b>callout_default</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{end}}

{{callout_primary}}
<b>calloutprimary</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{end}}

{{callout_success}}
<b>calloutsuccess</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{end}}

{{callout_info}}
<b>calloutinfo</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{end}}

{{callout_warning}}
<b>calloutwarning</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{end}}


## Blast a warning to users

If you want to blast a warning to users on every page, add the alert or callout to the layouts/page.html page right below the frontmatter. Every page using the page layout (all, by defaut) will show this message.

## Using Markdown inside of notes

You can't use Markdown formatting inside notes.

