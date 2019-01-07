---
title: Documentation Updates by Release Type for the DSP/WebApps
keywords: BOADocProcess
sidebar: BOADocProcess_sidebar
summary: "This page includes a table that lists all major releases of the different BOA components."
permalink: BOADocProcess_DocUpdatesTable.html
folder: BOADocProcess
---
## Items to be Updated By Release Type
<table>
    <colgroup>
        <col width="25%" />
        <col width="25%" />
        <col width="25%" />
        <col width="25%" />
    </colgroup>
    <thead>
        <tr class="header">
            <th>Type of release</th>
            <th>Online Help Updated</th>
            <th>Release Notes Created</th>
            <th>Installation Manuals Created</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Major release (as in, 6.0)
            </td>
            <td>Yes. <br/>The What’s New topic content should include:<br/>
                <ul>
                    <li>New Features and updates since the immediate prior version (as in, the updates to the What’s New topic for 6.0 should only contain updates implemented in 6.0).</li>
                    <li>A description of every enhancement request included in the version.</li>
                    <li>A description of every Online Help feedback request from the field included in the version.</li>
                    <li>All Support issues</li>
                    <li>All Jira tickets that describe changes to behavior, the UI, or the help that were made to previously released versions. These may be bugs internally reported by PM, task tickets, defect tickets or others.</li>
                </ul>
            </td>
            <td>
            Yes. <br/><br/> Release notes should contain identical content to the What’s New topic in help.
            </td>
            <td>
            Yes.
            </td>
        </tr>
            <td>Monor release (as in, 6.3)</td>
            <td>Yes. <br/> Same as for Major release.</td>
            <td>Yes.</td>
            <td>Yes.</td>
        <tr>
            <td>Service Pack Release (as in, 6.2.1 SP)</td>
            <td>Yes. <br/> The What’s New topic should contain only the changes included with the SP. <br/> <div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> If the changes in the Service Pack are for the Full Version only, the SAP Accelerators version of the help will not be created. If the changes apply to the SAP Accelerators version only, a BackOffice Solutions (Full) version of help will still be created.</div></td>
            <td>Yes. <br/>This document should include any changes since the last minor version release. If multiple Service Packs are released for a Minor release, the release notes for each Service Pack should contain changes from the previous Service Pack.<br/>For example, the 6.2.2 SP release notes should contain the content from the 6.2.1 SP release notes.<br/><div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> If the changes in the Service Pack are for the Full Version only, the SAP Accelerators version of the release notes will not be created.<br/>If the changes in the Service Pack are for the SAP Accelerators version only, the BackOffice Solutions (Full) version of the release notes will still be created.</div></td>
            <td>Yes.</td>
        </tr>
            <td>Patch release (as in, 6.0.3.1 Patch)</td>
            <td>No.<br/>(Developers include in the zipped patch file a readme.txt file describing the content of the patch).</td>
            <td>No.</td>
            <td>No.</td>
    </tbody>
</table>

## Summary of DSP Release Versions and Full/Solex Content

<table>
    <colgroup>
        <col width="50%" />
        <col width="30%" />
        <col width="10%" />
        <col width="10%" />
    </colgroup>
    <thead>
        <tr class="header">
            <th>Version Number</th>
            <th>Solex</th>
            <th>Full</th>
            <th>System Admin</th>
        </tr>
    </thead>
    <tbody>
    <tr>
        <td>7.0.2</td>
        <td>Yes released 1/14/19</td>
        <td>Yes</td>
        <td>N/A</td>
    </tr>
        <tr>
            <td>7.0.1<br/>Agent Interface added</td>
            <td>Not yet active as of 11/07/18<br/>SAP PQ for 7.0 ongoing</td>
            <td>Yes</td>
            <td>N/A</td>
        </tr>
            <td>7.0<br/>Move to Hosted help<br/>System Admin content added back to product help.<br/>Sys Admin help no longer produced.</td>
            <td>Yes</td>
            <td>Yes</td>
            <td>No</td>
        <tr>
            <td>6.6.x<br/><div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> 6.6.1 was the first version with Sys Admin Help split out.</div></td>
            <td>Yes</td>
            <td>Yes</td>
            <td>Yes</td>
        </tr>
        <tr>
            <td>6.5.6<br/><div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> A 6.5.4 and 6.5.5 version were not released.</div></td>
            <td>Yes</td>
            <td>Yes</td>
            <td></td>
        </tr>
        <tr>
            <td>6.5.3</td>
            <td>Yes</td>
            <td>Yes</td>
            <td></td>
        </tr>
        <tr>
            <td>6.5.2</td>
            <td>No</td>
            <td>Yes</td>
            <td></td>
        </tr>
        <tr>
            <td>6.5.1</td>
            <td>No</td>
            <td>Yes</td>
            <td></td>
        </tr>
        <tr>
            <td>6.5</td>
            <td>Yes</td>
            <td>Yes</td>
            <td></td>
        </tr>
        <tr>
            <td>6.4<br/><div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> No version with this number was released.</div></td>
            <td>No</td>
            <td>No</td>
            <td></td>
        </tr>
            <td>6.3.1</td>
            <td>Yes</td>
            <td>Yes</td>
            <td></td>
        <tr>
            <td>6.3<br/>First version that used Condition Tags (CTs) to create separate help files from the same project.</td>
            <td>Yes</td>
            <td>Yes</td>
            <td></td>
        </tr>
        <tr>
            <td>6.2<br/>dspCompose reintroduced</td>
            <td>Yes</td>
            <td>Yes</td>
            <td></td>
        </tr>
        <tr>
            <td>6.1<br/>No CTs applied in help file.</td>
            <td>Yes</td>
            <td>Yes</td>
            <td></td>
        </tr>
        <tr>
            <td>6.0.3<br/><div markdown="span" class="alert alert-info" role="alert"><i class="fa fa-info-circle"></i> <b>Note:</b> A separate help file was generated for the Solex product that contained ISA, dspCompose and Integrate only. This was maintained in a separate project.</div></td>
            <td>Yes</td>
            <td>Yes</td>
            <td></td>
        </tr>
        <tr>
            <td>6.0.2<br/>dspCompose introduced in full version</td>
            <td>No</td>
            <td>Yes</td>
            <td></td>
        </tr>
        <tr>
            <td>6.0.1</td>
            <td>No</td>
            <td>Yes</td>
            <td></td>
        </tr>
        <tr>
            <td>6.1</td>
            <td>No</td>
            <td>Yes</td>
            <td></td>
        </tr>
    </tbody>
</table>
