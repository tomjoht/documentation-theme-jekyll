---
title: Preparing Documents for Importation into Flare
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "This page describes the process for preparing a Word document for importation into Flare."
permalink: BOADocProcess_PrepareFlareImport.html
folder: BOADocProcess
---

## Convert Direct Formatting to Character/Span Styles

When you are importing manuals and other Word documents into Flare, the formatting doesn't always transfer appropriately. When creating Word documents, all formatting should be done through Styles. Not even a single symbol should be bolded via the formatting ribbon. If you directly format any piece of text in Word, the directly formatted text will be cleared of all formatting upon importation and you will have to reformat it in Flare.

If you are working with documents that someone else has formatted or if you forget to follow best practices, you can fix the directly formatted elements in your Word document quickly and easily before you import it into Flare.

### View Direct Formatting

To change your settings to view direct formatting:

1.  Open the desired document in Microsoft Word.

2.  Click **File** from the top nav bar and select **Options > Advanced**.

3.  Under the **Editing** section, make sure the **Keep track of formatting** checkbox is checked.

4.  Click the **OK** button.

### Convert Inline Styles to Character Styles

To convert directly formatted text to a Character Style:

1.  Click inside of a word or highlight a phrase that has been directly formatted.

2.  Press **Ctrl + Shift + Alt + S** to pull up the Styles window.

3.  Click the **Style Inspector** icon at the bottom of the Styles window.

4. In the Style Inspector dialog, under **Text Level formatting**, hover over the top text box. A drop-down arrow is displayed.

5. Click the drop-down arrow and select **Select All XXX Instance(s).** All instances of the same text level formatting within that Style of Paragraph formatting will be selected.

6. Click the **New Style** icon.

7. Name the new Style something that you will easily recognize and be able to map once you import into Flare.
   {% include note.html content="A good naming convention is to name the Style by its Paragraph and Character characteristics. The Paragraph style that passes its inheritances down to the subsequent Paragraph and Character styles should be listed first." %}

8. Select **Character** from the Style type drown-down list.

9. Click the **OK** button. All of your directly formatted characters within that Paragraph style now belong to a Character style.

10. Repeat steps 1-9 for every instance of directly formatted text for each Paragraph style (numbered lists, bulleted lists, body paragraphs, notes, etc.).

11. Save your document and indicate that it is a version that has been formatted for importation.
