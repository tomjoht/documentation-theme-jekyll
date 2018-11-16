---
title: Update Online Help in Flare
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
permalink: BOADocProcess_UpdateOnlineHelp.html
folder: BOADocProcess
---
Update Online Help in Flare
---------------------------

This section describes the process for updating Flare project files.

To update online help:

1.  The author checks out the project files. Refer to [Check Out Current
    Project Help Files from GitHub](#update-online-help-in-flare) for
    more information.

<!-- -->

1.  The author adds the content to Flare following standards outlined in
    the BackOffice Associates Documentation Standards. Refer to the
    topics under [Update Existing Topic or Create New
    Topic](#update-existing-topic-or-create-new-topic)*.*

2.  The author commits the project files. Refer to [Check (Commit) Help
    File into GitHub](#remove-draft-attachments-from-jira-tickets) [
    ]{.underline} for more information.￼

3.  The author assigns the ticket to the peer reviewer in JIRA with a
    Documentation Status of Peer Review.

4.  Follow the Peer Review process described in [*Peer Review: Peer
    Reviews Content in Flare*]{.underline}.

### Update Existing Topic or Create New Topic

To update the help project:

1.  Open your local docs GitHub repo after syncing, as described in
    *Synchronize your release branch with the BackOfficeAssoc GitHub
    Repo.*

<!-- -->

5.  Open the **BackOffice Associates Solutions.flprj** project file.

6.  Find the topic to update and apply the revisions. Refer to the
    topics in this section for more information.

7.  Save the topic.

8.  Generate the help target. Refer to *[Build Help
    Targets]{.underline}* for details.

To create a topic:

1.  In the Content Explorer pane, right-click the **Content** folder,
    and then select **New\>Topic** (or Ctrl+T).

<!-- -->

9.  Select **NewTopic.htm** under New from Template

10. Enter the **File Name**, and then click **Add**.

**NOTE:** When Flare compiles file names, it embeds the entire file path
string in the file name. If the file path string and file name combine
into more than 99 characters, it will cause issues when recycling old
checkout folders. Name file names and folders using as few characters as
possible.

11. Replace the default content with the new content.

12. Right-click anywhere in the topic, and then select **Topic
    Properties** from the drop-down.

13. Set the appropriate master page (configuration, use cases, page
    descriptions). Refer to *Apply the Master Page*,

14. On the Conditional Text tab, select the condition tag to apply to
    the topic. Refer to *Use Condition Tags*.

15. Click **OK**.

16. Open the appropriate TOC (Use Cases, Configuration, etc). Drag and
    drop the topic from the Content Explorer pane to the appropriate
    location in the TOC.

17. Update the TOC Label to the title. There are two ways to do this.
    You can double click the label in the TOC, delete what is there
    "\[%=System.LinkedTitle%\]", and enter the title with spaces and
    proper capitalization or you can update it in the Properties dialog
    on the General tab.

    ![](media/image15.png)

18. Right-click the topic in the TOC and select Properties from the
    drop-down.

19. If the topic is excluded from one of the Help outputs, on the
    Conditional Text tab select the appropriate conditions for the topic
    in the TOC. Refer to *Use Condition Tags* for more information about
    how condition tags are used to generate output.

20. Click **OK**.

    Refer to the following checklists for a complete list of changes.

Checklist for Adding a Use Case
-------------------------------

1.  Update Topic Properties: In the Properties box, on the Topic
    Properties tab, set the appropriate master page (usecases). On the
    Conditional Text tab, select the check box next to the component
    name.

<!-- -->

22. Add component name snippet to upper right of topic. Refer to *Add
    and Insert Snippets for Static Content.*

23. Add component Concept to the topic so that the topics is included in
    search results when a search filters is set. On the View tab, open
    the Concept Window, right-click the concept and select Assign Topic.
    Browse for, and then select the topic. Refer to *Add Concepts*.

24. Confirm links have been added: "Refer to" links, page name links.

25. Add topic to the appropriate TOC (use cases, configuration, page
    descriptions) by dragging and dropping it. Make sure to update the
    TOC Label to the title, removing the default system variable.

> **NOTE:** If the title in the TOC is blue you need to remove the
> variable. Refer to [*Update Existing Topic or Create New
> Topic*](#update-existing-topic-or-create-new-topic), step 10 for more
> information.

26. Add component name CT to the topic in TOC. Refer to *Use Condition
    Tags*.

27. Confirm that references to ADM/dspMigrate, ISA, IGC, dspConduct, and
    IG UC have the proper CTs applied.

28. Review formatting. Refer to the *[BackOffice Associates®
    Documentation
    Standards](http://drive.google.com/open?id=12j8cUB8iyQA2v1U6W_N2PoGNMzmXJswEucfGJyAAM1k)*
    for more information.

Checklist for Adding a Field Description
----------------------------------------

1.  Update Topic Properties: In the Properties box, on the Topic
    Properties tab, set the appropriate master page (pagedescriptions).
    On the Conditional Text tab, select the check box next to the
    component name.

29. Add component Concept to the topic so that the topics is included in
    search results when a search filters is set. On the View tab, open
    the Concept Window, right-click the concept and select Assign Topic.
    Browse for, and then select the topic. Refer to *Add Concepts*.

30. Add component name snippet to upper right of topic. Refer to *Add
    and Insert Snippets for Static Content.*

31. Confirm links have been added: "Refer to" links, page name links.

32. Add topic to the Page Descriptions TOC by dragging and dropping it.
    Make sure to update the TOC Label to the title, removing the default
    system variable.

> **NOTE:** If the title in the TOC is blue you need to remove the
> variable. Refer to [*Update Existing Topic or Create New
> Topic*](#update-existing-topic-or-create-new-topic), step 10 for more
> information.

33. Add component name CT to the topic in TOC.

34. Confirm that references to ADM/dspMigrate, ISA, IGC, dspConduct, and
    IG UC have the proper CTs applied.

35. Review formatting of notes -- ensure the word NOTE: has been added.

36. Ensure the navigation steps at the top of the topic are numbered.

37. Confirm that a reference to a topic that uses this page is included
    and is formatted with the div div.use.

38. Ensure the table style is fielddescription.css.

39. Add the Map ID for the page and indicate in the peer review that the
    link to the page needs to be checked on the test site. Refer to *Add
    Context-sensitive Help Links*.

40. NOTE: When adding the Map ID, update the Alias File Value field to
    the appropriate range for the component. Refer to *Appendix B -
    [Alias](#appendix-b-alias-file-value-range) File Value Range*.

#### Editing content already in Help to send for Review

When existing Help content needs to be updated, generate a Word document
containing the content from Flare. Then, once generated, turn on Track
Changes and update the content as needed. Attach the updated Word
document to the Jira ticket and send for review as noted in the
following sections.

To generate a Word document from Flare:

1.  In the Project Organizer, open the **TOCs** folder.

<!-- -->

41. Right-click, **ConsoleTOC (Master)** and select **Copy**.

42. Right-click the TOCs folder and select **Paste**.

43. Open the "**Copy of ConsoleTOC**" that you just created

44. Open the **PrintTOC**.

45. Click and hold the tab for the **PrintTOC**, and then drag it to
    float next to the Copy of ConsoleTOC"

46. In the Copy of ConsoleTOC, locate the topic or book with the content
    to be edited and drag it to the **PrintTOC**.

> ![](media/image16.png)

47. Save the **PrintTOC**. (You can close both TOCs at this point)

48. Open the **Target** Folder, and then open the **Word** target.

49. On the General Tab, click the browse option next to Output Folder
    and select where you want Flare to generate the document. (You can
    select your Desktop, for example)

50. On the **Variables** tab, update the **ComponentName** variable as
    needed.

51. Click **Build**.

The Word document is generated. You can open the document from the
Builds pod, or click View in the Target Editor.

**NOTE:** If you only have one or two topics to generate into Word, you
can skip the steps to create a copy of the ConsoleTOC, and just open the
PrintTOC and drag and drop from the Content Explore to the PrintTOC.

**NOTE:** Please delete the **Copy of ConsoleTOC** before you check the
project in to avoid having many extra TOCs hanging around in the
project.

### Use Condition Tags {#usecondtags}

Condition tags serve two purposes. A condition tag is applied to almost
every topic in the Content Explorer in Flare to identify the specific
component to which it belongs.

Condition tags are also used in an output Target to include/exclude
entire topics or certain text in a topic from Help output. This allows
generations of the two online help systems described in the next
section. If a topic must be excluded from one of the Help systems, the
condition tag also must be applied to the topic's TOC link in the master
TOC.

#### Types of Help Systems Output from Flare

Two online help systems are output from Flare, Full and Solex.

The condition tags to be include or excluded in these outputs are
configured in the Target used to build the output. Refer to *[Build Help
Targets]{.underline}.*

Refer to *[Appendix A -- Condition Tags Used in the Project
File]{.underline}* for information about which condition tags are
included/excluded for each help system.

#### Apply Condition Tag to a Topic

A condition tag must be applied to almost every topic in the Content
Explorer to identify the topic's component. The condition tag must be
applied to the topic's link in the master TOC as well.

**NOTE**: Content that displays in both versions of help does not have a
CT. This includes DSP Navigation and How to Use Online Help topics, and
other general topics.

To apply a condition tag to an entire topic:

1.  Select the topic in the Content Explorer.

<!-- -->

52. Right-click the topic and select **Properties**.

53. In the topic Properties box, click the **Conditional Text** tab.

54. Click the check box next to the Condition Tag to apply it to the
    topic.

To apply a condition tag to the topic's link in the master TOC:

1.  Right-click the topic in Content Explorer and select **Locate in
    TOC**.

<!-- -->

55. Select ConsoleToc.fltoc from the options. Then click **Open**.

56. Right-click the TOC link and select Properties.

57. In the topic Properties box, click the **Conditional Text** tab.

58. Click the check box next to the Condition Tag to apply to the topic.

In this example, the first two topics in the TOC have two different
condition tags applied.

![](media/image17.png)

#### Apply Condition Tag to content in a Topic

To exclude certain text in a topic from one of the online Help systems a
condition tag must be applied to the specific content.

To apply the condition tag to content in a topic:

1.  Open the topic that contains the content.

<!-- -->

59. Select the content.

60. Right-click and select **Conditions** from the drop-down.

61. Click the check box next to the Condition Tag to apply it to the
    content.

**NOTE**: The text is highlighted in the topic to reflect that a
conditional build tag is applied.

In this example, the dspMonitor™ heading and paragraph text have the
condition tag 'dspMonitor' applied in the What's New topic. This content
is excluded when the Solex Help system is built (the dspMonitor™
application is not delivered with the Solex).

![](media/image18.png)

#### Preview a topic with a Condition Tag

To see how the topic displays in online help when a condition tag is
applied:

1.  Click the **Preview** icon in the topic toolbar.

**NOTE:** You can also click the drop-down next to the icon to preview
the topic with the condition tags as configured in a specific Target.

> ![](media/image19.png)

62. Click the **Modify Conditional Expression** (![](media/image20.png))
    icon and then select the condition tags to include or exclude in the
    preview.\
    **NOTE**: This only affects the preview, not the output. Condition
    tags to exclude content from output must be set in the Target.

To view a list of the topics and content to which a tag is applied:

1.  Click the **View** tab, and then select **File List** from the
    **Explorer** group.

<!-- -->

63. Click the **Conditions** header to sort the list by condition tag
    name.

> ![](media/image21.png)

### Apply the Master Page

The master page applied to topics dictates which menu displays on the
topic. There are three types of topics.

A configuration topic has a menu that links to the other topics in the
configuration section.

![](media/image22.png)

The page descriptions topics menu displays a list of all the sections in
help.

![](media/image23.png)

The use case topics menu displays the use cases for the component.

![](media/image24.png)

Apply the master page in Flare on the Topic Properties window, o the
Topic Properties tab, in the Masterpage list box.

### Format Tables in Topics

Use the following steps to format tables in Flare topics when copying
and pasting from Word:

1.  Copy the table in Word.

![](media/image25.png)

64. Paste into a Flare topic, and then select **Paste Table** from the
    Smart Paste drop-down.

![](media/image26.png)

![](media/image27.png)

65. Right-click the Table block, select **Table Properties**, and then
    in the Table Style drop-down, select the **fielddescription**.

![](media/image28.png)

66. To format the table text, click in a cell in the table and select
    the appropriate style from the Style drop-down.

![](media/image29.png)

**NOTE:** To format multiple cells at once, select and click the cells,
right-click, then select **Cell Content Style**.

### Add Popups for Frequently Referenced Content

Some fields that have multiple options are referenced throughout the
online help, such as Report Type. To maintain content in one location
rather than repeating it every time the field is mentioned, add the
content to the popups object in custom.js and add a link with the
"popUpLink" class and appropriate id (the title of the content inserted
as the key in the key value pair).

To view the popups that have already been created in the project, open
the custom.js file and view the popups object.

![](media/image30.png)

**NOTE:** Since our popups are located in a Javascript file, use a code
editor like Visual Studio Code when adding or updating the content.

To add a popup using Visual Studio Code and Flare:

1.  Refer to the section *Update Existing Topic or Create New Topic* and
    complete Steps 1-8 under the section "to create a new topic".\
    **NOTE**: When creating this topic, enter the content of the popup
    only. Do not enter snippets, concepts, or CT tags.

> **NOTE:** Affix the word Popup to the topic's file name.
>
> **NOTE:** Make sure the Searchable checkbox has been disabled for the
> topic.
>
> ![](media/image31.png)

2.  Right-click the custom.js file in the Content Explorer in Flare.

3.  Select Open with and then Code.exe.

    **NOTE**: For code.exe to display in the list, assocate the file
    type .js with Visual Studio Code in Control Panel.

> ![](media/image32.png)

4.  In Visual Studio Code, find the popups object.

> ![](media/image33.png)

5.  At the bottom of the object, put a comma at the end of the last key
    value pair and click enter.

> ![](media/image34.png)

6.  Open a new set of quote marks and type in the title of the popup,
    close the quote marks, enter a colon, and click enter.

> ![](media/image35.png)

7.  In Flare, open the new popup topic you created in step 1.

8.  Click the Text Editor tab at the bottom of the topic window.

> ![](media/image36.png)

9.  Copy the content of the popup.

> **NOTE:** Do not include the xml declarations, head, or body tags.
>
> ![](media/image37.png)

10. Back in Visual Studio Code, paste the html code between two
    backticks after the colon of the popup's title.

> ![](media/image38.png)

11. Save your work in Visual Studio Code.

12. In Flare, open the topic where you want to add the popup link.

13. Type and/or highlight the text for the popup link.

14. Apply the .popUpLink class to the text using the Style window or
    manually in the html.

> ![](media/image39.png)

15. Click the Text Editor tab for the topic.

16. After the popUpLink class enter the title for the popup as the id.

> **NOTE:** The format for entering an id for a tag is id="title"/ There
> are no spaces between id, equals sign, or quote marks. Be sure to
> enter the title exactly as it appears in the custom.js document (copy
> and paste it from the document to be sure).
>
> ![](media/image40.png)

17. Save your work in Flare.

### Add and Insert Snippets for Static Content

The component name for a topic is included as a snippet in the upper
right.

The component name is also styled as a button and used to navigate to
the Overview section of each component.

To add the component name snippet to a topic, copy and paste it from
another topic, or click in the topic where you want the snippet added,
select the insert tab, click Snippet, select the snippet file you want
to add, and click OK.

### Add Glossary Terms

Glossary terms are added to the glossary file in the Help project as new
terms and concepts are added to the Help content. The glossary defines
BOA specific terms that those new to the DSP® might not be familiar
with. The terms must be relevant to **customers who are using the DSP®
in the field. Terms specific to internal development processes do not
need to be defined.** Do not define terms that are well defined
elsewhere, for example by SAP or other industry standards, unless they
have a very specific use or implementation in the DSP®.

1.  In the Content Explorer Pane, double-click the glossary topic in the
    Content folder.

<!-- -->

67. In the Glossary topic, add the new term maintaining proper
    formatting and the alphabetical order.

68. Click Save.

#### Glossary Hotspot Location and Style

Research about the use of glossary hotspots is tracked with DT-23.

Where to add glossary hotspots is TBD. The options include adding
hotspots only to overview topics, or to determine the most useful places
to add hotspots by reviewing the online Help search results for each
term.

Topics that contain the most occurrences of a search term are displayed
first in the search results list in online Help. The idea is that the
topics at the top of the list are the most relevant to the search. And,
in terms of glossary term definitions, the most relevant place to add
hotspots that define the term for a user. Hotspot can be added to the
top three topics returned in a search for a term. Hotspots for glossary
term definitions are added to overview and use case topics, but not
field descriptions.

The style for glossary hotspots are TBD. The options are as follows.

When you click a hotspot with the default style, here is the result:

We can also change the look of glossary terms in the help using a
script. Select **Tools \> Scripts \> Output Generator** with Glossary
Restyling. You can set the terms to display as a popup or a tooltip. The
user clicks the term to open the popup. The user hovers over a term to
display a tooltip.

### Add Context-sensitive Help Links {#addcslinks}

When a user clicks the **?** icon on any page in the product, the help
system opens and displays the field description topic for that page.
This is referred to as Context-sensitive Help.

When documenting a new page, enter a Map ID that links the page with the
topic name in Flare. The Map ID, coupled with a Value in Flare, links a
page in the product with a topic in the help file. In the BOA Solutions
implementation of online help, a Map ID is the GUID for a page.

Each component has a range for an alias file Value. Refer to *[Appendix
B -- Alias File Value Range]{.underline}*.

If documenting a new component, a developer can send the Technical
Writer the GUID for each page in the component.

GUIDs for individual pages are available in the Platform.

To get the GUID for any page:

1.  Click the Change Settings icon in the Site Toolbar.

<!-- -->

69. Select Technical Help and click the Technical tab.

    ![](media/image41.png)

70. The GUID for the current page displays next to Page ID.

![](media/image42.png)

To add Map IDs:

1.  Convert GUID to uppercase.

<!-- -->

71. Replace hyphens with underscores.

72. In the Project Organizer, in the Advanced folder, open the
    **BackOffice Associates Solutions** alias file to open the Alias
    Editor.

![](media/image43.png)

73. Click the Value field to sort the list on value to determine the
    next value to use based on the component of the topic being mapped.
    Refer to *[Appendix B -- Alias File Value Rang]{.underline}*e a list
    of alias file value ranges by component.

74. In the Alias Editor click, **Create a new identifier**.

75. Enter the GUID for the page in the **Identifier** field.

76. Press **Enter**.

**NOTE**: GUIDs must be uppercase and must contain underscores instead
of hyphens.

77. Double-click the Value field to make it editable. Enter the next
    available Value in the appropriate range in the **Value** field.
    Press **Enter.**

78. Double-click the topic name that opens when the user clicks the
    **?** on the GUID's page in the Topics pane to assign it to
    **Identifier**.

### Generate Map ID for a page ID (GUID) that starts with a number

1.  Open the alias file in the Project\>Advanced folder. Sort it on
    Value to find the sequence you need. Close the alias file.

![](media/image44.png)

79. Open the header file BSSCDefault.h.

![](media/image45.png)

80. Go to the end of the file, and then copy and paste the last line to
    duplicate it on a new row. Edit the values shown. Paste over the
    GUID with the new GUID and edit the value to the sequence identified
    in Step 1.

![](media/image46.png)

81. Save and close **BSSCDefault.h**.

82. Reopen the alias file and map the topic.

![](media/image47.png)

### Add Concepts

We apply Concepts to related topics to group them to create the search
filter in help. We have added concepts for component names along with
related subjects such as CTS or Bulk Execution.

**NOTE**: You can copy and paste a concept from one topic to another
instead of following the steps below. The Concept does not show up in
the generated output.

Adding concepts and search filters:

1.  Set Flare up so that it looks something like the following image
    with the TOC, a Topic. and the Concept Window open.

<!-- -->

83. In the Topic place your cursor where the concept link will go (it
    does not show up in output so does not matter where really).

84. In the Concepts window, in the Term box enter your concept and press
    Enter.

The concept shows up in the topic.

85. Click inside the topic and click Save to save the topic.  

The concept shows up in the Concepts list (below the terms box.)

![cid:image003.jpg\@01D2CFFF.2BF36FF0](media/image48.jpeg)

Now that you have your concept in your Concepts list, you can drag and
drop topics to the Concept.

86. Close the topic so that the TOC and Concept window are side by side.

87. You can drag a folder or a single topic from the TOC to the concept
    in the Concepts list. You can also right-click on a concept in the
    list and browse for a topic. This works if you only adding one or
    two topics. And you can drag and drop from the File List view as
    well.

![cid:image006.jpg\@01D2CFFF.2BF36FF0](media/image49.jpeg)

**NOTE**: If you drag a lot of topics from the TOC to the Concepts list,
Flare has a lag, it won't respond to mouse clicks, (because it is
working in the background to add all of the topics) there will be a
little screen flash when it's done, and then you know the topics have
been added. (This only happens when you add A LOT of topics.) Flare
really should have a progress bar when that happens!

**NOTE**: You can expand the node in the Concepts list to see what
topics are included:

![cid:image008.jpg\@01D2CFFF.2BF36FF0](media/image50.jpeg)

Once you have the concepts added to the topics, you can add the filter
for it to the Search Filters.

**NOTE**: This has already been set up in the project. It is included as
background information.

1.  Open the **Search Filter** file in the **Advanced** folder.

<!-- -->

88. Click **Plus** to add the filter, and double-click in the Filter
    name field to give it a name.

**NOTE**: This is the name that shows up in the drop-down in the Output.

89. Press **Enter**.

90. Double-click in the Concepts field and associate the concept to the
    filter.

![cid:image011.jpg\@01D2CFFF.2BF36FF0](media/image51.jpeg)

When a user selects the filter in the output, Flare only searches within
topics that have the concept.

{% include links.html %}
