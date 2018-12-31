---
title: Writing Guidelines & Terminology
keywords: BOADocStandards
summary: "This page describes general writing guidelines and terminology the doc team uses when writing documentation."
sidebar: BOADocStandards_sidebar
permalink: BOADocStandards_GuidelinesTerms.html
folder: BOADocStandards
---

The following table defines the basic standards implemented to ensure
consistency throughout all documentation, both online and print, unless
otherwise noted.

<table>
    <colgroup>
        <col width="25%" />
        <col width="25%" />
        <col width="25%" />
        <col width="25%" />
    </colgroup>
    <thead>
        <tr class="header">
            <th>Element</th>
            <th>Description</th>
            <th>Correct Example</th>
            <th>Incorrect Example</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
            <b>Abbreviations/Acronyms</b>
            </td>
            <td>
            The first time an abbreviation/acronym appears in a document, spell out the full name and put the abbreviation/acronym in parenthesis. After it has been spelled out, all other references can be the abbreviation or acronym.
            </td>
            <td>
            Data Stewardship Platform (DSP®)
            </td>
            <td>
            Data Stewardship Platform – DSP®
            </td>
        </tr>
        <tr>
            <td>
            <b>Action Verb when appropriate</b>
            </td>
            <td>
            Start all steps with a present tense action verb.
            </td>
            <td>
            <ol>
            <li>Click <b>Add</b>.</li>
            <li>Select an option from <b>User</b> list box.</li>
            </ol>
            </td>
            <td>
            <ol>
                <li>On the Page Toolbar, click <b>Add</b>.</li>
                <li>From the <b>User</b> list box, select an option.</li>
            </ol>
            </td>
        </tr>
        <tr>
            <td>
            <b>Serial Comma</b>
            </td>
            <td>
            Do not use a serial comma with “and” or “or,” i.e., when listing items in a sentence, do not insert a comma before the “and” or the “or” to introduce the last item in the list.
            </td>
            <td>
            Enter name, address and phone number.
            </td>
            <td>
            Enter the name, address, and phone number.
            </td>
        </tr>
        <tr>
            <td>
            <b>Icons</b>
            </td>
            <td>
            Refer to UI elements like this as icons.
            <img src="images/icons.png" alt="icons">
            <br>
            Identify the icon as such in the steps.
            </td>
            <td>
            Click the <b>Process Areas</b> icon.
            </td>
            <td>
            Click <b>Process Areas</b>.
            </td>
        </tr>
        <tr>
            <td>
            <b>Button</b>
            </td>
            <td>
            Refer to UI elements like the Clear Cache one below as a button.
            <img src="images/buttons.png" alt="icons">
            Do not include the word “button” for buttons in the Page toolbar, such as Save, Edit or Add. These button are always in the same place, so there’s no need to qualify them.
            </td>
            <td>
            Click <b>Add</b>.
            </td>
            <td>
            Click the Add button.
            </td>
        </tr>
        <tr>
            <td>
            <b>Capitalization</b>
            </td>
            <td>
            In general, do not capitalize application terminology such as roles, scenarios and column properties unless indicating a particular term.
            <br>
            <b>NOTE:</b> Field names in the documentation must match the field names in the product. If the product contains a capitalization error, documentation must reflect this.
            The following are always  capitalized:
            <ul>
                <li>Check box names</li>
                <li>Column heading names</li>
                <li>Dialog box names</li>
                <li>Field names</li>
                <li>Headers</li>
                <li>Icon names</li>
                <li>Keyboard names</li>
                <li>List box names</li>
                <li>Menu options</li>
                <li>Toolbars</li>
                <li>Page names</li>
                <li>Section names</li>
                <li>Tab names</li>
                <li>Value of field names unless generic</li>
                <li>value of list box names</li>
                <li>Window names</li>
                <li>WebApps</li>
                <li>Controls</li>
                <li>Environment names (in all capital letters)</li>
            </ul>
            </td>
            <td>
            <ol>
                <li>Log in to DEV</li>
                <li>Click <b>Filter</b>.</li>
                <li>Click <b>Label</b> to sort column.</li>
            </ol>
            </td>
            <td>
            <ol>
                <li>Log in to DEV</li>
                <li>Click filter.</li>
                <li>Click label column heading to sort column.</li>
            </ol>
            </td>
        </tr>
        <tr>
            <td>
            <b>Check box (Print)</b>
            </td>
            <td>
            <ul>
                <li>Use the term “check box.”</li>
                <li>Bold all check box names in imperative statements.</li>
                <li>Click a check box.</li>
                <li>Capitalize check box names.</li>
            </ul>
            </td>
            <td>
            Click the <b>Update Allowed</b> check box.
            </td>
            <td>
            Check the <b>Update Allowed</b> check box.
            </td>
        </tr>
        <tr>
            <td>
            <b>Check box (Online)</b>
            </td>
            <td>
            Follow standards for print, with these clarifications.
            <br><b>Use Cases:</b>
            When using the check box to add or to edit in numbered steps in a use case, use the standard: “Click the [check box name] check box to  [action].”
            or
            “Click the [check box name] check box to disable it, allowing [action]”
            <br><b>Field Descriptions:</b>
            When describing a check box in Field Descriptions, use the standard “If checked. . . .” to start the descriptions (or “If unchecked, . . .” if that’s the preferred setting).
            </td>
            <td>
            <b>Use Case:</b>
            <br>Click <b>UNIQUE INDEX</b> check box to build a unique index.
            <br><b>Field Description:</b>
            <br>If checked, a unique index is built.
            </td>
            <td>
            N/A
            </td>
        </tr>
        <tr>
            <td>
            <b>Code Text</b>
            </td>
            <td>
                <ul>
                    <li>Use body style</li>
                    <li>Use Consolas font</li>
                    <li>Capitalize NULL</li>
                </ul>
            </td>
            <td>
            The final three columns in the `#AuditProcedure` table are `boaAuditProcedureCounter`, `boaAuditProcedureType` and `boaAuditProcedureName`.
            </td>
            <td>
            The final three columns in the #AuditProcedure table are boaAuditProcedureCounter, boaAuditProcedureType and boaAuditProcedureName.
            </td>
        </tr>
        <tr>
            <td>
            <b>Colloquialism, Jargon and popular expressions</b>
            </td>
            <td>
            Avoid using jargon and popular expressions (Colloquialisms)
            </td>
            <td>
            Wait until the page loads…
            </td>
            <td>
            Wait until the page cuts on…
            </td>
        </tr>
        <tr>
            <td>
            <b>Column Headings</b>
            </td>
            <td>
                <ul>
                    <li>Capitalize column heading names as they appear in the UI.</li>
                    <li>Click a column heading to sort.</li>
                </ul>
            </td>
            <td>
            Click the <b>Label</b> column heading to sort the column.
            </td>
            <td>
            Select label column heading to sort column.
            </td>
        </tr>
        <tr>
            <td>
            <b>Concise Language</b>
            </td>
            <td>
            Omit needless words.
            </td>
            <td>
                <ul style="list-style-type:none;">
                    <li>allow, let</li>
                    <li>to</li>
                    <li>now</li>
                    <li>because</li>
                    <li>during</li>
                    <li>needs</li>
                    <li>quickly, promptly</li>
                    <li>by, following, per, under</li>
                    <li>before</li>
                    <li>to</li>
                    <li>about, concerning, on</li>
                    <li>for</li>
                    <li>if</li>
                    <li>shortly, soon</li>
                    <li>left, right</li>
                    <li>by June 1</li>
                    <li>about</li>
                    <li>guides</li>
                    <li>under</li>
                    <li>until</li>
                    <li>about</li>
                    <li>except</li>
                </ul>
            </td>
            <td>
                <ul style="list-style-type:none;">
                    <li>afford an opportunity</li>
                    <li>as a means of</li>
                    <li>at this point in time</li>
                    <li>due to the fact that</li>
                    <li>during the period</li>
                    <li>has a requirement for</li>
                    <li>in a timely manner</li>
                    <li>in accordance with</li>
                    <li>in advance of</li>
                    <li>in order to</li>
                    <li>in regard to</li>
                    <li>in the amount of</li>
                    <li>in the event that</li>
                    <li>in the near future</li>
                    <li>lef-hand, right-hand</li>
                    <li>no later than June 1</li>
                    <li>pertaining to</li>
                    <li>provides guidance for</li>
                    <li>under the provisions of</li>
                    <li>until such time as</li>
                    <li>with reference to</li>
                    <li>with the exception of</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td>
            <b>Currency and numerical formats</b>
            </td>
            <td>
            Understand international currency and numerical formats. As with date and time formats, provide format standards for reference.
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            <b>Date and time</b>
            </td>
            <td>
            Understand international date and time formats. Spell out the month in dates to avoid confusion. If needed provide format standards for reference.
            </td>
            <td>
            For example, write, “The dates referenced in this article use the MM/DD/YYYY format.” at the beginning of an article. Or add a note, “NOTE:  The format for the start and end date is MM/DD/YYYY.”
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            <b>Definitive Article</b>
            </td>
            <td>
            Use a definitive article (the, a, an, etc.), except when referring to buttons or the Vertical View as a clickable icon.
            </td>
            <td>
                <ol>
                    <li>Click <b>Request</b> on the <i>Navigation</i> pane.</li>
                    <li>Enter a value in the <b>Priority</b> field.</li>
                </ol>
            </td>
            <td>
                <ol>
                    <li>Click <b>Request</b> on the <i>Navigation</i> pane.</li>
                    <li>Enter a value in <b>Priority</b> field.</li>
                </ol>
            </td>
        </tr>
        <tr>
            <td>
            <b>Emphasizing Words</b>
            </td>
            <td>
            When emphasizing a word or an action, format the word in red, bold and all small letters.
            </td>
            <td>
            Do <span style="color:red;font-weight:bold;">not</span> click . . .
            </td>
            <td>
            Do <span style="color:red;font-weight:bold;">NOT</span> click . . .
            <br>Do <b>not</b> click . . .
            </td>
        </tr>
        <tr>
            <td>
            <b>Examples</b>
            </td>
            <td>
            Use “for example” and “as in” instead of e.g., and i.e.
            </td>
            <td>
            For example, …; (for example, …)
            </td>
            <td>
            …, as in…  (i.e.,…)
            </td>
        </tr>
        <tr>
            <td>
            <b>Field Values</b>
            </td>
            <td>
                <ul>
                    <li>Use the standard “Enter [value] in the [field name] field.”</li>
                    <li>Bold the field name.</li>
                </ul>
            </td>
            <td>
                <ol>
                    <li>Enter a WebApp name in the <b>Name</b> field.</li>
                    <li>Select a state from the <b>State</b> list box.</li>
                </ol>
            </td>
            <td>
                <ol>
                    <li>Enter  name in the "name" field.</li>
                    <li>Select state from <b>state</b> list box.</li>
                </ol>
            </td>
        </tr>
        <tr>
            <td>
            <b>Fonts (Print)</b>
            </td>
            <td>
            See the <a href="BOADocStandards_PrintStyles.html">Styles</a> page for more information.
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            <b>Headings (Print)</b>
            </td>
            <td>
                <ul>
                    <li>Do not number section headings.</li>
                    <li>Do not indent headings, regardless of the level.</li>
                </ul>
            </td>
            <td>
            <b>Heading 1</b>
            <br>Heading 2
            <br>Heading 3
            </td>
            <td>
                <ol>
                    <li>Heading 1</li>
                    <li>Heading 2</li>
                    <li>Heading 3</li>
                </ol>
            </td>
        </tr>
        <tr>
            <td>
            <b>Icons (Print)</b>
            </td>
            <td>
                <ul>
                    <li>Click an icon.</li>
                    <li>Capitalize and bold the icon name.</li>
                </ul>
            </td>
            <td>
            Click the <b>Targets</b> icon on the <i>Design</i> page.
            </td>
            <td>
            Select Targets.
            </td>
        </tr>
        <tr>
            <td>
            <b>Links (Print)</b>
            </td>
            <td>
                <ul>
                    <li>Click a link.</li>
                    <li>Format all links in blue and italicized when a hyperlink exists for the link, such as a reference to a section in the same document or a link to a Web site.</li>
                </ul>
            </td>
            <td>
            Refer to <span style="font-style:italic;color:blue;">Page Header</span> for detailed information. Go to <span style="font-style:italic;color:blue;">www.boaweb.com</span>
            </td>
            <td>
            Refer to the <b>Page Header</b> section for detailed information.
            </td>
        </tr>
        <tr>
            <td>
            <b>List Box</b>
            </td>
            <td>
                <ul>
                    <li>Use the term “list box.” For example, Select [a value] from the [list box name] list box.</li>
                    <li>If the user must select a specific value, apply bold formatting to bold that value.</li>
                    <li>If the user can select any value, do not bold the name.</li>
                </ul>
            </td>
            <td>
                <ol>
                    <li>Select <b>Texas</b> from the <b>State</b> list box.</li>
                    <li>Select a value from the <b>City</b> list box.</li>
                </ol>
            </td>
            <td>
                <ol>
                    <li>Choose Texas from State list box.</li>
                    <li>Choose a <b>city</b> from the city list box.</li>
                </ol>
            </td>
        </tr>
        <tr>
            <td>
            <b>Navigation pane</b>
            </td>
            <td>
            Standard is “Navigation” is in italics, pane is lower case.
            </td>
            <td>
            Select <b>Configuration > Data Sources</b> in the <i>Navigation</i> pane.
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            <b>Mood</b>
            </td>
            <td>
            Avoid conditional
            </td>
            <td>
            You can edit the file.
            </td>
            <td>
            You should edit the file.
            </td>
        </tr>
        <tr>
            <td>
            <b>NOTE</b>
            </td>
            <td>
                <ul>
                    <li>Use notes to explain additional information, exceptions to rules or features, processes or functionality.</li>
                    <li>Bold the word NOTE and the colon.</li>
                    <li>Present the word NOTE in all caps.</li>
                    <li>Insert the note after the relevant step.</li>
                </ul>
            </td>
            <td>
            <b>NOTE:</b> Column, Phrase Out and View Type column fields are not editable.
            </td>
            <td>
            Note: <b>Column, Phrase Out</b> and <b>View Type</b> column fields are not editable.
            </td>
        </tr>
        <tr>
            <td>
            <b>Numbers</b>
            </td>
            <td>
            Spell out numbers 1-10 when not associated with a date, dollar amount or measurement.
            </td>
            <td>
            The Switchboard contains five menu options.
            </td>
            <td>
            The Switchboard contains 5 menu options.
            </td>
        </tr>
        <tr>
            <td>
            <b>Or</b>
            </td>
            <td>
                <ul>
                    <li>Use  “Or” on a separate line between the options when presenting choices.</li>
                    <li>Use all caps for  or “OR”</li>
                    <li>Align  “OR” with the beginning of the options it is separating.</li>
                    <li>Do not number or bullet the second option when using  “Or” within a numbered or a bulleted list.</li>
                </ul>
            </td>
            <td>
                <ol>
                    <li>Click <b>Save</b>.
                    <br>OR
                    <br>Click <b>Cancel</b>.</li>
                </ol>
            </td>
            <td>
                <ol>
                    <li>Click <b>Save</b> or click <b>Cancel</b>.</li>
                </ol>
            </td>
        </tr>
        <tr>
            <td>
            <b>Parameters</b>
            </td>
            <td>
            Use this boilerplate text for all Parameters topics:
            <br>Parameters are [component name]-specific settings that must be configured per installation. Parameters are delivered with recommended default values. Review these values and make any changes necessary for the installation.
            <br>To configure trace parameters:
                <ol>
                    <li>Select <b>[Navigation Path]</b> in the <i>Navigation</i> pane.</li>
                    <li>Click <b>Edit</b>.
                    <br><i>View the field description for the [page name] page</i></li>
                    <li>Update all fields if default values are not applicable.</li>
                    <li>Click <b>Save</b>.</li>
                </ol>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            <b>Page vs. Screen</b>
            </td>
            <td>
                <ul>
                    <li>Use “page” for all BOA web-based applications.</li>
                    <li>Use “screen” for SAP and “window” for all other applications.</li>
                    <li>Capitalize and italicize all page and window names, but not the words “page” or “window”.</li>
                </ul>
            </td>
            <td>
            The <i>Request</i> page displays.
            </td>
            <td>
            The Request screen displays.
            <br>The bottom frame displays.
            </td>
        </tr>
        <tr>
            <td>
            <b>Password</b>
            </td>
            <td>
            Describe as asterisks when adding a password in steps.
            </td>
            <td>
            Displays asterisks representing the password for xxxxx.
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            <b>Personal Pronouns/Subjects (Online Help)</b>
            </td>
            <td>
            Do not use “you”, “he”, “she”, “they” etc.
            <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>NOTE:</b> Starting all steps using action verbs helps avoid personal pronouns and subjects.</div>
            </td>
            <td>
                <ol>
                    <li>Click <b>Add</b>.</li>
                    <li>Complete all steps prior to saving.</li>
                </ol>
            </td>
            <td>
                <ol>
                    <li>The use clicks the <b>Add</b> button. The DSP displays the <i>Add Request</i> page.</li>
                    <li>You should complete all steps prior to saving.</li>
                </ol>
            </td>
        </tr>
        <tr>
            <td>
            <b>Referencing Written Material (Print)</b>
            </td>
            <td>
                <ul>
                    <li>Italicize references to documents outside of the current document.</li>
                    <li>Italicize and use blue font for references within the current document.</li>
                </ul>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            <b>Passive Voice</b>
            </td>
            <td>
            Avoid the use of passive voice when at all possible. Make it clear who or what performs an action.
            </td>
            <td>
            Click <b>Vertical View</b>.
            <br>Collect generates the reports.
            <br>The Template Administrator configures the template process.
            </td>
            <td>
            The report is generated.
            <br><b>Vertical View</b> should be clicked.
            <br>The template process is configured.
            </td>
        </tr>
        <tr>
            <td>
            <b>Punctuation</b>
            </td>
            <td>
                <ul>
                    <li>Use only one space after a period to separate sentences.</li>
                    <li>Put a period at the end of each step.</li>
                    <li>Put a period at the end of each bullet if the bullet is a complete sentence. Be consistent with period use in bulleted lists.</li>
                    <li>Place punctuation outside of parenthesis unless it is a complete sentence in the parenthesis.</li>
                    <li>Avoid entire sentences in parenthesis, if possible.</li>
                </ul>
            </td>
            <td>
            Click <b>Add</b>.
            </td>
            <td>
            Click <b>Add</b>
            </td>
        </tr>
        <tr>
            <td>
            <b>Radio Buttons</b>
            </td>
            <td>
            Do not use the term radio button. Use option.
            </td>
            <td>
            Click the <b>Enable</b> option.
            </td>
            <td>
            Click the enable radio button.
            </td>
        </tr>
        <tr>
            <td>
            <b>SAP vs. Target System</b>
            </td>
            <td>
            Use “target system” instead of “SAP” when possible.
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            <b>Screen Shots (Print)</b>
            </td>
            <td>
                <ul>
                    <li>Include an introductory description if the screen shot is not inserted within steps.</li>
                    <li>Left align or tighten the introductory text with the screen shot if not within steps.</li>
                    <li>Insert the screen shot after the step that references the image when using screen shots within numbered steps.</li>
                    <li>Left align the screen shot with the numbered steps or tighten text of the screen shot to the left if inserting within steps.</li>
                    <li>Do not include a mouse pointer, arrows or text.</li>
                    <li>Put a 1 point black line border around the screen shot.</li>
                    <li>Include a caption to describe the screen shot.</li>
                </ul>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            <b>Tables (Print)</b>
            </td>
            <td>
                <ul>
                    <li>Format the first row in the Table Column style.</li>
                    <li>Format the remaining rows in the Table Text style.</li>
                    <li>Bold the first column.</li>
                    <li>Do not use a caption.</li>
                </ul>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            <b>Tense</b>
            </td>
            <td>
            Always use the present tense.
            </td>
            <td>
            Click the <b>Users</b> button; the <i>Users</i> page displays.
            </td>
            <td>
            Click the <b>Users</b> button; the <i>Users</i> page will display.
            </td>
        </tr>
        <tr>
            <td>
            <b>Time</b>
            </td>
            <td>
            Understand international date and time formats.  Spell out the month in dates to avoid confusion. If needed provide format standards for reference.
            </td>
            <td>
            For example, write, “The dates referenced in this article use the MM/DD/YYYY format.” at the beginning of an article. Or add a note, “NOTE:  The format for the start and end date is MM/DD/YYYY.”
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            <b>Terms</b>
            </td>
            <td>
            Use terms consistently. For example, do not use edit, change, and update. Select and use only one form of the verb and use it consistently.
            </td>
            <td>
            To edit the template, click <b>Edit</b>. If you need to edit the description, edit it in the <b>Description</b> text box.
            </td>
            <td>
            To update the template, click <b>Edit</b>. If you need to change the description, you can edit the <b>Description</b> text box.
            </td>
        </tr>
        <tr>
            <td>
            <b>Trademarks</b>
            </td>
            <td>
            The first trademarked product name that appears in a document is followed by the appropriate trademark symbol (™ or ®). All subsequent mentions of the trademarked product name are not followed by a trademark symbol. A list of current trademarks is available from the Legal department or at http://www.boaweb.com/trademarks/
            <br>Trademark symbols do not follow the product name if it appears as:
            <ul>
                <li>Part of a file name</li>
                <li>Part of a field on a page that does not also contain the trademark symbol</li>
            </ul>
            </td>
            <td>
            Select the dspcompose.bat file.
            <br>dspCompose™ is the replacement for cMass.
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            <b>Verbs</b>
            </td>
            <td>
            Use the most specific verb possible. This avoids both ambiguity and wordiness, and creates strong writing. Prefer single word verbs to multiple word verbs.
            </td>
            <td>
            "join"
            </td>
            <td>
            "Put together"
            </td>
        </tr>
        <tr>
            <td>
            <b>Views</b>
            </td>
            <td>
            When used in a sentence outside of a step in a use case:
            <ul>
                <li>Italicize and capitalize a view name.</li>
                <li>Do not italicize the word “View.”</li>
                <li>Capitalize and bold both words.</li>
            </ul>
            </td>
            <td>
            When used in a sentence outside of a step in a use case:
            <br>Click the <b>View Data</b> icon on the <i>Vertical</i> View of a request role before import to ensure that the data in the view is appropriate for import into the request.
            <br>When used in a step in a use case:
            <ol>
                <li>Click <b>Vertical View</b> for the role that allows data entry.</li>
            </ol>
            </td>
            <td>
            When used in a sentence outside of a step in a use case:
            <br>Click the <b>View Data</b> icon on the <i>Vertical</i> View of a request role before import to ensure that the data in the view is appropriate for import into the request.
            <br>When used in a step in a use case:
            <ol>
                <li>Click <i>Vertical View</i> for the role that allows data entry.</li>
            </ol>
            </td>
        </tr>
        <tr>
            <td>
            <b>Voice and Gerunds</b>
            </td>
            <td>
                <ul>
                    <li>Use the active voice not the passive voice.</li>
                    <li>Use the positive voice not the negative voice.</li>
                    <li>Do not use gerunds (a verb that ends in -ing and functions as a noun) in titles or to begin steps.</li>
                </ul>
            </td>
            <td>
            Click Users; the <i>Users</i> page displays
            </td>
            <td>
            Clicking Users opens the <i>Users</i> page.
            </td>
        </tr>
    </tbody>
</table>

{% include links.html %}
