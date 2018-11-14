---
title: Maintain Developer Manuals and Technical Configuration Guides
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "These manuals exist as KB articles and as Word documents.The Doc team added all of the manuals and guides as KB articles to make them easier to maintain, searchable, etc. However, consultants still require some of this content to be maintained in pdf as they give the documents to prospects and to others who need the information but cannot access the KB."
permalink: BOADocProcess_DevManConfigGuides.html
folder: BOADocProcess
---

## Find the Developer Manuals and Technical Configuration Guides
The manuals and guides in Word are stored on OneDrive [here](https://boaweb-my.sharepoint.com/personal/michaelavon_boaweb_com/_layouts/15/guestaccess.aspx?guestaccesstoken=8uGaqAtSPeydUAfbYoN6ZDz%2FhkjP0DgOSJaZ9e%2F2kyI%3D&folderid=2_10eef4c0d8da4484fad22eea04e6563b7&rev=1&e=57f59d99c1374cdd83b681b991d4e5e7).

## Maintenance Tasks
There are two maintenance tasks:

-   Create a PDF for a KB article

-   Update the content in a Manual or Guide

### Create a pdf for a KB Article

Chris Alberts contacts the doc team if additional PDFs are required.

1.  Create a PDF, using the Word documents on OneDrive.

2.  Store the PDF on OneDrive.

3.  Send Chris the file; he will attach it to the article.

### Update the content in a Manual or Guide

The Documentation team updates these documents, though updates are rare.

Follow these steps:

1.  Add a ticket to the DSP project with a link to the document on One Drive.

2.  Set the **Documentation Status** field to **In Progress**.

3.  Update the document on OneDrive using revision marks.

4.  Send the changes for review by a SME (as in, send the SME a link to the document on OneDrive).

5.  Set the **Documentation Status** field to **Review**.

6.  Once approved, take a screen shot of the updates with revision marks and send the changes to Chris so he can update the KB article.

7.  The SME sets the Documentation Status field to Approved.

8.  Create the PDF.

9.  Send a copy of the PDF to Chris and he will upload the new content.

10. Go on to the support site and confirm the changes made it into the KB article and the updated PDF was added.

11. Add a note to the ticket that the content was reviewed, and set the **Documentation Status** field to **Doc Done**.

### Convert Word to PDF

Typically, files of documents are distributed as secured PDF files --
not Word files.

To convert a Word document to PDF:

1.  Open the Word document.

2. Click **File \> Save As\> Adobe PDF**

    *Or*

    Select **Create PDF** from the Acrobat tab.

3. Select the file path.

4. Enter a name in the **File Name** field.

5. Click **Save**.

### Secure PDF Files

Once the file has been created as a PDF, it has to be secured according to BackOffice policy. Refer to [BackOffice Associates® Security Settings for Adobe][BOADocProcess_DevManConfigGuides.html#securitysettings] for instructions on creating security policy.

{% include note.html content="See your manager to get the password to remove security settings." %}

To secure a PDF file:

1.  Open the PDF document.

2. Select **Tools**.

3. Select **Encrypt**.

4. Select **CranSoft**.

5. Click **Save**.

### BackOffice Associates® Security Settings for Adobe {#securitysettings}

To protect the integrity of the documentation, BackOffice requires that
all PDF files to be distributed to be protected by a standard Adobe
security policy.

A security police is set up once for an installation of Acrobat.

To create a security policy in Adobe:

1.  Launch Adobe.

2. Select View \> **Tools \> Protection \> Encrypt**.

3. Click Manage Security Policies.

4. Click **New**.

5. Click **Use Passwords**.

6. Click **Next**.

7. Click **Save these settings as policy**.

8. Type a name (i.e. CranSoft) into **Policy Name** field.

9. Click **Next**.

10. Click Use permissions password to restrict editing of security
    settings.

11. Enter **triangle** in the **Password** field.

12. Select **High Resolution** from **Printing allowed** list box.

13. Select **None** for **Changes allowed** list box.

14. Click **Next**.

15. Confirm the information is correct.

16. Click **Finish**.

### Send a link of Finalized PDF to Support

Zendesk is the BackOffice Associates® document storage site that allows
BackOffice employees and consultants to access product-related files,
such as installation packages, installation manuals and developer's
manuals.

Once the documents are approved and ready to be published on Zendesk,
send a message to Chris with a link to the final versions on OneDrive.

{% include links.html %}
