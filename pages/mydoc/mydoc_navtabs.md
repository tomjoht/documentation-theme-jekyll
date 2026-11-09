---
title:  Navtabs
tags: [formatting]
keywords: navigation tabs, hide sections, tabbers, interface tabs
last_updated: July 3, 2016
summary: "Navtabs provide a tab-based navagation directly in your content, allowing users to click from tab to tab to see different panels of content. Navtabs are especially helpful for showing code samples for different programming languages. To use Markdown inside a tab, add a markdown attribute to the tab's div."
sidebar: mydoc_sidebar
permalink: mydoc_navtabs.html
folder: mydoc
---


## Common uses

Navtabs are particularly useful for scenarios where you want to show a variety of options, such as code samples for Java, .NET, or PHP, on the same page.

While you could resort to single-source publishing to provide different outputs for each unique programming language or role, you could also use navtabs to allow users to select the content you want.

Navtabs are better for SEO since you avoid duplicate content and drive users to the same page.

## Navtabs demo

The following is a demo of a navtab. Refresh your page to see the tab you selected remain active.

<ul id="profileTabs" class="nav nav-tabs" role="tablist">
    <li class="nav-item" role="presentation"><button class="nav-link active" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="true">Profile</button></li>
    <li class="nav-item" role="presentation"><button class="nav-link" id="about-tab" data-bs-toggle="tab" data-bs-target="#about" type="button" role="tab" aria-controls="about" aria-selected="false">About</button></li>
    <li class="nav-item" role="presentation"><button class="nav-link" id="match-tab" data-bs-toggle="tab" data-bs-target="#match" type="button" role="tab" aria-controls="match" aria-selected="false">Match</button></li>
</ul>
<div class="tab-content">
<div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab" markdown="1">
## Profile

Praesent sit amet fermentum leo. Aliquam feugiat,

1.  nibh in u ltrices mattis
2.  felis ipsum venenatis metus, vel vehicula libero mauris a enim. Sed placerat est ac lectus vestibulum tempor.
    * Quisque ut condimentum massa.
    * ut condimentum massa.

> Proin venenatis leo id urna cursus blandit. Vivamus sit amet hendrerit metus.
</div>

<div class="tab-pane fade" id="about" role="tabpanel" aria-labelledby="about-tab">
    <h2>About</h2>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam vel sollicitudin felis. Sed eu arcu sed ipsum semper luctus eu a tortor. Suspendisse id leo eu metus laoreet varius. Mauris consequat accumsan ex, a iaculis metus fermentum a. Praesent sit amet fermentum leo. Aliquam feugiat, nibh in u ltrices mattis, felis ipsum venenatis metus, vel vehicula libero mauris a enim. Sed placerat est ac lectus vestibulum tempor. Quisque ut condimentum massa. Proin venenatis leo id urna cursus blandit. Vivamus sit amet hendrerit metus.</p>
</div>

<div class="tab-pane fade" id="match" role="tabpanel" aria-labelledby="match-tab">
    <h2>Match</h2>
    <p>Vel vehicula libero mauris a enim. Sed placerat est ac lectus vestibulum tempor. Quisque ut condimentum massa. Proin venenatis leo id urna cursus blandit. Vivamus sit amet hendrerit metus.</p>
</div>
</div>

## Code

Here's the code for the above (with the filler text abbreviated):

```html
<ul id="profileTabs" class="nav nav-tabs" role="tablist">
    <li class="nav-item" role="presentation"><button class="nav-link active" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="true">Profile</button></li>
    <li class="nav-item" role="presentation"><button class="nav-link" id="about-tab" data-bs-toggle="tab" data-bs-target="#about" type="button" role="tab" aria-controls="about" aria-selected="false">About</button></li>
    <li class="nav-item" role="presentation"><button class="nav-link" id="match-tab" data-bs-toggle="tab" data-bs-target="#match" type="button" role="tab" aria-controls="match" aria-selected="false">Match</button></li>
</ul>
<div class="tab-content">
<div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab" markdown="1">
## Profile

Praesent sit amet fermentum leo....
</div>

<div class="tab-pane fade" id="about" role="tabpanel" aria-labelledby="about-tab">
    <h2>About</h2>
    <p>Lorem ipsum ...</p>
</div>

<div class="tab-pane fade" id="match" role="tabpanel" aria-labelledby="match-tab">
    <h2>Match</h2>
    <p>Vel vehicula ....</p>
</div>
</div>
```

For more options, such as pills instead of tabs, see [Navs and tabs](https://getbootstrap.com/docs/5.3/components/navs-tabs/) in the Bootstrap documentation.

## Appearance in the mini-TOC

If you put a heading in the navtab content, that heading will appear in the mini-TOC as long as the heading tag has an ID. Markdown headings get IDs automatically. If you don't want the headings for each navtab section to appear in the mini-TOC, use an HTML heading without an ID attribute, as the About and Match tabs do.

## Markdown or HTML inside tabs

Kramdown doesn't process Markdown inside HTML elements by default. To use Markdown inside a tab, add `markdown="1"` to the tab's `div`, as the Profile tab does. Otherwise, write the tab content in HTML.

## Match up ID tags

Each tab button's `data-bs-target` attribute must match the `id` attribute of the tab content's `div` section. So if your tab has `data-bs-target="#acme"`, then you add `acme` as the ID attribute in `<div class="tab-pane fade" id="acme" role="tabpanel">`. Each `ul` of tabs also needs its own `id` so that the theme can remember the selected tab.

## Set an active tab

One of the tabs needs to be set as active, depending on what tab you want to be open by default (usually the first one). Add `active` to the tab button's class, and add `show active` to the matching content `div`:

```html
<div class="tab-pane fade show active" id="acme" role="tabpanel">
```

## Remembers the selected tab

The navtabs are part of Bootstrap, but this theme also remembers the last tab each user selected. The js/customscripts.js file saves the selected tab in the browser's local storage and opens it again when the page loads.

As a result, if the user refreshes the page, the active tab is the tab the user last selected (rather than defaulting to the default active tab).

## Functionality to implement

One piece of functionality I'd like to implement is the ability to set site-wide nav tab options. For example, if the user always chooses PHP instead of Java in the code samples, it would be great to set this option site-wide by default. However, this functionality isn't yet coded.

{% include links.html %}
