---
title: Document Structure
keywords: BOADocStandards
summary: "This page describes the document structure the doc team follows when writing print documentation."
sidebar: BOADocStandards_sidebar
permalink: BOADocStandards_DocStructure.html
folder: BOADocStandards
---

A typical manual has four main sections: Cover Page, Table of Contents, Manual Body and the Version History page. The templates contain the formatting and layout for these four sections.

## Use Document Properties panel

Access the Document Properties panel and complete the fields as indicated to populate the template for manual. Refer to Update Document Properties [BOADocProcess_DevManuals.html#updatedocprop] for more information.

## Cover Page

The cover page contains the required BOA logo, document title, and product version. The Release Notes contain the release date, but the manuals do not. The cover page contains the following information:

-   **Title** -- Name of the manual.
-   **Product** -- Application for which the manual is being written. The proper product name must be used with assigned trademarks. View the current list of trademarks at [[http://www.boaweb.com/trademarks/](http://www.boaweb.com/trademarks/).

-   **Address/contact information**
    {% include note.html content="Title and product are added on the Document Properties panel." %}

## Version History Page

Include all changes made to the installation manuals on the *Version History* page.

<table>
    <colgroup>
        <col width="10%" />
        <col width="10%" />
        <col width="40%" />
        <col width="40%" />
    </colgroup>
    <thead>
        <tr class="header">
            <th>Revision Release Date</th>
            <th>Associated Release Version</th>
            <th>Revision Description</th>
            <th>Associated JIRA Tickets</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>4/18/2018
            </td>
            <td>
            6.7
            </td>
            <td>
            All currently supported versions of SQL Server work with their associated SQL 2012 Client Tools or SQL 2014/2016 Integration Services. Updated the <i>Web Server</i> section of this document.
            </td>
            <td>
            DSP-9412--SSIS only works when 2012 SQL Client Tools is installed.
            </td>
        </tr>
    </tbody>
</table>

Add a new record to the Version History table when updating the document.

## Table of Contents

The Table of Contents lists each topic heading and its page number. The template is designed to display three style levels: Heading 1, Heading 2 and Heading 3. Once the body of the manual is created or any changes are made, the Table of Contents must be updated. The header includes product, document title and version.

To update the Table of Contents:

1. Right-click anywhere on the Table of Contents page.
2. Click **Update Field or press F9**; a pop-up displays.
3. Click **Update** **entire table** option.
4. Click **OK** button; the entire table updates.

## Footers

Footers must be created using the Header and Footer Insert options in Word. To create or edit a header/footer in Word:

1. Select the **Insert** tab on the navigation bar above the ribbon.
2. Click **Footer** on the ribbon.
3. Click **Edit Footer**. The footer editor will then display at the bottom of the page.
4. When finished with edits, click **Close Header and Footer** icon on the ribbon.
   {% include note.html content="As of 7/5/2017, the footer in our printed documents are as follows in the screenshots below:" %}
   {% include image.html file="coverPageFooter.png" alt="Cover Page Footer" caption="Cover Page Footer" %}
   {% include image.html file="documentBodyFooter.png" alt="Document Body  Footer" caption="Document Body Footer" %}
   {% include note.html content='The text in the footer has been updated with our copyright policies and reads: "Copyright © 2018 BackOffice Associates, LLC and/or its affiliates.  All rights reserved.  This document contains confidential and proprietary information and reproduction is prohibited unless authorized by BackOffice Associates®.  Other names appearing on the Site may be trademarks of their respective owners."' %}

## Document Body

The document body contains the bulk of the information. Depending on the detail of the content, it can be broken out into three levels of headings, Heading 1, Heading 2 and Heading 3. Pre-defined formatting styles have been created in the Manual template and style set for headings, text, bullets, numbered steps, tables, notes, screen shots, etc. All styles can be applied by clicking a style on the Quick Styles Gallery. Refer to [Styles][BOADocStandards_PrintStyles] for detailed explanation of the Styles font and spacing.

## Heading 1

Heading 1 is the first level of detail in the document body and is always followed with a summary of the section. Multiple Heading 1s can exist in a document.

## Heading 2

Heading 2 is the second level of detail in the manual body and is a sub-section of a Heading 1 section. It is not necessary to include summary text under Heading 2 unless further explanation is necessary.

## Heading 3

Heading 3 is the third level of detail in the manual body and is a sub-section of a Heading 2 section. It is not necessary to include summary text under Heading 3 unless further explanation is necessary.

## Bullets

Use bullets to present a list of information. Do not use bullets if describing a sequential process or steps a user needs to complete in the application. If stating a thought or item, the first word is bolded followed by an en dash. There are always at least two items bulleted when using bullets. **List Bullet** Style contains the standard formatting for bullets.

Begin each bulleted item with the same structure, e.g., a present tense verb or a noun.

## Numbered Steps

Use numbered steps when describing a sequential process or steps a user needs to complete in the application. Include one action for each step. Each set of numbered steps must be preceded by a line that explains what the steps accomplish. Start the line with the word "To" and end with a colon. There must be at least two steps when numbering steps. If listing options after a numbered step, use the **Indented Bullet** Style.

## Tables

Use a table to organize information, where applicable. The column headings and the first column (if appropriate) are bolded. For the rest of the table text, use plain text, not bolded or italicized. Refer to [Styles][BOADocStandards_PrintStyles] for more information about table styles.

To create a table:

1. Enter column headings separated by tabs.
2. Highlight all column headings, the first row.
3. Click **Insert** tab.
4. Click Table Grid.
5. Select Convert Text to Table.
6. Select **Tabs.**
7. Click **OK**.
8. Highlight the column heading row.
9. Select the **Home** tab.
10. Select **Table** **Column** from the Style Gallery.
11. Highlight the second row.
12. Select **Table** **Text** from the Style Gallery.
13. Click **Tab** key from the last column to add another row.
14. Repeat as needed.
15. Enter text.
    {% include note.html content="If bulleting two or more items within a table, highlight the text or the cell and apply the style Bullet Table. Apply the Table Text style to table content and the Table Column style to the table heading." %}

    <table>
        <colgroup>
            <col width="30%" />
            <col width="35%" />
            <col width="35%" />
        </colgroup>
        <thead>
            <tr class="header">
                <th>Column Heading</th>
                <th>Column Heading</th>
                <th>Column Heading</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Table
                </td>
                <td>
                Content
                <ul>
                    <li>Bulleted Items</li>
                    <li>Bulleted Items</li>
                    <li>Bulleted Items</li>
                </ul>
                </td>
                <td>
                Content
                </td>
            </tr>
        </tbody>
    </table>

{% include links.html %}
