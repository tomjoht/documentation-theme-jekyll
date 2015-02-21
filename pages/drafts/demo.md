---
layout: page
title: "Demo Page now i just changed it"
permalink: /demo/
tags: getting_started
---



<img src="{{ "/images/web/rastertext.png" | prepend: site.baseurl }}">

## svg image

<img src="{{ "/images/web/svgtext.svg" | prepend: site.baseurl }}">


I give this plugin two :+1:!

:man:


Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec commodo maximus arcu nec imperdiet. Pellentesque maximus lorem sed enim interdum ultricies. Proin suscipit finibus malesuada. Duis interdum semper nisi, et porta enim accumsan a. Donec nec lectus posuere, <span id="myButton" style="font-style:italic; color: red; text-decoration: underline;" data-toggle="tooltip" data-placement="left" title="" data-original-title="Tooltip on left. Fusce iaculis neque erat, non accumsan ex pellentesque id. Duis molestie consectetur sem nec porttitor. Vestibulum dignissim leo urna, quis lacinia lacus scelerisque id. Etiam cursus est ac luctus porta. Sed nec dictum lectus. Vivamus bibendum eget dolor non laoreet. Aenean efficitur arcu turpis, fringilla elementum ex tempus in.">Tooltip on left. </span> Donec commodo maximus arcu Donec commodo maximus arcu.

## this is the first section

{{ zebra }}





## Jumbotron

<div class="jumbotron">
  <h1>Hello, world!</h1>
  <p>...</p>
  <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
</div>

## Thumbnails

<div class="row">
  <div class="col-xs-6 col-md-3">
    <a href="#" class="thumbnail">
      <img data-src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTcxIiBoZWlnaHQ9IjE4MCIgdmlld0JveD0iMCAwIDE3MSAxODAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMTcxIiBoZWlnaHQ9IjE4MCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjU5LjU0Njg3NSIgeT0iOTAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4xNzF4MTgwPC90ZXh0PjwvZz48L3N2Zz4=" alt="...">
    </a>
  </div>
  ...
</div>





## Tabs

this is some stuff...


### Subnavigation

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec commodo maximus arcu nec imperdiet. Pellentesque maximus lorem sed enim interdum ultricies. Proin suscipit finibus malesuada. Duis interdum semper nisi, et porta enim accumsan a. Donec nec lectus posuere, ultrices tortor in, gravida elit. Nunc non elit non erat ullamcorper consectetur. Integer at diam porttitor, laoreet lectus nec, scelerisque sem. Fusce iaculis neque erat, non accumsan ex pellentesque id. Duis molestie consectetur sem nec porttitor. Vestibulum dignissim leo urna, quis lacinia lacus scelerisque id. Etiam cursus est ac luctus porta. Sed nec dictum lectus. Vivamus bibendum eget dolor non laoreet. Aenean efficitur arcu turpis, fringilla elementum ex tempus in.

### Subnav 2

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec commodo maximus arcu nec imperdiet. Pellentesque maximus lorem sed enim interdum ultricies. Proin suscipit finibus malesuada. Duis interdum semper nisi, et porta enim accumsan a. Donec nec lectus posuere, ultrices tortor in, gravida elit. Nunc non elit non erat ullamcorper consectetur. Integer at diam porttitor, laoreet lectus nec, scelerisque sem. Fusce iaculis neque erat, non accumsan ex pellentesque id. Duis molestie consectetur sem nec porttitor. Vestibulum dignissim leo urna, quis lacinia lacus scelerisque id. Etiam cursus est ac luctus porta. Sed nec dictum lectus. Vivamus bibendum eget dolor non laoreet. Aenean efficitur arcu turpis, fringilla elementum ex tempus in.

## Nav tabs

<div class="tabbable">
  <ul class="nav nav-tabs">
    <li class="active"><a href="#tab1" data-toggle="tab">Section 1</a></li>
    <li><a href="#tab2" data-toggle="tab">Section 2</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab1">
      <p>I'm in Section 1.</p>
    </div>
    <div class="tab-pane" id="tab2">
      <p>I'm in Section 2.</p>
    </div>
  </div>
</div>






## Snippets


If you're pulling in a lot more content, you could pull in the whole file:

{% raw %}
include_relative _includes/conrefs/warning.md (no file here-- creates warning)
{% endraw %}

## Conditional Filtering

{% if page.audience == 'developer' %}

This is for the developer audience.

{% else if page.audience == 'marketer' %}

This is for the marketer audience.

{% endif %}

Here's another example: 

{% if page.permalink contains "identifiers" %}
hooray
{% elsif page.permalink contains "bootply" %}
boo
{% else %}
whateves
{% endif %}

Note that here I'm using contains rather than ==. If using ==, you must use all the slashes that appear in the permalink. 


## Table

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |
{: class="table"}


| Header1 | Header2 | Header3 |
|:--------|:-------:|--------:|
| cell1   | cell2   | cell3   |
| cell4   | cell5   | cell6   |
|----
| cell1   | cell2   | cell3   |
| cell4   | cell5   | cell6   |
|=====
| Foot1   | Foot2   | Foot3
{: rules="groups"}


## Includes

Here's my footer file included here: 

include footer.html 




This example demonstrates fenced code blocks with a class name:  

```java
/*
Java Class example.
This Java class example describes how class is defined and being used
in Java language.
 
Syntax of defining java class is,
<modifier> class <class-name>{
  // members and methods
}
*/
 
public class JavaClassExample{
  /*
  Syntax of defining memebers of the java class is,
    <modifier> type <name>;
  */
  private String name;
  /*
  Syntax of defining methods of the java class is,
  <modifier> <return-type> methodName(<optional-parameter-list>) <exception-list>{
                    ...
  }
  */
  public void setName(String n){
    //set passed parameter as name
    name = n;
  }
  public String getName(){
    //return the set name
    return name;
  }
  //main method will be called first when program is executed
  public static void main(String args[]){
    /*
    Syntax of java object creation is,
    <class-name> object-name = new <class-constructor>;
    */
    JavaClassExample javaClassExample = new JavaClassExample();
    //set name member of this object
    javaClassExample.setName("Visitor");
    // print the name
    System.out.println("Hello " + javaClassExample.getName());      
  }
}
```

more **content**

## Reviewing content

- Use Disqus

## 




