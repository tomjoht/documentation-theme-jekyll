---
title: Firmware Upload
tags:
  - firmware
  - device
  - windows
keywords: firmware, windows, upload, binaries, Espressif, CanAirIO Uploader
last_updated: "March 12, 2021"
summary: "CanAirIO firmware upload alternatives"
series: "Getting Started"
sidebar: english_sidebar
permalink: firmware_upload.html
folder: en
---

## Overview

CanAirIO device supports [ESP32 boards](#boards-supported) with Bluetooth and Wifi features, all boards with it should be able to receive the current firmware. We have five alternatives for uploading it:

| Alternative    | Difficulty | Software | Requeriments |
| :-------------------- |:--------:| :-----------: | :-----: |
| [CanAirIO Web Installer][10] | Super Easy | PC | Browser with Chrome or Edge | 
| [CanAirIO Loader][20] | Easy | Arduino Droid App | Android and OTG cable | 
| [CanAirIO Loader][20] | Basic | Arduino IDE | USB drivers on Windows and MacOSX | 
| [Espressif Uploader][21] | Basic | Espressif tool | Only works on Windows |
| [CanAirIO Installer][22] | Basic | Python3 | USB drivers on Windows and MacOSX | 
| [Source code][23] | Advanced | PlatformIO | No needs drivers on Linux |

[10]: #canairio-web-installer
[20]: #canairio-loader
[21]: #espressif-uploader
[22]: #canairio-installer
[23]: https://github.com/kike-canaries/canairio_firmware#compiling

The current supported boards with these methods are [here](https://github.com/kike-canaries/canairio_firmware#boards-supported)

## Boards supported

The [last release](https://github.com/kike-canaries/canairio_firmware/releases) of CanAirIO Device supports the next boards:

| Firmware Name | Boards supported |   Display  |  Guide and schematics  |
| ------------- |:-------------:| :-------------:| :----------------------:|
| **TTGO_TDISPLAY**     | TTGO T-Display | eTFT | [CanAirIO Bike](https://canair.io/docs/canairio_bike.html) |
| **TTGO_T7**     | TTGO T7, D1Mini, ** | OLED 64x48 | [CanAirIO v2.1](https://www.hackster.io/canairio/build-a-low-cost-air-quality-sensor-with-canairio-bbf647) |
| **ESP32DevKit** | ESP32DevKit, NodeMCU V3, ** | OLED 128x64 | [HacksterIO](https://www.hackster.io/canairio/build-low-cost-air-quality-sensor-canairio-without-soldering-d87494) |
| **TTGO_TQ** | TTGO TQ | Builtin OLED  | [TTGO_TQ board](https://de.aliexpress.com/item/10000291636371.html) |
| **WEMOSOLED** | WemosOLED and similar boards | OLED 128x64 | [ESP32 OLED board](https://de.aliexpress.com/item/33047481007.html) |
| **HELTEC** |  ESP32 Heltec board |  OLED 128x64 | | 


** is possible that the **current firmware supports more boards** and sensors. Also you can choose the sensor brand or type on the CanAirIO Android app.

## CanAirIO Web Installer

Super [easy tool](https://canair.io/installer.html) to load the last firmware version via Chrome or Edge. You only need a USB cable.

### Video demo

[![Youtube: CanAirIO Web Installer](http://img.youtube.com/vi/n3A6sJj_-Gc/0.jpg)](https://www.youtube.com/watch?v=n3A6sJj_-Gc "Youtube: CanAirIO Web Installer")

## CanAirIO Loader

With [this method](https://github.com/hpsaturn/esp32-canairio-loader#readme) you will able to upload the latest version of [CanAir.IO firmware](https://github.com/kike-canaries/canairio_firmware#canairio-firmware)
automatically via a simple [Arduino sketch](https://raw.githubusercontent.com/hpsaturn/esp32-canairio-loader/master/canairio_loader/canairio_loader.ino)  

You can run it from your **Arduino IDE** or from your **Android** phone
using [ArduinoDroid](https://play.google.com/store/apps/details?id=name.antonsmirnov.android.arduinodroid2&hl=en&gl=US)
app (**recommended**) with a simple **OTG** cable connected to your board. (see the video below)

### Video demo

[![Youtube CanAirIO basic loader guide](http://img.youtube.com/vi/FjfGdnTk-rc/0.jpg)](http://www.youtube.com/watch?v=FjfGdnTk-rc "Youtube CanAirIO basic loader guide")

### Troubleshooting

Please check the complete troubleshooting section of CanAirIO loader [here](https://github.com/hpsaturn/esp32-canairio-loader#troubleshooting)


## Espressif Uploader

This option you don't need compiling the binaries, you can download the pre-built binaries and follow the next steps:

### Steps

1. [Download](https://github.com/kike-canaries/canairio_firmware/releases) the zip file from assets section with the name `canairio_revxxx_20xxXXXX.zip` and uncompress it

    ![Firmware releases - Assets section](images/firmmware_upload_assets_section.webp)

2.  Please download the official Espressif software: **Flash Download Tools (ESP8266 & ESP32)** from https://www.espressif.com/en/support/download/other-tools

3. Please connect your board using a USB data cable, some power bank or charger cables could not work. If you Windows machine don't have the drivers, please download it before.

4. Open the software `Flash Download Tools`.

5. Please choose "Developer Mode" and then, the third square "ESP32 DownloadTool".

6. After that, the window for load the binaries files will be show:

    ![Firmware releases - Assets section](images/firmmware_upload_esp_download_tool.webp)


7. Please load the four files like is showed in the screenshot with the next values:

    ```python
    bootloader_dio_40m.bin... @ 0x1000
    partitions.bin... @ 0x8000
    boot_app0.bin.... @ 0xe000
    canairio_ESP32DEVKIT_rev680_20201121.bin... @ 0x10000
    ```

    Please note that you should choose the right binary for your CanAirIO device model, for example if you have a `ESP32DEVKIT` board, you should load the binary: `canairio_ESP32DEVKIT_rev793.bin`. The others binary files are located in the directory called system into the canairio installer zip.

8. check the speed:

    ```python
    SPI SPEED: 40MHz
    SPI MODE: DIO
    ```

9. check the option: DoNotChgBin.

10. Please show your serial comm port and velocity.

11. Please click in the START button.

12. When the firmware downloading finished, please click STOP button.

13. Disconnect your board from the USB cable.

14. Reboot your device and CanAirIO home screen will be showed.

## CanAirIO Installer

This option you don't need compiling the binaries, you can download the pre-built binaries and follow the next steps:

### Prerequisites

Please before install Python3 and `esptool` package. More information [here](https://github.com/espressif/esptool)

### Steps

1. Connect your CanAirIO device to your USB 
2. Download the last firmware [release](https://github.com/kike-canaries/canairio_firmware/releases)
3. Unzip and execute the next command for your model board*, like this:

``` bash
unzip canairio_rev414_20190829.zip
cd canairio_installer
./install.sh canairio_TTGO_T7_rev605_20200925.bin
```

### Advanced options

For more options run `./canairio_installer help`.  

#### USB parameters

For example you can increment the upload speed:

``` bash
./install.sh usb canairio_TTGO_T7_rev792.bin /dev/ttyUSB0 1500000
```

#### OTA parameters

Send OTA updates to any board supported in your local network, like this:

``` bash
./install.sh ota canairio_d1mini_rev414_20190829.bin
```

Also you can specify the IP address:

```bash
./install.sh ota canairio_xxx.bin 192.168.1.10
```

## Via Source Code

The last steps for build and upload a version of CanAirIO firmware are [here](https://github.com/kike-canaries/canairio_firmware#via-platformio-compiling-on-linux-mac-or-windows)


---

If you have any problem uploading the firmware, we have a [Telegram group](https://t.me/canairio) for support, maybe the community can help you. (Spanish/English)


{% include links.html %}
