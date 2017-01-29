---
title: OnlyKey FAQ
permalink: faq.html
sidebar: mydoc_sidebar
tags: [special_layouts]
keywords: frequently asked questions, FAQ, question and answer, collapsible sections, expand, collapse
last_updated: Jan, 16 2017
summary: Frequently Asked Questions
toc: false
folder: mydoc
---

<div class="panel-group" id="accordion">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">What specifically are the differences between the U.S. Version firmware and the International Version firmware?</a>
                            </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse noCrossRef">
                            <div class="panel-body">
                                The International Version firmware is essentially a stripped down version of the U.S. Version firmware. The crypto libraries have been removed so that it will be a fully functional password manager but not utilize encryption and may be usable in countries where encryption is illegal.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Why have the two different versions of Firmware?</a>
                            </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse noCrossRef">
                            <div class="panel-body">
                                There are two big reasons to have the two separate versions of firmware. 1) The International Version is not subject to any export restrictions that would apply to export of crypto outside of the US since it performs no encryption. 2) By actually having a version in use that does not utilize encryption the plausible deniability feature is actually plausible. If for example all devices shipped with encryption and a plausible deniability mode it would not be plausible that a device does not perform encryption because anyone with the ability to search online would see that this is a feature available on all devices. By having this as a feature on some devices and other devices being legitimately without any encryption capabilities it is plausible that your device does not utilize encryption.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">What does entering the self destruct PIN do?</a>
                            </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse noCrossRef">
                            <div class="panel-body">
                                Depending on what your wipe mode is set to it either wipes all sensitive data (overwrites where your usernames, passwords, keys etc. are stored) or if you are using full wipe mode it does a complete erase of the OnlyKey including sensitive data and all firmware (this requires reloading firmware).
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">When should I use the self destruct PIN?</a>
                            </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse">
                            <div class="panel-body">
                                Whenever you wish to wipe all sensitive data from the OnlyKey and restore it to a factory default state.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">What does entering the plausible deniability PIN do?</a>
                            </h4>
                        </div>
                        <div id="collapseFive" class="panel-collapse collapse">
                            <div class="panel-body">
                                This activates a second profile that is designed to be indistinguishable from the OnlyKey (International Version) firmware while actually running the OnlyKey (U.S.) version firmware. The objective of this feature is to allow users to run the OnlyKey (U.S.) version and travel overseas to areas where devices using encryption might not be allowed. The user would have a plausible story in showing that their device is just a basic password manager without any encryption. For more information on encryption and international travel see https://www.princeton.edu/itsecurity/encryption/encryption-and-internatio/
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">When should I use the plausible deniability PIN??</a>
                            </h4>
                        </div>
                        <div id="collapseSix" class="panel-collapse collapse">
                            <div class="panel-body">
                                Whenever you wish for your OnlyKey to appear to be a simple password manager that does not utilize encryption. Form more information on Plausible Deniability encryption see https://en.wikipedia.org/wiki/Deniable_encryption
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven">When should I not use the plausible deniability PIN?</a>
                            </h4>
                        </div>
                        <div id="collapseSeven" class="panel-collapse collapse">
                            <div class="panel-body">
                                Plausible deniability is only good if you are in a country where your worst case scenario is that you will be fined for using encryption. If someone is holding a gun to your head or there is risk of torture plausible deniability is pretty much useless. For more information on why see this https://en.wikipedia.org/wiki/Rubber-hose_cryptanalysis.

If you think an adversary has the resources to decap a chip and inspect the contents with an electron microscope, or equivalent method, and is willing to spend these resources to obtain your passwords, then this implementation of plausible deniability would be defeated as there is no tamper respondent enclosure surrounding the device.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseNine">How can I be sure by OnlyKey does not have a backdoor or was not tampered with?</a>
                            </h4>
                        </div>
                        <div id="collapseNine" class="panel-collapse collapse">
                            <div class="panel-body">
                                We have designed OnlyKey to be as transparent as possible (literally it is covered in a clear potting compound). You can load our firmware, review the source, or write your own firmware. Here are some of the features that allow you validate that there is no backdoor or tampering has occurred.
                                1) Hardware - By having a clear coat on the electronics you can actually see the hardware and would be able to see a hardware type of backdoor.
                                2) Software - The way that OnlyKey loads firmware is unique. When you bridge the two touch points to load firmware what actually happens is first the small chip on the board sends a message to the large chip on the board that wipes all data from the large chip, next the firmware is loaded onto the small chip via USB, and finally written onto the blank large chip. So even is someone succeeded in loading malicious software onto your OnlyKey reloading the firmware would completely remove it.
                            </div>
                        </div>
                    </div>
                     <!-- /.panel -->                   
                     <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a class="noCrossRef accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">Why not sign the firmware with a code signing certificate?</a>
                            </h4>
                        </div>
                        <div id="collapseEight" class="panel-collapse collapse">
                            <div class="panel-body">
                                We did consider this option but there is one big security weakness this introduces. If the registered holder of the signing certificate is forced to give up the private key (by court order or other means) then whoever gains access to the private key could make modifications to the firmware and release it to unsuspecting users. Also there is not a good way to have firmware be both open source and require a specific code signing certificate. The integrity of firmware can still be validated without a signature using a checksum.
                            </div>
                        </div>
                    </div>
                    <!-- /.panel -->
</div>
<!-- /.panel-group -->

{% include links.html %}
