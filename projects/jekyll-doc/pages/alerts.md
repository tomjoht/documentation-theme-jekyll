---
title: Alerts
permalink: /alerts/
tags: getting_started
search: include
excerpt: Alerts are little warnings, info, or other messages that you have called out in special formatting.
---

<p class="test">are you red?</p>

<button id="scriptTest">test scripts</button>

{% include_relative reuse/variables.html %}

{{alertsuccess}} <b>Hey</b>: This is just a test.{{end}}

{{calloutprimary}}<b>Another test:</b> this is a very special note for you.....{{end}}

## this is a heading

<!--
 ____                        _        _____ _       _      _
/ ___|  __ _ _ __ ___  _ __ | | ___  |  ___(_) __ _| | ___| |_
\___ \ / _` | '_ ` _ \| '_ \| |/ _ \ | |_  | |/ _` | |/ _ \ __|
 ___) | (_| | | | | | | |_) | |  __/ |  _| | | (_| | |  __/ |_
|____/ \__,_|_| |_| |_| .__/|_|\___| |_|   |_|\__, |_|\___|\__|
                      |_|
-->

{{alertsuccess}}
<b>Success</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  
{{end}}

{{alertinfo}}
<b>Info</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
{{end}}

{{alertwarning}}
<b>Warning</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
{{end}}

{{alertdanger}}
<b>Danger</b>: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. 
{{end}}


{{alertsuccess}} This is a special alertlklklklkl messsage.jkjkjk {{end}}

## Notes

For notes, warnings, important, info, etc., use these styles:

<div class="bs-callout bs-callout-danger"><h4>Another test</h4>this is a test v2 </div>

{{calloutdanger}}
<h4>This is a warning</h4>whatever you do, do not trip while getting off a skyscraper's viewpoint platform.
{{end}}



```html
<div class="bs-callout bs-callout-default">
  <h4>Default Callout</h4>
  This is a default callout.
</div>

<div class="bs-callout bs-callout-primary">
  <h4>Primary Callout</h4>
  This is a primary callout.
</div>

<div class="bs-callout bs-callout-success">
  <h4>Success Callout</h4>
  This is a success callout.
</div>

<div class="bs-callout bs-callout-info">
  <h4>Info Callout</h4>
  This is an info callout.
</div>

<div class="bs-callout bs-callout-warning">
  <h4>Warning Callout</h4>
  This is a warning callout.
</div>

<div class="bs-callout bs-callout-danger">
  <h4>Danger Callout</h4>
  This is a danger callout.
</div>
```

Here's the result:

<div class="bs-callout bs-callout-default">
  <h4>Default Callout</h4>
  This is a default callout.
</div>

<div class="bs-callout bs-callout-primary">
  <h4>Primary Callout</h4>
  This is a primary callout.
</div>

<div class="bs-callout bs-callout-success">
  <h4>Success Callout</h4>
  This is a success callout.
</div>

<div class="bs-callout bs-callout-info">
  <h4>Info Callout</h4>
  This is an info callout.
</div>

<div class="bs-callout bs-callout-warning">
  <h4>Warning Callout</h4>
  This is a warning callout.
</div>

<div class="bs-callout bs-callout-danger">
  <h4>Danger Callout</h4>
  This is a danger callout.
</div>


## Alerts

You can also use these alerts from Bootstrap:

```html
<div class="alert alert-success" role="alert">This is a special alert messsage.</div>
<div class="alert alert-info" role="alert">This is a special info message.</div>
<div class="alert alert-warning" role="alert">This is a special warning message.</div>
<div class="alert alert-danger" role="alert">This is a special Danger message.</div>
```

Here's what they look like: 

<div class="alert alert-success" role="alert">This is a special alert messsage.</div>
<div class="alert alert-info" role="alert">This is a special info message.</div>
<div class="alert alert-warning" role="alert">This is a special warning message.</div>
<div class="alert alert-danger" role="alert">This is a special Danger message.</div>