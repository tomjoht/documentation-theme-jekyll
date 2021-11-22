---
title: CanAirIO app usage
tags:
  - android
  - device
  - firmware
  - user_manual
  - getting_started
keywords: firmware, android, app, usage, fixed station, mobile station, user manual
last_updated: "November 17, 2021"
summary: "CanAirIO android app basics"
series: "Getting Started"
sidebar: english_sidebar
permalink: app_usage.html
folder: en
---

## Overview

[CanAirIO](https://canair.io) have for the moment a Android app (iOS in progress) for configure and using the [CanAirIO device](https://github.com/kike-canaries/canairio_firmware#canairio-firmware) in two modes, mobile station or fixed station. The next guide try to explain these modes.

## Installation

For now you need any Android device with Bluetooth 4 or above. You can download the CanAirIO app from [GooglePlay](https://play.google.com/store/apps/details?id=hpsaturn.pollutionreporter), keep in mind that it is in continuos development then please any feedback, report errors, or any thing please let us knowed it via our [contact form](http://canair.io/#three) or on our [Telegram chat](https://t.me/canairio)

## Quick start guide

![CanAirIO Bike Quick Start](https://canair.io/docs/images/canairio_bike_quick_start.jpg)

## Mobile Station Mode

For record tracks on your device (Sdcard) or publish it to the cloud (share), please follow the next steps:

### Connection to device

<a href="https://github.com/kike-canaries/esp32-hpma115s0/blob/master/images/device_connection.jpg" target="_blank"><img src="https://raw.githubusercontent.com/kike-canaries/esp32-hpma115s0/master/images/device_connection.jpg" width="512" align="center" ></a>

### Recording track and share

<a href="https://github.com/kike-canaries/esp32-hpma115s0/blob/master/images/app_track_record.jpg" target="_blank"><img src="https://raw.githubusercontent.com/kike-canaries/esp32-hpma115s0/master/images/app_track_record.jpg" width="512" align="center" ></a>

**NOTE**: Also all recorded tracks will be saved in the `/sdcard/canairio/` directory on `json` format.

### CanAirIO Mobile Map

We are developing a new mobile map, you can see the current tracks that the people share here:  

<a href="https://mobile.canair.io" target="_blank"><img src="images/canairio_mobile_map.jpg" height="300" align="center" ></a>

---

## Fixed Station Mode

<a href="https://user-images.githubusercontent.com/423856/127383369-e57628a8-2a0b-44de-a29a-b8343a62f731.jpg" target="_blank"><img src="https://user-images.githubusercontent.com/423856/127383369-e57628a8-2a0b-44de-a29a-b8343a62f731.jpg" height="300" align="center" ></a>

<a href="https://user-images.githubusercontent.com/423856/141691438-214808d5-d367-4a75-ad49-a1e7978b4269.gif" target="_blank"><img src="https://user-images.githubusercontent.com/423856/141691438-214808d5-d367-4a75-ad49-a1e7978b4269.gif" height="340" align="right" ></a>

Also, you can connect your CanAirIO device to the WiFi and leave this like a fixed station. In this mode you only need the Android app only for setup the initial settings, after that the device could be publish data without the phone using the WiFi. For this please download the [CanAirIO app](https://bit.ly/3HjDJqP) and setup the WiFi:

### WiFi Setup

  - Open the app and enter on settings section
  - Choose the **Wifi Name** and set the **Password** (if it has) 
  - Save the credentials with the switch.
  - Wait for `connected` status in the summary switch  

<a href="https://user-images.githubusercontent.com/423856/141445500-ab6d7c6e-4a19-43fc-967e-c33ae60a073d.gif" target="_blank"><img src="https://user-images.githubusercontent.com/423856/141445500-ab6d7c6e-4a19-43fc-967e-c33ae60a073d.gif" height="250" align="center" ></a>

### Publication

After WiFi is ready, please follow the next steps for publish your fixed station:

  - save Geohash location (turn on the switch for save, it will go to off after some seconds)
  - enable the publication switch
  - wait for some minutes, the device should be show data icon some times
  - your station should be in our [Global Map](canair.io/stations) with the special ID showed in the last item of settings 

## CanAirIO fixed station (fast setup guide)

[![CanAirIO CO2 easy Setup](https://github.com/kike-canaries/canairio_android/raw/master/images/anaire_youtube_preview.jpg)](https://youtu.be/29wfMPZXvps) 
 
 