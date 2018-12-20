---
title: Importing Manuals into Flare
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "This page describes an efficient process for importing Word documents into Flare."
permalink: BOADocProcess_FlareImport.html
folder: BOADocProcess
---

## Part 1: Create Flare Project and Add Files

### Create a Flare Project

To create a Flare project:
1.  Open Flare.
2.  Click **File** from top nav bar and select **New Project  > New Project** to open the New Project Wizard.
3.  In the **Project name** field enter the name for the Flare project.
    {% include tip.html content="Ex. Training Manuals" %}
4.  Select where you want to store the Flare project using the **. . .** button to the right of the **Project folder** field.
5.  Click **Next**.
6.  Select **Empty** from **New from template**.
7.  Click **Next**.
8.  Select your primary target type from the **Available Targets** list box.
9.  Click **Finish**.

### Add Files to Flare

To add stylesheets/page layouts/topics to Flare project:
1.  Find the desired stylesheet/page layout in Windows File Exporer and copy the folder.
2.  Select the Flare project and open the **Content  > Resources  > Stylesheets** folder in Windows File Exporer and paste in your stylesheet.
3. Open the **Content  > Resources  > PageLayouts** folder in Windows File Explorer and paste in your page layouts.
   {% include tip.html content="Depending on your project you may also want to add the Title, Document History and Table of Contents topics from the Content folder." %}
   {% include tip.html content="Flare separates table styles into a separate stylesheet and it is assigned its own folder. If you have table styles, separate them from your stylesheet into a new document and paste it into the **Tablestyles** folder." %}
4. Open the Flare project.
5. Click **Project** in the top nav menu.
6. Click **Project Properties** on the ribbon.
7. Select the main stylesheet you just added in the Master Stylesheet list box.
    {% include note.html content="You do not want to add a Master Page Layout because page layout changes based on what is on the page." %}

## Part II: Import Word Files and Map Styles

### Import Word File

To import a word file into Flare:
1.  Click on the **Project Organizer** tab.
2.  Right-click the **Imports** folder and select **Add MS Word Import File . . .**
3.  Enter a name for the import in the **File Name** field.
    {% include tip.html content="Ex. Integrate -- I would recommend adding the name of the manual here as each content folder will contain topic files for that manual." %}
4.  Click **Add**.

### Map Styles

To map styles in import file in Flare:
1.  Uncheck the **Link Generated Files to Source Files** checkbox at the bottom of the page on the **Source Files** tab.
    {% include important.html content="The reason you are doing this is you don't want to be connected to the Word document anymore. If you make changes going further, you will make those changes in Flare, not Word." %}
2.  Click the green **+** icon.
3.  Find the Word file you want to import in Windows File Explorer.
4.  Click **Open**.
5.  Click the **New TopicStyles** tab.
6.  Select the style you want to separate topics by on the left side.
    {% include tip.html content="For example: I separated the topics by the Exercise style. For a more granular breakup, you can separate topics by more than one style type." %}
    {% include important.html content="If you break up your topic by more than one style, you must set up your Outline style and your auto-numbering differently than what is demonstrated in the original steps." %}
7.  Click the **arrow** pointing right to add the style. You will see it populate the text area after you click.
8.  Click the **Stylesheet** tab.
9.  Select the stylesheet you want to use by clicking the **Stylesheet** button.
10. Find the stylesheet we already pasted into the **Stylesheet** folder.
11. Click the **Don't Preserve MS Word Styles** option under **Source Styles**.
    {% include note.html content="The reason we are not preserving these styles is we are going to convert the Word styles to normal CSS styles. You will not lose all the work you have done to apply styles to your Word document."%}
12. Click the **Paragraph Styles** tab.
    {% include tip.html content="On the left side you will see a list of all the **MS Word Styles** and on the right side you will see a list of the **Flare Styles** from the stylesheet we selected." %}
13. Select an **MS** **Word Style** on the left and select the corresponding **Flare Style** on the right.
14. Click the **Map** button to map the styles.
15. Do this for the remainder of the styles.

    |---------------+------------------|
    Word Style | Flare Style
    |:--------------|:-----------------|
    | \[Basic Paragraph\] |  p.footertitle |
    | Body                |        p       |
    | Caption             |  p.caption     |
    | Document Title      |  p.subtitle    |
    | Exercise            |  h1.exercise    |
    | Heading 1           |  h1            |
    | Heading 2           |  h2            |
    | Heading 3           |  h3            |
    | Note                |  p.note        |
    | Outline             |  h2.outline    |
    | Product Name        |  p.pagetitle   |
    | Release Date        |  p.releasedate |
    | TOC 1               |  p.TOC1        |
    | TOC 2               |  p.TOC2        |
    | Version Number      |  p.version     |
    |---------------+------------------|

    {% include note.html content="Make sure you have added the character styles for all bold and italicized words for these styles to be displayed -- *See [Preparing Documents for Importation into Flare][BOADocProcess_PrepareFlareImport] for more information on this step." %}
19. Click the **Save All** icon in top left corner.
20. Click **Import** at the top of the page.
21. Click **Accept**.

## Part III: Organize Content and Clean Up Styles

### Organize Content

To organize content:
1.  Open the Flare project.
2.  Open the folder with the topics you imported from the Word file. It will be named what you named your import file.
3. View your topics and make sure they are divided the way you want them to be divided.
    {% include note.html content="When you imported the Word document, you listed the heading levels which would break up the document into topics. Wherever that style was located in the Word document, Flare started a new Topic. However, in some instances, topics were created by default, like files that do not have that style. Flare does a pretty good job here, but you want to go through and make sure all of your content is divided the way you wanted it to be divided. See where each topic begins and ends and if it isn't to your liking, cut and paste content where it should be and create/delete topics as needed." %}
3.  You will also want to take a look at your images to make sure there are no duplicates.
    {% include tip.html content="You may also want to organize them by type/content sections into different folders. By default Flare names all images by the title of the topic they are in, and then adds numbers, which is not necessarily the best way to organize your images." %}
    {% include warning.html content="When you do all of this reorganizing, you are changing file paths so Flare will ask you if you want to update the links. Make sure you say **yes** to that or your images and files will not be connected properly." %}

### Clean up Styles

To clean up styles:
1.  Open the first topic in your document.
2.  Check to make sure styles have been applied properly by using the cursor to click the text and looking in the **Styles** panel to see what style has been applied.
    {% include note.html content="To open **Styles** panel, click **Home** in top nav menu and select **Style Window** from the ribbon." %}
3.  Specific issues that need addressing:
    * **Delete Example and Outline numbers** -- to be replaced with auto styles. The Flare styles already have Exercise and outline numbers as part of the style. So those words/numbers will need to be removed.
      {% include tip.html content="It will seem like all of the Exercises are Exercise 1 in the project. Once the document is produced though these numbers will populate correctly once you have formatted your TOC appropriately." %}
    * **Make sure all li's are contained in a single ol or ul** -- To make them under one ul or ol, you can do this in the code or you can highlight the entire set of li's, then click the bullets button on the ribbon 3 times, until they are all under one li.
      {% include image.html file="manyUls.png" alt="What it should not look like." caption="What it should not look like." %}
      {% include image.html file="oneUl.png" alt="What it should look like." caption="What it should look like." %}
    * **Reformat nested lists** - since Flare and Word do lists differently, your nested lists may not be formatted properly when they are imported into Flare.
      1. Change the bullets to square bullets by highlighting the bulleted items you want to be square bullets and then clicking on the bullet button in the ribbon and selecting the square bullets.
      2. Click the **Text Editor** tab to view the code.
         {% include image.html file="textEditorTab.png" alt="Text Editor tab in Flare" caption="Text Editor Tab in Flare" %}
      3. Copy the entire ul for the indented li items and paste it within the li tags (between the \<li\> and \</li\> tags) they will be indented under.
         {% include image.html file="nestedLists.png" alt="What it should look like." caption="What it should look like." %}
     * **Notes issues:** Again because of the difference in how Word and Flare handle lists your notes will need to be reformatted to look they way they should. To put Note elements between ordered list items within the same li:
          1.  Place cursor after the period of the last li before the note.
          2.  Hold down the Control key and click the semicolon key then hit enter key.
          3.  Either drag and drop the Note into the new space or copy and paste.
          4.  Make sure there are no extraneous p tags/extra spaces where there should not be.
        * Do same thing with images that come in between ordered list items.

     * **Remove inline styles** - Inline styles are styles in the code that will directly interfere with the stylesheet's CSS so they need to be removed from the xml.
          1. Click the Text Editor tab to display the markup.
             {% include image.html file="textEditorTab.png" alt="Text Editor tab in Flare" caption="Text Editor Tab in Flare" %}
          2. Look for any elements that have a "style" attribute within them.
          3. Remove the style element.
            {% include important.html content="There is one exception to this rule -- do not remove the style inserted for the square bullet list items." %}

## Part IV: Update/Clean up the TOC

Updating/ cleaning up the TOC requires two steps. First, you need to link the topics and bookmarks to the headings and subheadings in your TOC. Then you need to set up the auto numbers so that they populate correctly.

### Update Links

To link the topics and bookmarks to the headings and subheadings in your TOC:

1.  Open the TOC by clicking the **Project Organizer** tab, then opening the **TOCs** folder.
    {% include tip.html content="There should be two TOCs -- one came in with the Word import and the other is a Master TOC that is the default." %}
2.  Open the word import TOC by double-clicking it.
    {% include tip.html content="You should see several books listed with the title of the main headings in your import. When you click on the books you will see the subheadings listed." %}
3.  Add topics to the TOC in the proper order by clicking on the **Content Explorer** tab, then selecting the topics and dragging them over to the TOC's open pane.
4.  For each main heading/book, you need to link it to a topic. Do this by right-clicking the book and selecting **Link to Topic**. Then select the topic that corresponds to the book title. Do this for all of the books.
5.  Then you need to add bookmarks for the subheadings in a similar manner. Do this by right-clicking the subheading and selecting **Properties**. In the *Properties* window, select the **General** tab. In the **General** tab, click the **Select Bookmark** icon to select a bookmark. You must do this for all of the subheadings.

### Update Autonumbering

To set up the auto numbers so that they populate correctly:

 {% include note.html content="If you set up your topics to be separated by more than one style, see section [To set up auto numbers so that they populate correctly for granular topics](#to-set-up-auto-numbers-so-that-they-populate-correctly-for-granular-topics)."%}
1.  Open Flare project.
2.  Click the **Project Organizer** tab.
3.  Open the **TOCs** folder.
4.  Open the TOC for your document.
5.  Right-click the **Title** page on the **TOC** and select **Properties**.
6.  In the properties window, select the **Printed Output** tab.
7.  For the **Title** page:
    * Create a break by selecting **Chapter Break** from the **Break Type** list box.
      {% include tip.html content="The reason you are creating a break here is two-fold
            1.  It lets you select the proper page layout because you have a specific one in mind for this page
            2.  It allows you to select the page number type even though it won't show up on this page as it is not part of the title page layout, it will begin the counting here." %}

    * Select the **Cover** page layout from the **Page Layout** list box.
    * Select **Title** from the **Page Type** list box.
    * Leave **Chapter File Name** as **(default).**
    * Select **Disabled** from the **Auto-end on 'left' page** list box.
    * Select **Reset to** in the **Page Number** section of the window.
    * Enter an '**i**' in the text box and select **roman(I, ii, iii)** from the **Format** list box.
      {% include note.html content="This is where you are setting up the type of numbers you want for the remainder of your front pages." %}
8. For the **Document History** page:
   * Create a break by selecting **Page Layout Break** from the **Break Type** list box.
     {% include note.html content="The reason this is a page layout break and not a chapter break is that we want the numbering to continue here and not restart." %}
   * Select the **/title** page layout from the **Page Layout** list box.
   * Select **First** from the **Page Type** list box.
   * Select **Disabled** from the **Auto-end on 'left' page** list box.
     {% include note.html content="The default for the page numbering is for it to increment, which you want at this point so you do not need to specify the page number type here." %}
9.  For the **Table of Contents** page:
    * Create a break by selecting **Page Layout Break** from the **Break Type** list box.
      {% include note.html content="The reason this is a page layout break and not a chapter break is that we want the numbering to continue here and not restart." %}
    * Select the **/TableOfContents** page layout from the **Page Layout** list box.
    * Select **First** from the **Page Type** list box.
    * Select **Disabled** from the **Auto-end on 'left' page** list box.
      {% include note.html content="The default for the page numbering is for it to increment, which you want at this point so you do not need to specify the page number type here." %}

10. For the first book/topic/heading:
    * Create a break by selecting **Chapter Break** from the **Break Type** list box.
      {% include note.html content="You are selecting a Chapter Break here because you want a different kind of numbering here so you need to reset it. Also, you need to set it up so that your Exercise and Outline numbers will also start to increment after this and so we need to count it as a Chapter." %}
    * Select the **/title page** layout from the **Page Layout** list box.
    * Select **Normal** from the **Page Type** list box.
    * Leave **Chapter File Name** as **(default).**
    * Select **Disabled** from the **Auto-end on 'left' page** list box.
    * Select **Reset to** in the **Page Number** section of the window.
    * Enter an '**1**' in the text box and select **decimal (1, 2, 3)** from the **Format** list box.
    * Click on the **Auto-Numbers** tab.
    * Select **Reset to** for **Chapter Number**.
    * Enter a '**1**' in the text box and select **decimal(1, 2, 3)** from the **Format** list box.
11. For all subsequent books/topics/headings:
    * Create a break by selecting **Chapter Break** from the **Break Type** list box.
      {% include note.html content="The reason you need a Chapter break here is so that the Exercise and Outline numbers will now increment as the next chapter." %}
    * Select the **/title** page layout from the **Page Layout** list box.
    * Select **Normal** from the **Page Type** list box.
    * Leave **Chapter File Name** as **(default).**
    * Select **Disabled** from the **Auto-end on 'left' page** list box.
    * Select **Increment number** for the **Page Number** section.
    * Click on the **Auto-Numbers** tab.
    * Select **Increment number** for the **Chapter Number**.
    * You want these to increment so that all of your Exercises and Outline numbers are not 1.

### Update AutoNumbering - Granular Topics

To set up auto numbers so that they populate correctly for granular topics:

1.  Open Flare project.
2.  Click the **Project Organizer** tab.
3.  Open the **TOCs** folder.
4.  Open the TOC for your document.
5.  Right-click the **Title** page on the **TOC** and select **Properties**.
6.  In the **Properties** window, select the **Printed Output** tab.
7.  For the **Title** page:
    * Create a break by selecting **Chapter Break** from the **Break Type** list box.
      {% include note.html content="The reason you are creating a break here is two-fold: 1. It lets you select the proper page layout because you have a specific one in mind for this page. 2. It allows you to select the page number type even though it won't show up on this page as it is not part of the title page layout, it will begin the counting here." %}
    * Select the **/Cover** page layout from the **Page Layout** list box.
    * Select **Title** from the **Page Type** list box.
    * Leave **Chapter File Name** as **(default).**
    * Select **Disabled** from the **Auto-end on 'left' page** list box.
    * Select **Reset to** in the **Page Number** section of the window.
    * Enter an '**i**' in the text box and select **roman(I, ii, iii)** from the **Format** list box.
      {% include note.html content="This is where you are setting up the type of numbers you want for the remainder of your front pages." %}
8.  For the **Document History** page:
    * Create a break by selecting **Page Layout Break** from the **Break Type** list box.
      {% include note.html content="The reason this is a page layout break and not a chapter break is that we want the numbering to continue here and not restart." %}
    * Select the **/title** page layout from the **Page Layout** list box.
    * Select **First** from the **Page Type** list box.
    * Select **Disabled** from the **Auto-end on 'left' page** list box.
      {% include note.html content="The default for the page numbering is for it to increment, which you want at this point so you do not need to specify the page number type here." %}
9.  For the **Table of Contents** page:
    * Create a break by selecting **Page Layout Break** from the **Break Type** list box.
      {% include note.html content="The reason this is a page layout break and not a chapter break is that we want the numbering to continue here and not restart." %}
    * Select the **/TableOfContents** page layout from the **Page Layout** list box.
    * Select **First** from the **Page Type** list box.
    * Select **Disabled** from the **Auto-end on 'left' page** list box.
      {% include note.html content="The default for the page numbering is for it to increment, which you want at this point so you do not need to specify the page number type here." %}
10. For the **Exercise** headings:
    * Create a break by selecting **Chapter Break** from the **Break Type** list box.
    * Select the **/title** page layout from the **Page Layout** list box.
    * Select **Normal** from the **Page Type** list box.
    * Leave **Chapter File Name** as **(default).**
    * Select **Disabled** from the **Auto-end on 'left' page** list box.
    * Select **Reset to** in the **Page Number** section of the window.
    * Enter a '**1**' in the text box and select **decimal (1, 2, 3)** from the Format list box.
    * Click on the **Auto-Numbers** tab.
    * Select **Reset to** for **Chapter Number**.
    * Enter a '**1**' in the text box and select **decimal (1, 2, 3)** from the Format list box.

11. For the **Outline\_1** headings - Ensure **none** is selected in the Break Type list box.
12. For the first topic (For example. 1.1, 2.1, 3.1) in **Outline** headings:
    * Create a break by selecting **Page Layout Break** from the **Break Type** list box.
    * Select the **/title** page layout from the **Page Layout** list box.
    * Select **Normal** from the **Page Type** list box.
    * Leave **Chapter File Name** as **(default).**
    * Select **Disabled** from the **Auto-end on 'left' page** list box.
    * Leave **Page Number** set to **Increment number**.
    * Check the **Start a new section** check box in the **Section Break** area of the window.
    * Leave the list box selection as **(default).**
    * Click on the **Auto-Numbers** tab.
    * Click **Reset to** for **Chapter Number**.
    * Enter a '**1**' in the text box and select **decimal (1, 2, 3)** from the **Format** list box.
    * Click **Reset to** for **Section Number**
    * Enter a '**1**' in the text box and select **decimal (1, 2, 3)** from the **Format** list box.

13. For subsequent **Outline** headings (For example. 1.2, 1.3, 2.2, 2.3):
    * Create a break by selecting **Page Layout Break** from the **Break Type** list box.
    * Select the **/title** page layout from the **Page Layout** list box.
    * Select **Normal** from the **Page Type** list box.
    * Leave **Chapter File Name** as **(default).**
    * Select **Disabled** from the **Auto-end on 'left' page** list box.
    * Leave **Page Number** set to **Increment number**.
    * Check the **Start a new section** check box in the **Section Break** area of the window.
    * Leave the list box selection as **(default).**
    * Click on the **Auto-Numbers** tab.
    * Leave **Chapter Number** set to **Increment**.
    * Leave **Chapter Number** set to **Increment**.
      {% include note.html content="The values in the Auto-Numbers tab are automatic and you shouldn't need to change anything; however, if the auto-numbering is not populating correctly, you may need to ensure this tab displays these settings." %}

## Part V: Set up the Target

To set up the target:

1.  Click the **Project Organizer** tab.
2.  Open the **Targets** folder.
3.  Double-click the **PDF target** if it is there, if not create one by right-clicking the **Target** folder and selecting **Add Target**.
4.  Click the **General** tab.
5.  Select **PDF** for **Output Type** if not already selected.
6.  Select your TOC in the **Master TOC** list box.
7.  Leave the **Master Page Layout** as **(default)**.
    {% include note.html content="You set up the appropriate layouts in the TOC already. If you select something else here it will override what you have already entered. Not all of your layouts will be the same." %}
8.  Select your stylesheet from the **Master Stylesheet** list box.
9.  Do not worry about the rest of the inputs here.
10. Select the **Variables** tab.
    {% include note.html content="The Variables tab will input the variables inserted on the title page with whatever inputs you put here. This way you can use the same Title page layout for many different documents, but just create new targets for them." %}
11. Enter the **Product Name** into the text box.
12. Enter the **Release Date** into the text box.
13. Enter the **Version** number into the text box.
14. Click the **Advanced** tab.
15. Uncheck the **Generate TOC Proxy**, **Generate Index Proxy**, and **Generate Glossary Proxy** checkboxes.
    {% include note.html content="You don't need Flare to create these because we have already created them and put them into our TOC. If we do not uncheck these boxes you will end up with multiple." %}
16. Check the **Use TOC depth for heading levels** checkbox.
17. Click the **Save** button.
18. Click **View** at the top of the target window to create the PDF.
19. Click **Yes** to generate the output.
20. Once created you can rename and save your PDF where you need it.
{% include links.html %}
