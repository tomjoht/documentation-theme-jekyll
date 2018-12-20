---
title: Developer Manuals
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "For new, non-versioned documents and developer manuals or technical configuration guides, the PM/Developer (SME) creates the initial draft, attaches it to a JIRA issue with a status of Documentation, and assigns that issue to the Technical Writer."
permalink: BOADocProcess_DevManuals.html
folder: BOADocProcess
---

## Technical Writer Prepares the Document (Versioned and Non-versioned documents)

### Document Setup

Before creating a document, there are several setup steps to be completed in Word. These steps should also be confirmed when a document is updated.

#### Verify Style Gallery Contains Correct Styles

To verify the Style Gallery has the correct styles:

1.  Click the **Home** tab.

2. Click the arrow next to the Quick Style Gallery.

3. Confirm the styles in the picture below display.
   {% include image.html file="wordStyleGallery.png" caption="Verify the styles." %}

#### Update Document Properties {#updatedocprop}

The template uses Document Properties, a feature that automatically includes text entered in fields in the Document Properties window in the template where field codes have been inserted (headers, footers and the title page).

To update document properties:

1.  Select **File \> Info \> Properties \> Show Document Panel**.
    {% include image.html file="documentProps.png" caption="Document Properties dialog" %}
2. Enter BackOffice Associates® in the **Author** field.

3. Enter the product name in **Title** field.

4. Enter the document title in **Subject** field.

5. Enter the digits for the product version number in **Category** field.

6. Close the Document Properties pane.

#### Update the Document History Table

If a manual is version-specific, it does not have a Document History
Table, as a new version of the manual is published with each release.
These manuals include the version number in the title of the document.

For manuals that are version-independent (such as Developer's Manuals),
the document includes a Version History table noting any changes that
have been made between publications of the document. These manuals do
not include the version number in the title of the document.

#### Page Header

The page header contains the product logo.

#### Page Footer

The Cover page contains the address and contact information in the
footer. The page footer for the body of the manual contains the
copyright statement, product name, document title, version and page
numbers. The footer must not display on the Table of Contents or
Document History pages (where applicable).

#### Page Setup

The template margins are pre-configured for standard 8.5" x 11 "size
paper. For formatting purposes, the top and bottom margins can be
adjusted slightly for an entire document, but the right and left margins
should not be changed. For example, if the last page contains two lines
of text, minor changes to the top and bottom margins can shift the lines
to the previous page.

#### Margins

-   Left: 0.5"

-   Right: 0.5"

-   Top: 1"

-   Bottom: 1"

#### Print Options

Define the print options to verify the table of contents and page
numbers print correctly.

To define print options:

1.  Click **File**.

2. Click **Print**.

3. Click the **Print** button.

#### Save Document with Proper Naming Convention

When saving a document, use the naming convention [ ProductName ][ ManualTitle ] [ ProductVersion ], for example, BOA Solutions Installation and Upgrade Manual 6.0.2.docx.

## Technical Writer Prepares Content for Developer Manuals and Technical Configuration Manuals

After setting up the document, the Technical Writer:

1.  Updates the Documentation Status Field on the JIRA issue to In Process to reflect that research and writing is underway. Refer to [DSP Documentation Worflow][BOADocProcess_DSPDocWorkflow] for more information.

2.  Populates the Author and Date fields within the Document History table.

3. Applies standards and formatting from BackOffice Associates® Documentation Standards to document.

4. Enables Track Changes.

5. Edits the document based on JIRA issues/updates or assigns to SME to add the updates.

   {% include note.html content="Include the share link to the updated OneDrive document on the JIRA issue. Refer to [Set Security for a Shared Link](#setSecurity) for more information." %}

   {% include note.html content="QE may be asked to test steps in a non-versioned manual, but that is rare." %}

6. Notifies the SME with a @mention in Jira that the document is available for review on OneDrive. The overall ticket status remains in Documentation Review status.

7. Updates the Documentation Status Field to Review while the document is being reviewed by SME.

8. Once SME approves the manual, send to Technical Writer for peer review.

9. Once peer review passes, sent to Mike Avon for final review.

10. Once he has approved it, prepare the final pdf for publication and send the link to support for final publication on the Support Site.

### Set Security for a Shared Link {#setSecurity}

Set the security on the shared link so that the reviewer has to log in when opening it. When the user makes a comment, the user name displays in the comment. If the security link is not set up this way, the comment says "Guest Contributor."

To share a document on OneDrive with a Reviewer:

1.  Open the document on OneDrive.

2. Click **Share**.

3. Enter the reviewers email in the Invite People field.

4. Click **Get a Link**.

5. In the **Get a Link** list box, select **Edit Link -- BackOffice Associates LLC account required (created)**.

6. Copy the link and send it to the reviewer.

7. Change the overall ticket status to Documentation Review or the Documentation Status to Review, depending on where the ticket is in the process.

### How to link a JIRA ticket to a document on OneDrive.

1.  In the text editor in JIRA, click **Link > External Link**.
    {% include image.html file="jiraExtLink.png" caption="Selecting External Link in JIRA issue" %}
    A link with sample text is inserted.
    {% include image.html file="jiraExtLInk.png" caption="Sample link text" %}

2. Change the **link title** text as needed.

3. In OneDrive, right click the file to which you are linking the JIRA ticket, and then select **Get Link**.

4. Click **Anyone with this link can edit this item**.

5. On the Permissions pane, in the **Who can access this link
    drop-down**, select **Only people in BackOffice LLC**.

6. Click **OK**.

7. Click Copy to copy the link.

8. Paste the link from OneDrive to replace the sample link in JIRA.

9. Save the change in the text editor in JIRA, and then test the link.

{% include links.html %}
