---
title: Tables
permalink: /tables/
---

## Multimarkdown Tables

You can use Multimarkdown syntax for tables. The following shows a sample: 

```
Column 1 | Column 2
--------|----------
cell 1a | cell 1b
cell 2a | cell 2b
```

 This renders to the following:

 Column 1 | Column 2
--------|----------
cell 1a | cell 1b
cell 2a | cell 2b

## jQuery datables

You also have the option of using a [jQuery datatable](https://www.datatables.net/), which gives you some more options. If you want to use a jQuery datatable, then add `datatable: true` in a page's frontmatter. This will enable the right scripts for the table on that page only (rather than loading the scripts on every page of the site.)

Also, add the scripts to trigger the jQuery table on your page:

```js
<script>
$(document).ready(function(){

    $('table.display').DataTable( {
        paging: true,
        stateSave: true,
        searching: true
    }
        );
});
</script>
```

The available options for the datable are described in the [datatable documentation](https://www.datatables.net/manual/options), which is excellent.

Additionally, you must add a class of `display` to the table. (You can change the class, but then you'll need to change the trigger above from `table.display` to whatever class you want to you. You might have different triggers with different options for different tables.)

Since Markdown doesn't allow you to add classes to tables, you'll need to use HTML for any datatables. Here's an example: 

```html
<table id="sampleTable" class="display">
   <thead>
      <tr>
         <th>Parameter</th>
         <th>Description</th>
         <th>Type</th>
         <th>Default Value</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>Parameter 1</td>
         <td>Sample description
         </td>
         <td>Sample type</td>
         <td>Sample default value</td>
      </tr>
      <tr>
         <td>Parameter 2</td>
         <td>Sample description
         </td>
         <td>Sample type</td>
         <td>Sample default value</td>
      </tr>
   </tbody>
</table>
```

This renders to the following:

<script>
$(document).ready(function(){

    $('table.display').DataTable( {
        paging: false,
        stateSave: true
    }
        );
});
</script>

<table id="sampleTable" class="display">
   <thead>
      <tr>
         <th>Parameter</th>
         <th>Description</th>
         <th>Type</th>
         <th>Default Value</th>
      </tr>
   </thead>
   <tbody>
      <tr>
         <td>Parameter 1</td>
         <td>Sample description
         </td>
         <td>Sample type</td>
         <td>Sample default value</td>
      </tr>
      <tr>
         <td>Parameter 2</td>
         <td>Sample description
         </td>
         <td>Sample type</td>
         <td>Sample default value</td>
      </tr>
   </tbody>
</table>