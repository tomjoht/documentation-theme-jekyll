---
title: CU CS Virtual Machine
keywords: vm, vmware, cu, cs
summary: "The CU CS VM provides a free, local Linux-based development system similar to what we run in our labs. It is primarily used in CS undergraduate courses to ensure all students, teachers, and TAs are using the same standardized environment."
sidebar: mydoc_sidebar
permalink: cser_cs_vm.html
folder: cser
---

{% include note.html content="The use of VMware and the CU CS VM are deprecated in favor of using the <a href='/coding_environment_landing_page.html'>Coding Environment</a>" %}


{% include note.html content="Use of the CU CS VM is dependent on VMware. Please complete the [VMware](/cser_vmware.html) setup before proceeding." %}



## System Requirements

To run smoothly, the VM requires a minimum of:

* 4GB of RAM
* Intel or AMD processor with virtualization support (VT-x or AMD-V)
* 2 physical processor cores (dual-core)
* 50GB of free HD space
* A modern 64-bit OS (Windows 7 or newer, OSX 10.7 or newer, or Linux 3.0 or newer)


## Download

The CU CS VM download is available in two versions: [BitTorrent](http://en.wikipedia.org/wiki/BitTorrent) and [HTTP](http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol)

We recommend using the BitTorrent download; it is faster and less prone to errors than the HTTP method. To use BitTorrent, you'll need to first install a BitTorrent Client. If you do not already have a BitTorrent client installed, we recommend [qTorrent](http://www.qbittorrent.org/download.php) for OSX or Windows, and [Transmission](https://www.transmissionbt.com/) for Linux.


[Torrent](https://csel-archive.cs.colorado.edu/vm-images/CU-CS-VM-Fall-2018.torrent)
[HTTP](https://csel-archive.cs.colorado.edu/vm-images/CU-CS-VM-Fall-2018.zip)

If you are experiencing difficulty either downloading or installing the VM, please email the CSEL support staff at [help@cs.colorado.edu](mailto:help@cs.colorado.edu).


## Install

Once VMware has been installed, we need to import the CU CS VM image. To complete this process:

1. Locate the zipped folder you downloaded above on your PC.
2. Extract the files in this folder and locate the VM image file (.ovf file)
3. Launch VMware (installed above)
4. From the VMware home screen, select Open a Virtual Machine (for VMware Fusion users, look for the 5. add button and choose Import existing VM)
6. In the Import window that pops up, use the file picker to select the *.ovf VM image file from Step #2
6. Select Next
7. You may get an error message about the OVF file format; if you do, click retry. It will tell you that the VM may not work if you do this -- don't worry about this.
8. Wait for the import process to complete: this may take 5 to 15 minutes depending on the speed of your PC.
9. When the import process has completed, you'll be taken to the VMware tab for your new VM. You can launch the VM from here by clicking the play button.

## Usage

The VM runs a variant of Ubuntu 16.04 GNU/Linux called Xubuntu. GNU/Linux is a Free operating system popular amongst programmers and other advanced computer users. It is also the OS behind many embedded systems (e.g. cars, thermostats, etc), smart phones (e.g. Android), and most of the world wide web.

### Basics

To launch the VM, select it in the left-side VMWare VM list and either double-click or select the green Start button at the top of the VirtualBox window. The VM will launch in its own window. After completing the boot process (you may see a black screen with scrolling text for a few moments), the VM will present a the desktop. Once the VM has booted you may:

* Resize the VM window: the desktop should resize itself to accommodate your desired window size
* Launch any of the installed VM programs (e.g. Geany, terminal, etc)
* Install new VM programs using the apt package manager
* Change VM settings
* Etc

From a UI perspective, the VM behaves a lot like other OSes you may be familiar with such as OSX or Windows. The basics of how to complete the above actions are available on the VM's desktop background. Further details can be found via Google.

When you are done using the VM, please shut it down gracefully: use the top-bar menu icon to select the Shut Down or Log Out button, select the Shut Down option, and then wait for the VM window to close automatically once the VM has shut down.

### Transferring Data to/from the VM

The VM behaves as if it's a separate computer form the machine you run it on. Thus, we must transfer data to or from the VM fairly regularly. There are a variety of methods for doing this:

* Use [Dropbox](https://www.dropbox.com/) to sync all VM data to your local machine
* Use git to sync your code/data to a cloud-based site like [GitHub](https://github.com/)
* Use VMware's [shared-folders](https://www.vmware.com/search.html?q=shared%20folders) feature to move data between the VM and your local machine
* Use email to send your files to yourself
* Use rsync or scp to copy your files via SSH to the CU CS ELRA Servers.

Of these options, Dropbox is the simplest to use. Simply sign up for a Dropbox account and then sign into Dropbox via the window that pops up when you boot the VM. Once singed in, save all your files to the ~/Dropbox directory in your home folder and your work will be atomically synced to the cloud. To sync it to your local machine, simply install Dropbox there as well and your Dropbox folder will get synced automatically between the VM and local machine.

As with any computer, it's important to backup your work! Users who's only copy of their data resides on the VM will likelihood not have pleasant experiences. Thus, please make sure you use one or more of the above methods to keep a second, off-VM copy of your data at all times.


## Frequently Asked Questions (FAQ)

### Why can't I log in to Dropbox on the VM?

There is currently an issue with the Firefox browser that prevents users from logging into their Dropbox accounts. They are given an error that their credentials are invalid. Rather than trying to troubleshoot the issue in Firefox, we recommend a work-around:

1. Go to the start menu (blue icon in the top left of the VM) and open Google Chrome
2. When prompted, set Google Chrome as your default browser
3. Restart the VM (go to the start menu, select the power icon in the bottom right corner, and then choose 'Restart')

When the VM starts back up, a Dropbox browser window will come back up, but this time in Google Chrome. You should be able to log in normally.

### What is the username and password on the VM?

The default username:password combo is user:user. You may change this password if you desire by running passwd from a terminal.

As on most Debian-based system, the root account is disabled. Use sudo if you need to run privileged commands.

### How do I fix a CPU error when trying to boot my VM?

If you receive an error message along the lines of:


```
The CPU has been disabled by the guest operating system. Power off
or reset the virtual machine.
```
or:

```
VMware Workstation unrecoverable error: (vcpu-0)

vcpu-0:VERIFY vmcore/vmm/main/cpuid.c:386 bugNr=1036521

A log file is available in
"C:\Users\<user>\Documents\Virtual Machines\<VM Name>\vmware.log".
```

Or your VM boots into a black screen with a white underscore cursor, it generally means VMware is having trouble getting your processor to support virtualization. This is normally due to one of the following issues:

```
Your machine supports virtualization, but it has been disabled in the BIOS
```

```
Your machine does not support virtualization
````

To correct the former case, boot into your machine's BIOS and enable the virtualization setting. The exact process for this differs by machine (try Google or consult your machine's user manual). The following steps are provided for convenience, but MAY NOT BE correct on your machine.

To boot into the BIOS and enable virtualization on most Windows 10 machines:

1. Open your start menu and search for "Settings", then open it
2. Choose "Update & Security"
3. On the left-hand menu, select "Recovery"
4. Scroll down until you see "Advanced Startup", then click "Restart Now". Your machine will shut down for a moment, then come back up on a blue screen with a few different choices.
5. Choose "Troubleshoot"
6. Choose "Advanced options"
7. Select "UEFI Firmware Settings".
8. Click restart.
9. After a moment, your PC should boot back up on a black screen with a few different options listed. Look for "BIOS Settings" on the list and press the indicated Fn key (usually it is F10; your function keys are located on the top row of your keyboard).
10. You'll be taken to the BIOS. Note that you can only navigate in the BIOS using your arrow keys and the enter key.
11. Look for an option labeled something like "Intel VT-x", "Intel Virtualization Technology", or "Virtualization Support". The option is usually under either Security or Configuration, though it could be elsewhere. Sometimes there are two settings related to virtualization - make sure to enable both. (To enable: move the arrow keys until the virtualization setting is highlighted, press enter, use the arrow keys to select "enabled", then press enter).
12. Save and exit the BIOS. (You should see a keyboard shortcut at the bottom of the screen for doing this, or you can exit through the menu)
13. Let the PC reboot. Log back in, then try to launch the VM again.

See [this article](https://www.laptopmag.com/articles/access-bios-windows-10) on Laptop Mag (external site) for images of how to boot into the BIOS.

In the latter case (e.g. if you find no virtualization settings in your BIOS), you may have to either upgrade your computer, or install Linux alongside your host operating system in dual boot mode.

### Why is the network not working on the VM?

The VM takes the network connection from the host operating system as an Ethernet connection. If you are not connected to the Internet on the VM, then the problem is most likely that you are not connected on your host.

Check your network settings on your host operating system and ensure you are connected. If you are connecting to UCBWireless or UCBGuest, you may need to open on a browser window (on your host OS) and authenticate through OIT.

If you are certain that you are connected on your host OS (i.e., web pages are loading properly, no errors are showing in your connection status), but still cannot connect on the VM, then contact [help@cs.colorado.edu](mailto:help@cs.colorado.edu).



{% include links.html %}
