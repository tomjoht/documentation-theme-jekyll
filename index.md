---
title: "Getting started with CanAirIO"
keywords: homepage
tags: [getting_started]
sidebar: english_sidebar
permalink: index.html
summary: These brief instructions will help you get started quickly with CanAirIO. 
---
## Overview

CanAirIO is a citizen science project using mobile and fixed air quality stations to measure some variables like PM2.5, CO2, AQI and others air indicators with cell phones and low-cost technology. 

## Building a device

We have some device version alternatives with some guides:

| Device version    | Difficulty | Links   |
| :------------- |:--------:| :-----------: | 
|  CanAirIO without soldering   | Easy | [Complete guide and video][1] |

[1]: https://www.hackster.io/canairio/build-low-cost-air-quality-sensor-canairio-without-soldering-d87494


## Firmware upload

CanAirIO device supports ESP32 boards with Bluetooth and Wifi features, all boards with it should be able to receive the current firmware. We have three alternatives for uploading it:

| Alternative    | Software | Requeriments  | Links   |
| :------------- |:--------:| :-----------: | :-----: |
| Uploader sketch (easy)    | Arduino Droid App | NO drivers only a OTG cable | [Complete guide and video][1] |
| Uploader sketch (basic)    | Arduino IDE | USB drivers | [Complete Guide][1] |
| Installer (basic)       | Python | NO drivers on Linux and Mac | [CanAirIO release][2] |
| Binaries (basic)      | Espressif software | USB drivers - Windows only | [Complete guide][3] |
| Build and install (advanced) | PlatformIO | No drivers on Linux | [Complete guide][4] |

[1]: https://github.com/hpsaturn/esp32-canairio-loader#readme
[2]: https://github.com/kike-canaries/canairio_firmware/releases
[3]: /firmware_upload_binaries_alternative.html
[4]: https://github.com/kike-canaries/canairio_firmware#compiling

---

## Publish data



## Community


{% include links.html %}

