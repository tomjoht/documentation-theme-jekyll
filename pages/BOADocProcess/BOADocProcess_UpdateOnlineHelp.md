---
title: Update Online Help in Flare
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "This page describes the process for updating Flare project files."
permalink: BOADocProcess_UpdateOnlineHelp.html
folder: BOADocProcess
---

## Online Help Update Process

To update online help:

1.  The author checks out the project files and adds the content to Flare following standards outlined in the BackOffice Associates Documentation Standards. Refer to the topics under [In Process: Technical Writer Drafts content in Flare][BOADocProcess_DSPDocWorkflow.html#draftcontent].
2. The author commits the project files. Refer to [Commit updates locally and push them to the BackOfficeAssoc GitHub Repo dsp-docs][BOADocProcess_DSPDocWorkflow.html#commitlocally] for more information.￼
3. The author assigns the ticket to the peer reviewer in JIRA with a Documentation Status of Peer Review. Refer to [Open a pull request for a peer reviewer to review your work][BOADocProcess_DSPDocWorkflow.html#openPR].
4. Follow the Peer Review process described in [Peer Review: Peer Reviews Content in Flare][BOADocProcess_DSPDocWorkflow.html#peerreview].

## Create New Topic

To create a topic:

1.  In the **Content Explorer** pane, right-click the **Content** folder, and then select **New > Topic** (or **Ctrl+T**).

2.  Select **NewTopic.htm** under **New from Template**.

3. Enter the **File Name**, and then click **Add**.
    {% include note.html content="When Flare compiles file names, it embeds the entire file path string in the file name. If the file path string and file name combine into more than 99 characters, it will cause issues when recycling old checkout folders. Name file names and folders using as few characters as possible." %}

4. Replace the default content with the new content.

5. Right-click anywhere in the topic, and then select **Topic Properties** from the drop-down.

6. Set the appropriate master page (configuration, useCases, pageDescriptions). Refer to [Apply the Master Page](#apply-the-master-page).

7. On the **Conditional Text** tab, select the condition tag to apply to the topic. Refer to [Use Condition Tags](#usecondtags).

8. Click **OK**.

9. Open the appropriate TOC (UseCases, Configuration, PageDescriptions, TopNav). Drag and drop the topic from the Content Explorer pane to the appropriate location in the TOC.

10. Update the TOC Label to the title. There are two ways to do this. You can double-click the label in the TOC, delete what is there "\[%=System.LinkedTitle%\]", and enter the title with spaces and proper capitalization or you can update it in the **Properties** dialog on the **General** tab.

11. Right-click the topic in the TOC and select **Properties** from the drop-down menu.

12. If the topic is excluded from one of the Help outputs, on the Conditional Text tab select the appropriate conditions for the topic in the TOC. Refer to [Use Condition Tags](#usecondtags) for more information about how condition tags are used to generate output.

13. Click **OK**.

{% include tip.html content="Refer to the following checklists for a complete list of possible updates." %}

## Checklist for Adding a Use Case

1.  **Update Topic Properties:**
    * In the **Properties** dialog, on the **Topic Properties** tab, set the appropriate master page (useCases).
    * On the **Conditional Text** tab, select the check box next to the component name.

2. **Add component name snippet to upper right of topic:** See [Add and Insert Snippets for Static Content](#add-and-insert-snippets-for-static-content) for the steps for this process.

3. **Add component Concept to the topic:** This step ensures the topics is included in search results when a search filters is set.
   * On the **View** tab, open the **Concept** window.
   * Right-click the concept and select **Assign Topic**.
   * Browse for, and then select the topic.
   {% include note.html content="Refer to [Add Concepts](#add-concepts) for more information." %}

4. **Confirm links have been added:** Including "Refer to" links and page name links.

5. **Add topic to the appropriate TOC (useCases):** You can do this by dragging and dropping it.
   {% include important.html content="Make sure to update the TOC Label to the title, removing the default system variable. If the title in the TOC is blue you need to remove the variable. Refer to [Create New Topic](#create-new-topic), step 9 for more information." %}

6. **Add component name CT to the topic in TOC:** See [Use Condition Tags](#usecondtags) for the steps to complete this process.

7. **Confirm proper CTs have been applied:** This includes references to ADM/dspMigrate, ISA, IGC, dspConduct, and IGUC.

8. **Review formatting:** Refer to the BackOffice Associates® Documentation Standards document for more information.

## Checklist for Adding a Field Description

1.  **Update Topic Properties:**
    * In the **Properties** dialog, on the **Topic Properties** tab, set the appropriate master page (pageDescriptions).
    * On the **Conditional Text** tab, select the check box next to the component name.

2. **Add component Concept to the topic:** This ensures that the topics is included in search results when a search filters is set.
    * On the **View** tab, open the **Concept** window.
    * Right-click the concept and select **Assign Topic**.
    * Browse for, and then select the topic.
    {% include tip.html content="Refer to [Add Concepts](#add-concepts) for more information." %}

3. **Add component name snippet to upper right of topic:** See [Add and Insert Snippets for Static Content](#add-and-insert-snippets-for-static-content) for the steps for this process.

4. **Confirm links have been added:** This includes "Refer to" links and page name links.

5. **Add topic to the Page Descriptions TOC:** This can be completed by dragging and dropping it.
     {% include important.html content="Make sure to update the TOC Label to the title, removing the default system variable. If the title in the TOC is blue you need to remove the variable. Refer to [Create New Topic](#create-new-topic), step 9 for more information." %}

6. **Add component name CT to the topic in TOC:** See [Use Condition Tags](#usecondtags) for the steps to complete this process.

7. **Confirm proper CTs have been applied:** This includes references to ADM/dspMigrate, ISA, IGC, dspConduct, and IGUC.

8. **Review formatting:**
     * Ensure the word NOTE: has been added to notes.
     * Ensure the navigation steps at the top of the topic are numbered.
     * Ensure the reference to a topic that uses this page is formatted with div.use.
     * Ensure the table style is fielddescription.css.

9. **Confirm Use this page to section:** Make sure a reference to a topic that uses this page is included.

10. **Add the Map ID:** Indicate in the peer review that the link to the page needs to be checked on the test site. Refer to [Add Context-sensitive Help Links](#addcslinks).
     {% include note.html content="When adding the Map ID, update the Alias File Value field to the appropriate range for the component. Refer to [Alias Value Range][BOADocProcess_AliasValueRange] for the alias file value ranges by component." %}

## Editing content already in Help to send for Review

When existing Help content needs to be updated, generate a Word document containing the content from Flare or cut and paste content into a Google document. Then, once generated, turn on Track Changes and update the content as needed. Attach the updated Word document to the Jira ticket and send for review as noted in the following sections.

To generate a Word document from Flare:

1. In the Project Organizer, open the **TOCs** folder.

2. Create a new TOC in the TOCs folder and copy the TOC that includes the content you will be updating.

3. Open the **PrintTOC**.

4. Click and hold the tab for the **PrintTOC**, and then drag it to float next to the Copy of ConsoleTOC"

5. In the new TOC, locate the topic or book with the content to be edited and drag it to the **PrintTOC**.

6. Save the **PrintTOC** (you can close both TOCs at this point).

7. Open the **Target** Folder, and then open the **Word** target.

8. On the **General** Tab, click the browse option next to **Output Folder** and select where you want Flare to generate the document (you can select your Desktop, for example).

9. On the **Variables** tab, update the **ComponentName** variable as needed.

10. Click **Build**.

The Word document is generated. You can open the document from the
Builds pod, or click **View** in the **Target** editor.
{% include tip.html content="If you only have one or two topics to update you can just copy and paste the content into a Google document and include the link in the JIRA ticket." %}

{% include note.html content="Please delete the new TOC you created before you push your updates up to GitHub to avoid having many extra TOCs hanging around in the project." %}

## Use Condition Tags {#usecondtags}

Condition tags serve two purposes. A condition tag is applied to almost every topic in the Content Explorer in Flare to identify the specific component to which it belongs.

Condition tags are also used in an output Target to include/exclude entire topics or certain text in a topic from Help output. This allows generations of the two online help systems described in the next section. If a topic must be excluded from one of the Help systems, the condition tag also must be applied to the topic's TOC link in the TOC.

## Types of Help Systems Output from Flare

Two online help systems are output from Flare, Full and Solex.

The condition tags to be include or excluded in these outputs are configured in the Target used to build the output. Refer to [Build Help Targets][BOADocProcess_BuildHelpTargets]

Refer to [Condition Tags Used in the Project File][BOADocProcess_CondTags] for information about which condition tags are included/excluded for each help system.

## Apply Condition Tag to a Topic

A condition tag must be applied to almost every topic in the Content Explorer to identify the topic's component. The condition tag must be applied to the topic's link in the master TOC as well.

{% include note.html content="Content that displays in both versions of help does not have a CT. This includes DSP Navigation and How to Use Online Help topics, and other general topics." %}

To apply a condition tag to an entire topic:

1.  Select the topic in the **Content Explorer**.

2. Right-click the topic and select **Properties**.

3. In the topic **Properties** dialog, click the **Conditional Text** tab.

4. Click the check box next to the Condition Tag to apply it to the topic.


To apply a condition tag to the topic's link in the master TOC:

1.  Right-click the topic in **Content Explorer** and select **Locate in TOC**.

2. Select the correct TOC from the options. Then click **Open**.

3. Right-click the TOC link and select **Properties**.

4. In the topic **Properties** dialog, click the **Conditional Text** tab.

5. Click the check box next to the Condition Tag to apply to the topic.

## Apply Condition Tag to content in a Topic

To exclude certain text in a topic from one of the online Help systems, a condition tag must be applied to the specific content.

To apply the condition tag to content in a topic:

1.  Open the topic that contains the content.

2. Select the content.

3. Right-click and select **Conditions** from the drop-down.

4. Click the check box next to the Condition Tag to apply it to the content.
{% include note.html content="Once you have applied the condition tag, the text is highlighted in the topic to reflect that a conditional build tag is applied." %}

## Preview a topic with a Condition Tag

To see how the topic displays in online help when a condition tag is applied:

1.  Click the **Preview** icon in the topic toolbar.
    {% include note.html content="You can also click the drop-down next to the icon to preview the topic with the condition tags as configured in a specific Target." %}

2. Click the **Modify Conditional Expression** {% include inline_image.html file="modCondExpIcon.png" alt="The Modify Conditional Expression Icon" %} icon and then select the condition tags to include or exclude in the preview.
   {% include note.html content="This only affects the preview, not the output. Condition tags to exclude content from output must be set in the Target." %}

To view a list of the topics and content to which a tag is applied:

1.  Click the **View** tab, and then select **File List** from the **Explorer** group.

2. Click the **Conditions** header to sort the list by condition tag name.


## Apply the Master Page

The master page applied to topics dictates which menu displays on the
topic. There are three types of topics.

* A configuration topic has a menu that links to the other topics in the
configuration section.

* The page descriptions topics menu displays a list of all the sections in
help.

* The use case topics menu displays the use cases for the component.

To apply the master page in Flare on the **Topic Properties** window, go the **Topic Properties** tab, in the **Masterpage** list box.

## Format Tables in Topics {#formattables}

Use the following steps to format tables in Flare topics when copying
and pasting from Word:

1.  Copy the table in Word.

2. Paste the content into a Flare topic, and then select **Paste Table** from the Smart Paste drop-down.
   {% include image.html file="smartPaste.png" alt="Smart Paste Icon" caption="Smart Paste Icon" %}
   {% include image.html file="smartPasteMenu.png" alt="Smart Paste Menu" caption="Smart Paste Menu" %}

3. Right-click the Table block, select **Table Properties**, and then in the Table Style drop-down, select the **fielddescription**.

4. To format the table text, click in a cell in the table and select the appropriate style from the **Style** drop-down.
   {% include note.html content="To format multiple cells at once, select and click the cells, right-click, then select **Cell Content Style**." %}

## Add Popups for Frequently Referenced Content {#addpopups}

Some fields that have multiple options are referenced throughout the online help, such as Report Type. To maintain content in one location rather than repeating it every time the field is mentioned, add the content to the popups object in the custom.js file and add a link with the"popUpLink" class and appropriate id (the title of the content inserted as the key in the key value pair).

To view the popups that have already been created in the project, open
the custom.js file and view the popups object.

{% include image.html file="popupObject.png" alt="Popup object code" caption="Popup object code" %}

{% include note.html content="Since our popups are located in a Javascript file, use a code editor like Visual Studio Code when adding or updating the content." %}


To add a popup using Visual Studio Code and Flare:

1.  Refer to the section [Create New Topic](#create-new-topic) and complete Steps 1-8.
    {% include note.html content="When creating this topic, enter the content of the popup only. Do not enter snippets, concepts, or CT tags. Affix the word Popup to the topic's file name and make sure the **Searchable** checkbox has been disabled for the topic." %}
    {% include image.html file="searchableCB.png" alt="The Searchable Checkbox" caption="The Searchable Checkbox" %}

2.  Right-click the custom.js file in the Content Explorer in Flare.

3.  Select **Open with** and then **Code.exe**.
    {% include note.html content="For code.exe to display in the list, assocate the file type .js with Visual Studio Code in your Control Panel." %}
    {% include image.html file="codeExe.png" alt="Open with Menu with Code.exe displayed" caption="Open with Menu with Code.exe displayed" %}

4.  In Visual Studio Code, find the popups object at the bottom of the custom.js file.

5.  At the bottom of the object, put a comma at the end of the last key value pair and click **Enter** on your keyboard.

6.  Open a new set of quote marks and type in the title of the popup, close the quote marks, enter a colon, and click **Enter** on your keyboard.

7.  In Flare, open the new popup topic you created in step 1.

8.  Click the **Text Editor** tab at the bottom of the topic window.

9.  Copy the content of the popup.
    {% include note.html content="Do not include the xml declarations, head, or body tags." %}
    {% include image.html file="copyPopup.png" alt="What to copy from the Popup file in Flare" caption="What to copy from the Popup file in Flare" %}

10. Back in Visual Studio Code, paste the html code between two backticks after the colon of the popup's title.
    {% include image.html file="popupCode.png" alt="What final popup code should look like in VS" caption="What final popup code should look like in VS" %}

11. Save your work in Visual Studio Code.

12. In Flare, open the topic where you want to add the popup link.

13. Type and/or highlight the text for the popup link.

14. Apply the .popUpLink class to the text using the Style window or manually in the html.
    {% include image.html file="popupClass.png" alt="Adding popup class with Flare GUI" caption="Adding popup class with Flare GUI" %}

15. Click the **Text Editor** tab for the topic.

16. After the popUpLink class enter the title for the popup as the id.
    {% include note.html content='The format for entering an id for a tag is id="title" There are no spaces between id, the equals sign, or the quote marks. Be sure to enter the title exactly as it appears in the custom.js document (copy and paste it from the document to be sure).' %}
    {% include image.html file="insertId.png" alt="How an id should appear in code" caption="How an id should appear in code" %}

17. Save your work in Flare.

## Add and Insert Snippets for Static Content {#addsnippets}

The component name for a topic is included as a snippet in the upper right of the topic file.

The component name is also styled as a button and used to navigate to the Overview section of each component.

To add the component name snippet to a topic:
1. Copy and paste it from another topic, or
2. Click in the topic where you want the snippet added.
3. Select the **Insert** tab, click **Snippet**.
4. Select the snippet file you want to add.
5. Click **OK**.

## Add Glossary Terms

Glossary terms are added to the glossary file in the Help project as new terms and concepts are added to the Help content. The glossary defines BOA specific terms that those new to the DSP® might not be familiar with. The terms must be relevant to **customers who are using the DSP® in the field. Terms specific to internal development processes do not need to be defined.**
{% include note.html content="Do not define terms that are well defined elsewhere, for example by SAP or other industry standards, unless they have a very specific use or implementation in the DSP®." %}

1.  In the Content Explorer Pane, double-click the glossary topic in the Content folder.
2. In the glossary topic, add the new term maintaining proper formatting and the alphabetical order.
3. Click **Save**.

## Glossary Hotspot Location and Style

{% include important.html content="Research about the use of glossary hotspots is tracked with [DT-23](https://entota.atlassian.net/browse/DT-23)." %}

Where to add glossary hotspots is TBD. The options include adding hotspots only to overview topics, or to determine the most useful places to add hotspots by reviewing the online Help search results for each term.

Topics that contain the most occurrences of a search term are displayed first in the search results list in online Help. The idea is that the topics at the top of the list are the most relevant to the search. And, in terms of glossary term definitions, the most relevant place to add hotspots that define the term for a user. Hotspot can be added to the top three topics returned in a search for a term. Hotspots for glossary term definitions are added to overview and use case topics, but not field descriptions.

The style for glossary hotspots are TBD. The options are as follows.

When you click a hotspot with the default style, here is the result:

We can also change the look of glossary terms in the help using a script. Select **Tools \> Scripts \> Output Generator** with Glossary Restyling. You can set the terms to display as a popup or a tooltip. The user clicks the term to open the popup. The user hovers over a term to display a tooltip.

## Add Context-sensitive Help Links {#addcslinks}

When a user clicks the **?** icon on any page in the product, the help system opens and displays the field description topic for that page. This is referred to as **Context-sensitive Help**.

When documenting a new page, enter a Map ID that links the page with the topic name in Flare. The **Map ID**, coupled with an **Alias Value** in Flare, links a page in the product with a topic in the help file. In the BOA Solutions implementation of online help, a Map ID is the GUID for a page.

Each component has a range for an alias file Value. Refer to [Alias File Value Range][BOADocProcess_AliasValueRange] to see a table of values by component.

If documenting a new component, a developer can send the Technical Writer the GUID for each page in the component.

GUIDs for individual pages are available in the Platform.

To get the GUID for any page:

1.  Click the **Change Settings** icon in the Site Toolbar.
    {% include image.html file="siteToolbar.png" alt="Change Settings menu in DSP" caption="Change Settings menu in DSP" %}

2. Select **Technical Help** and click the **Technical** tab.
    {% include image.html file="technicalTab.png" alt="Technical tab in DSP" caption="Technical tab in DSP" %}
3. The GUID for the current page displays next to Page ID.

To add Map IDs:

1. Convert the GUID to uppercase and replace hyphens with underscores.

2. In the **Project Organizer**, in the **Advanced** folder, open the **BackOffice Associates Solutions** alias file.

3. Click the **Value** field to sort the list on value to determine the next value to use based on the component of the topic being mapped. Refer to [Alias File Value Range][BOADocProcess_AliasValueRange] for a list of alias file value ranges by component.

4. Click **Create a new identifier** in the **Alias Editor**.

5. Enter the GUID for the page in the **Identifier** field.

6. Press **Enter** on your keyboard.
   {% include note.html content="GUIDs must be uppercase and must contain underscores instead of hyphens." %}

7. Double-click the **Value** field to make it editable. Enter the next available value in the appropriate range in the **Value** field. Press **Enter.**

8. Double-click the topic name that opens when the user clicks the **?** on the GUID's page in the **Topics** pane to assign it to **Identifier**.

## Generate Map ID for a page ID (GUID) that starts with a number

1.  Open the alias file in the **Project > Advanced** folder. Sort it on **Value** to find the sequence you need. Close the alias file.

2. Open the header file, **BSSCDefault.h**.

3. Go to the end of the file, and then copy and paste the last line to duplicate it on a new row. Edit the values shown. Paste over the GUID with the new GUID and edit the value to the sequence identified in Step 1.

4. Save and close **BSSCDefault.h**.

5. Reopen the alias file and map the topic.

## Add Concepts

We apply Concepts to related topics to group them to create the search filter in help. We have added concepts for component names along with related subjects such as CTS or Bulk Execution.

{% include note.html content="You can copy and paste a concept from one topic to another instead of following the steps below. The Concept does not show up in
the generated output." %}

Adding concepts and search filters:

1. Set Flare up with the TOC, a topic, and the **Concepts** window open.

2. Place your cursor in the topic where the concept link will go (it does not show up in output so does not matter where really).

3. Enter your concept in the **Concepts** window in the **Terms** dialog and press **Enter** on your keyboard. The concept displays in the topic.

4. Click inside the topic and click **Save** to save the topic. The concept shows up in the Concepts list (below the terms box.)
   {% include image.html file="concepts.png" alt="Concepts list in Flare" caption="Concepts list in Flare" %}

Now that you have your concept in your Concepts list, you can drag and drop topics to the Concept.

5. Close the topic so that the TOC and **Concepts** window are side-by-side.

6. You can drag a folder or a single topic from the TOC to the concept in the **Concepts** list. You can also right-click on a concept in the list and browse for a topic (this works if you are only adding one or two topics). And you can drag and drop from the File List view as well.
   {% include image.html file="conceptsList.png" alt="New concept added to Concepts list in Flare" caption="New concept added to Concepts list in Flare" %}
   {% include note.html content="If you drag a lot of topics from the TOC to the Concepts list, Flare has a lag, it won't respond to mouse clicks, (because it is working in the background to add all of the topics) there will be a little screen flash when it's done, and then you know the topics have been added. (This only happens when you add A LOT of topics.) Flare really should have a progress bar when that happens!" %}
   {% include tip.html content="You can expand the node in the Concepts list to see what topics are included." %}
   {% include image.html file="conceptsNodeList.png" alt="Expanded node in Concepts list" caption="Expanded node in Concepts list" %}

Once you have the concepts added to the topics, you can add the filter
for it to the Search Filters.

{% include note.html content="This has already been set up in the project. It is included as background information." %}

To add concepts to Search Filters:
1.  Open the **Search Filter** file in the **Advanced** folder.

2. Click **Plus** to add the filter, and double-click in the Filter name field to give it a name.
   {% include note.html content="This is the name that shows up in the drop-down in the Output." %}

3. Press **Enter** on your keyboard.

4. Double-click in the **Concepts** field and associate the concept to the filter.
   {% include image.html file="assocConcepts.png" alt="Associate concepts with filters" caption="Associate concepts with filters" %}

{% include tip.html content="When a user selects the filter in the output, Flare only searches within topics that have the concept." %}

{% include links.html %}
