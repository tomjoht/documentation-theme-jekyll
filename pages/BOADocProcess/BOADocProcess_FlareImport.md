---
title: Importing Manuals into Flare
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
toc: false
permalink: BOADocProcess_FlareImport.html
folder: BOADocProcess
---
Importing Manuals into Flare
==========================================
Part 1: Create Flare Project and Add Stylesheets, Page Layouts, and Title pages
-------------------------------------------------------------------------------
### To create a Flare project:

1.  Open Flare.

2.  Click **File** from top nav bar and select **New Project  > New Project** to open the New Project Wizard.

    ![](media/image77.png)

3.  In the **Project name** field enter the name for the Flare project.

 **NOTE:** Ex. Training Manuals

4.  Select where you want to store the Flare project using the **. . .** button to the right of the **Project folder** field.

    ![](media/image78.png)

5.  Click **Next**.

6.  Select **Empty** from **New from template**.

    ![](media/image79.png)

7.  Click **Next**.

8.  Select your primary target type from the **Available Targets** list box.

 **NOTE**: I selected PDF, since you tend to produce these manuals in PDFs.

> ![](media/image80.png)

9.  Click **Finish**.

### To add stylesheets/page layouts to Flare project:

1.  Open **File Explorer**.

    ![](media/image81.png)

2.  Find the desired stylesheet/page layout and right click to copy the folder.

    ![](media/image82.png)

3.  Select the Flare project and open the **Content  > Resources  > Stylesheets** folder for adding a stylesheet. Open the **Content  > Resources  > PageLayouts** folder for adding page layouts. You will also want to add the Title, Document History and Table of Contents topics from the Content folder.

    ![](media/image83.png)

4.  Right click and paste the stylesheet into the folder.

5.  Find the **Tablestyles** folder and right click to copy it.

6.  Select the Flare project and open the **Content  > Resources** folder.

7.  Right click and past the **Tablestyles** folder into the **Resources** folder.

8.  Open the Flare project.

9.  Click **Project** in the top nav menu.

10. Click Project Properties on the ribbon.

    ![](media/image84.png)

11. Select the stylesheet you just added in the Master Stylesheet list box.

 **NOTE:** You do not want to add a Master Page Layout because page layout changes based on what is on the page.

![](media/image85.png)

Part II: Import Word Files and Map Styles
-----------------------------------------

### To import a word file into Flare:

1.  Click on the **Project Organizer** tab.

    ![](media/image86.png)

2.  Right click the **Imports** folder and select **Add MS Word Import File . . .**

    ![](media/image87.png)

3.  Enter a name for the import in the **File Name** field.

 **NOTE:** Ex. Integrate -- I would recommend adding the name of the manual here as each content folder will contain topic files for that manual.

> ![](media/image88.png)

4.  Click **Add**.

### To map styles in import file in Flare:

1.  Uncheck the **Link Generated Files to Source Files** checkbox at the bottom of the page on the **Source Files** tab.

 **NOTE**: The reason you are doing this is you don't want to be connected to the Word document anymore. If you make changes going further, you will make those changes in Flare, not Word.

![](media/image89.png)

2.  Click the green **+** icon.

    ![](media/image90.png)

3.  Find the Word file you want to import.

4.  Click **Open**.

5.  Click the **New TopicStyles** tab.

6.  Select the style you want to separate topics by on the left side.

 **NOTE**: For example: I separated the topics by the Exercise style.

 **NOTE**: For a more granular breakup, you can separate topics by Exercise and Outline.

 **NOTE:** If you break up your topic by Exercise and Outline, you must set up your Outline style and your auto-numbering differently than what is demonstrated in the original steps.

7.  Click the **arrow** pointing right to add the style.

    ![](media/image91.png)

8.  Click the **Stylesheet** tab.

9.  Select the stylesheet you want to use by clicking the **Stylesheet** button.

10. Find the stylesheet we already pasted into the **Stylesheet** folder.

11. Click the **Don't Preserve MS Word Styles** option under **Source Styles**.

    ![](media/image92.png)

12. Click the **Paragraph Styles** tab.

 **NOTE**: On the left side you will see a list of all the **MS Word Styles** and on the right side you will see a list of the **Flare Styles** from the stylesheet we selected.

13. Select an **MS** **Word Style** on the left and select the corresponding **Flare Style** on the right.

14. Click the **Map** button to map the styles.

    ![](media/image93.png)

15. Do this for the remainder of the styles.

  **Word Style**        **Flare Style**
  --------------------- -----------------
  \[Basic Paragraph\]   p.footertitle
  Body                  P
  Caption               p.caption
  Document Title        p.subtitle
  Exercise              h1.exercise
  Heading 1             h1
  Heading 2             h2
  Heading 3             h3
  Note                  p.note
  Outline               h2.outline
  Product Name          p.pagetitle
  Release Date          p.releasedate
  TOC 1                 p.TOC1
  TOC 2                 p.TOC2
  Version Number        p.version

16. Click the **Paragraph Styles** tab.

 **NOTE:** On the left side you will see a list of all the MS Word Styles and on the right side you will see a list of the Flare Styles from the stylesheet we selected.

17. Select an **MS Word Style** on the left and select the corresponding **Flare Style** on the right.

18. Click the **Map** button to map the styles.

 **NOTE:** Make sure you have added the character styles for all bold and italicized words for these styles to be displayed -- *See Change-formatting-options-Word.avi* and *Convert-direct-formatting-to-Character-Styles-Word.avi* for more information on this step.

19. Click **Save All** icon in top left corner.

    ![](media/image94.png)

20. Click **Import** at the top of the page.

    ![](media/image95.png)

21. Click **Accept**.

Part III: Organize Content and Clean Up Styles
----------------------------------------------

### To organize content:

1.  Open Flare project.

2.  Open the folder with the topics you imported from the Word file. It will be named what you named your import file.

 **NOTE**: When you imported the Word document, you listed the heading levels which would break up the document into topics. For instance, I selected Exercise as the heading I wanted to break up the document by. So where ever there was an Exercise heading level in the Word document Flare started a new Topic.
 In some instances, topics were created by default, like for the Overview, which does not have an Exercise heading. Flare does a pretty good job here, but you want to go through and make sure all of your content is divided the way you wanted it to be divided.
 See where each topic begins and ends and if it isn't to your liking, cut and paste content where it should be and delete topics as needed.

3.  You will also want to take a look at your images to make sure there are no duplicates.

 **NOTE:** You may also want to organize them. Flare names all images by the title of the topic they are in, and then adds numbers. While I didn't rename the images, you may want to name them something more relevant.
 I did rename the icons and put them in a separate folder because in some instances they were duplicated. Also, I know they will probably be used in other documents.

4.  When you do all of this reorganizing, you are changing file paths so Flare will ask you if you want to update the links. **Make sure you say yes to that or your images and files will not be connected properly.**

### To clean up styles:

1.  Open the first topic in your document.

2.  Check to make sure styles have been applied properly by using the cursor to click the text and looking in the **Styles** panel to see what style has been applied.

 **NOTE:** To open **Styles** panel, click **Home** in top nav menu and select **Style Window** from the ribbon.

> ![](media/image96.png)

3.  Specific issues that need addressing:

 a.  Delete Example and Outline numbers -- to be replaced with auto styles. The Flare styles already have Exercise and outline numbers as part of the style. So those words/numbers will need to be removed.

        i.  Once the Example and Outline numbers are deleted, make sure the style is the appropriate style.

            1.  Exercise -- h1.exercise

            2.  Outline -- h2.outline1 (for the first item in an outline list) and h2.outline

 **NOTE:** If your topics are separated by Exercise and Outline, for your auto-numbering to populate correctly, either edit your h2.outline style in your stylesheet to display the following:

        h2.outline
        {
              color: #4d768e;
              font-family: "Interstate Bold";
              font-size: 14pt;
              mc-auto-number-format: \'{chapnum}.{secnum} \';
        }
 Or

 Create a new style (For example. H2.outline\_2) and apply that style to
your headings where you would otherwise apply h2.outline style.

        ii. It will seem like all of the Exercises are Exercise 1 in the project. Once the document is produced though these numbers will populate correctly once you have formatted your TOC appropriately.

 b.  Add the strong style to all bolded items and add the i style to all italicized items. -- This may already be done if you followed instructions in *Change-formatting-options-Word.avi* and *Convert-direct-formatting-to-Character-Styles\_Word.avi*.

        iii. First you must highlight the text that you are bolding.

        iv. Make sure you find it in Style panel.

        v.  Do not use the B button on the Home ribbon toolbar.

 c.  Make sure all li's are contained in a single ol or ul.

        vi. To make them under one ul or ol, you can do this in the code or you can highlight the entire set of li's, then click the bullets button on the ribbon 3 times, until they are all under one li.

        ![](media/image97.png)

        ![](media/image98.png)

 d.  To make an indented ul:

        vii. Change the bullets to square bullets by highlighting the bulleted items you want to be square bullets and then clicking on the bullet button in the ribbon and selecting the square bullets.

        viii. Click the **Text Editor** tab to view the code.

        ![](media/image99.png)

        ix. Copy the entire ul for the indented li items and paste it within
        the li tags (between the \<li\> and \</li\> tags) they will be
        indented under.

 ![](media/image100.png)
 e.  Similarly, add the captions to the p tag for the image to make sure they stay close to the image. You will need to do this in the code.

         x.  Click on the Text Editor tab.

         xi. Copy the entire caption, with it's p tags.

         xii. Paste the entire caption with p tags just before the ending p
        tag for the image.

        ![](media/image101.png)

 f.  Make sure icons have a style tag of img.icon.

        xiii. Highlight image/double click to select it.

        xiv. Select img.icon in the **Styles** panel.

        xv. Or go into the text editor and add the class within the img tag, < img src= "../Resources/Images/Integrate/Icons/BDCScreen.png " class= "icon " / >

 g.  Notes issues

        xvi. Delete the extra NOTE that comes after the bolded NOTE in the notes style.

        xvii. Put Note elements between ordered list items within the same li.

        xviii.  To do this:

          1.  Place cursor after the period of the last li before the note.

          2.  Hold down the Control key and click the semicolon key then hit enter key.

          3.  Either drag and drop the Note into the new space or copy and paste.

          4.  Make sure there are no extraneous p tags/extra spaces where there should not be.

          5.  Do same thing with images that come in between ordered list items.

 h.  Remove inline styles.

        xix. Inline styles are styles in the code that will directly interfere with the stylesheet's CSS so they need to be removed from the xml.

        xx. Click the Text Editor tab to display the markup.

        ![](media/image99.png)

        xxi. Look for any elements that have "style" within them.

        xxii. Remove the style element.

        xxiii.  There is one exception to this rule -- do not remove the style inserted for the square bullet list items.

Part IV: Update/Clean up the TOC
--------------------------------
Updating/ cleaning up the TOC requires two steps. First, you need to link the topics and bookmarks to the headings and subheadings in your TOC. Then you need to set up the auto numbers so that they populate correctly.

### To link the topics and bookmarks to the headings and subheadings in your TOC:

1.  Open the TOC by clicking the **Project Organizer** tab, then opening the **TOCs** folder.

 **NOTE:** There should be two TOCs -- one came in with the Word import and the other is a Master TOC that is the default.

2.  Open the word import TOC by double clicking it.

 **NOTE:** You should see several books listed with the title of the main headings in your import. When you click on the books you will see the subheadings listed.

3.  Add the Title, Document History, and Table of Contents topics to the beginning of the TOC in the proper order by clicking on the **Content Explorer** tab, then selecting the topics and dragging them over to the TOC's open pane.

4.  For each main heading/book, you need to link it to a topic. Do this by right-clicking the book and selecting **Link to Topic**. Then select the topic that corresponds to the book title. Do this for all of the books.

5.  Then you need to add bookmarks for the subheading in a similar manner. Do this by right-clicking the subheading and selecting **Properties**. In the *Properties* window, select the **General** tab. In the **General** tab, click the **Select Bookmark** icon to select a bookmark. You must do this for all of the subheadings.

### To set up the auto numbers so that they populate correctly:

 **NOTE:** If you set up your topics to be separated by Exercise and Outline, see section [ To set up auto numbers so that they populate correctly for granular topics ](#to-set-up-auto-numbers-so-that-they-populate-correctly-for-granular-topics).

1.  Open Flare project.

2.  Click the **Project Organizer** tab.

3.  Open the **TOCs** folder.

4.  Open the TOC for your document.

5.  Right-click the **Title** page on the **TOC** and select **Properties**.

6.  In the properties window, select the Printed Output tab.

7.  For the **Title** page:

 a.  Create a break by selecting **Chapter Break** from the **Break Type** list box.

        i.  The reason you are creating a break here is two-fold

            1.  It lets you select the proper page layout because you have a specific one in mind for this page

            2.  It allows you to select the page number type even though it won't show up on this page as it is not part of the title page layout, it will begin the counting here.

 b.  Select the ** Cover ** page layout from the **Page Layout** list box.

 c.  Select **Title** from the **Page Type** list box.

 d.  Leave **Chapter File Name** as **(default).**

 e.  Select **Disabled** from the **Auto-end on 'left' page** list box.

 f.  Select **Reset to** in the **Page Number** section of the window.

 g.  Enter an '**i**' in the text box and select **roman(I, ii, iii)** from the **Format** list box.
        ii. This is where you are setting up the type of numbers you want for the remainder of your front pages.

8.  For the **Document History** page:

 a.  Create a break by selecting **Page Layout Break** from the **Break Type** list box.

        iii. The reason this is a page layout break and not a chapter break is that we want the numbering to continue here and not restart.

 b.  Select the **/title** page layout from the **Page Layout** list box.

 c.  Select **First** from the **Page Type** list box.

 d.  Select **Disabled** from the **Auto-end on 'left' page** list box.

 e.  The default for the page numbering is for it to increment, which you want at this point so you do not need to specify the page number type here.

9.  For the **Table of Contents** page:

 a.  Create a break by selecting **Page Layout Break** from the **Break Type** list box.

 a.  The reason this is a page layout break and not a chapter break is that we want the numbering to continue here and not restart.

 b.  Select the **/TableOfContents** page layout from the **Page Layout** list box.
 c.  Select **First** from the **Page Type** list box.
 d.  Select **Disabled** from the **Auto-end on 'left' page** list box.

 e.  The default for the page numbering is for it to increment, which you want at this point so you do not need to specify the page number type here.

10. For the first book/topic/heading:

 a.  Create a break by selecting **Chapter Break** from the **Break Type** list box.

 a.  You are selecting a Chapter Break here because you want a different kind of numbering here so you need to reset it. Also, you need to set it up so that your Exercise and Outline numbers will also start to increment after this and so we need to count it as a Chapter.

 b.  Select the **/title page** layout from the **Page Layout** list box.

 c.  Select **Normal** from the **Page Type** list box.

 d.  Leave **Chapter File Name** as **(default).**

 e.  Select **Disabled** from the **Auto-end on 'left' page** list box.

 f.  Select **Reset to** in the **Page Number** section of the window.

 g.  Enter an '**1**' in the text box and select **decimal (1, 2, 3)** from the **Format** list box.

 h.  Click on the **Auto-Numbers** tab.

 i.  Select **Reset to** for **Chapter Number**.

 j.  Enter a '**1**' in the text box and select **decimal(1, 2, 3)** from the **Format** list box.

11. For all subsequent books/topics/headings:

 a.  Create a break by selecting **Chapter Break** from the **Break Type** list box.

 b.  The reason you need a Chapter break here is so that the Exercise and Outline numbers will now increment as the next chapter.

 c.  Select the **/title** page layout from the **Page Layout** list box.

 d.  Select **Normal** from the **Page Type** list box.

 e.  Leave **Chapter File Name** as **(default).**

 f.  Select **Disabled** from the **Auto-end on 'left' page** list box.

 g.  Select **Increment number** for the **Page Number** section.

 h.  Click on the **Auto-Numbers** tab.

 i.  Select **Increment number** for the **Chapter Number**.

 b.  You want these to increment so that all of your Exercises and Outline numbers are not 1.

### To set up auto numbers so that they populate correctly for granular topics:

1.  Open Flare project.

2.  Click the **Project Organizer** tab.

3.  Open the **TOCs** folder.

4.  Open the TOC for your document.

5.  Right-click the **Title** page on the **TOC** and select
    **Properties**.

6.  In the properties window, select the Printed Output tab.

7.  For the **Title** page:

 a.  Create a break by selecting **Chapter Break** from the **Break Type** list box.

        i.  The reason you are creating a break here is two-fold

            1.  It lets you select the proper page layout because you have a specific one in mind for this page

            2.  It allows you to select the page number type even though it won't show up on this page as it is not part of the title page layout, it will begin the counting here.

 b.  Select the **/Cover** page layout from the **Page Layout** list box.

 c.  Select **Title** from the **Page Type** list box.

 d.  Leave **Chapter File Name** as **(default).**

 e.  Select **Disabled** from the **Auto-end on 'left' page** list box.

 f.  Select **Reset to** in the **Page Number** section of the window.

 g.  Enter an '**i**' in the text box and select **roman(I, ii, iii)** from the **Format** list box.

         ii. This is where you are setting up the type of numbers you want for the remainder of your front pages.

8.  For the **Document History** page:

 a.  Create a break by selecting **Page Layout Break** from the **Break Type** list box.

        iii. The reason this is a page layout break and not a chapter break is that we want the numbering to continue here and not restart.

 b.  Select the **/title** page layout from the **Page Layout** list box.

 c.  Select **First** from the **Page Type** list box.

 d.  Select **Disabled** from the **Auto-end on 'left' page** list box.

 e.  The default for the page numbering is for it to increment, which you want at this point so you do not need to specify the page number type here.

9.  For the **Table of Contents** page:

 a.  Create a break by selecting **Page Layout Break** from the **Break Type** list box.

        i.  The reason this is a page layout break and not a chapter break is that we want the numbering to continue here and not restart.

 b.  Select the **/TableOfContents** page layout from the **Page Layout** list box.

 c.  Select **First** from the **Page Type** list box.

 d.  Select **Disabled** from the **Auto-end on 'left' page** list box.

 e.  The default for the page numbering is for it to increment, which you want at this point so you do not need to specify the page number type here.

10. For the **Exercise** headings:

 a.  Create a break by selecting **Chapter Break** from the **Break Type** list box.

 b.  Select the **/title** page layout from the **Page Layout** list box.
 c.  Select **Normal** from the **Page Type** list box.

 d.  Leave **Chapter File Name** as **(default).**

 e.  Select **Disabled** from the **Auto-end on 'left' page** list box.

 f.  Select **Reset to** in the **Page Number** section of the window.

 g.  Enter a '**1**' in the text box and select **decimal (1, 2, 3)** from the Format list box.

 h.  Click on the **Auto-Numbers** tab.

 i.  Select **Reset to** for **Chapter Number**.

 j.  Enter a '**1**' in the text box and select **decimal (1, 2, 3)** from the Format list box.

11. For the **Outline\_1** headings:

 a.  Ensure **none** is selected in the Break Type list box.

12. For the first topic (For example. 1.1, 2.1, 3.1) in **Outline** headings:

 a.  Create a break by selecting **Page Layout Break** from the **Break Type** list box.

 b.  Select the **/title** page layout from the **Page Layout** list box.
 z.  Select **Normal** from the **Page Type** list box.

 b.  Leave **Chapter File Name** as **(default).**

 c.  Select **Disabled** from the **Auto-end on 'left' page** list box.

 d.  Leave **Page Number** set to **Increment number**.

 e.  Check the **Start a new section** check box in the **Section Break** area of the window.

 f.  Leave the list box selection as **(default).**

 g.  Click on the **Auto-Numbers** tab.

 h.  Click **Reset to** for **Chapter Number**.

 i.  Enter a '**1**' in the text box and select **decimal (1, 2, 3)** from the **Format** list box.

 j.  Click **Reset to** for **Section Number**

 k.  Enter a '**1**' in the text box and select **decimal (1, 2, 3)** from the **Format** list box.

13. For subsequent **Outline** headings (For example. 1.2, 1.3, 2.2, 2.3)

 a.  Create a break by selecting **Page Layout Break** from the **Break Type** list box.

 b.  Select the **/title** page layout from the **Page Layout** list box.

 c.  Select **Normal** from the **Page Type** list box.

 d.  Leave **Chapter File Name** as **(default).**

 e.  Select **Disabled** from the **Auto-end on 'left' page** list box.

 f.  Leave **Page Number** set to **Increment number**.

 g.  Check the **Start a new section** check box in the **Section Break** area of the window.

 h.  Leave the list box selection as **(default).**

 i.  Click on the **Auto-Numbers** tab.

 j.  Leave **Chapter Number** set to **Increment**.

 k.  Leave **Chapter Number** set to **Increment**.

 **NOTE:** The values in the Auto-Numbers tab are automatic and you
shouldn't need to change anything; however, if the auto-numbering is not
populating correctly, you may need to ensure this tab displays these
settings.

Part V: Set up the Target
-------------------------

### To set up the target:

1.  Click the **Project Organizer** tab.

2.  Open the **Targets** folder.

3.  Double-click the **PDF target** if it is there, if not create one by right-clicking the **Target** folder and selecting **Add Target**.

4.  Click the **General** tab.

5.  Select **PDF** for **Output Type** if not already selected.

6.  Select your TOC in the **Master TOC** list box.

7.  Leave the **Master Page Layout** as **(default)**.

 **NOTE:** You set up the appropriate layouts in the TOC already. If you select something else here it will override what you have already entered. Not all of your layouts will be the same.

8.  Select your stylesheet from the **Master Stylesheet** list box.

9.  Do not worry about the rest of the inputs here.

10. Select the **Variables** tab.

 **NOTE**: The Variables tab will input the variables inserted on the title page with whatever inputs you put here. This way you can use the same Title page layout for many different documents, but just create new targets for them.

11. Enter the **Product Name** into the text box.

12. Enter the **Release Date** into the text box.

13. Enter the **Version** number into the text box.

14. Click the **Advanced** tab.

15. Uncheck the **Generate TOC Proxy**, **Generate Index Proxy**, and **Generate Glossary Proxy** checkboxes.

 **NOTE**: You don't need Flare to create these because we have already created them and put them into our TOC. If we do not uncheck these boxes you will end up with multiple.

16. Check the **Use TOC depth for heading levels** checkbox.

17. Click the **Save** button.

18. Click **View** at the top of the target window to create the PDF.

19. Click **Yes** to generate the output.
20. Once created you can rename and save your PDF where you need it.
