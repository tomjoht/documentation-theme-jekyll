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

We have different methods for upload the CanAirIO firmware. In order to complexity, these are:

- Via CanAirIO Loader (Linux, Windows, MacOSX and Android)
- Via Espressif Uploader (Only works on Windows)
- Via CanAirIO Installer (Linux and MacOSX)
- Via Source Code - Compiling with PlatformIO (Linux, Windows and MacOSX)

## CanAirIO Loader

With this method you will able to upload the latest version of [CanAir.IO firmware](https://github.com/kike-canaries/canairio_firmware#canairio-firmware)
automatically via a simple Arduino sketch.

You can run it from your **Arduino IDE** or from your **Android** phone
using [ArduinoDroid](https://play.google.com/store/apps/details?id=name.antonsmirnov.android.arduinodroid2&hl=en&gl=US)
app (**recommended**) with a simple **OTG** cable connected to your board. (see the video below)

### Steps

1. [Install Arduino IDE](https://www.youtube.com/watch?v=wNtGHCrO7E4) or [Arduino Droid app](https://play.google.com/store/apps/details?id=name.antonsmirnov.android.arduinodroid2&hl=en&gl=US)
2. Install the Arduino Json Library v6.x from ther Library Manager
3. Configure your board: ESP32 Dev Module or similar board
4. Select partion schema to **minimal** ([OTA with 1.9Mb to app 190kbs to SPIFFS](https://codeblog.dotsandbrackets.com/arduino-cli-partition-scheme/))
5. Configure your WiFi credentials in the sketch
6. Build and upload, wait for, the last version of CanAirIO will be installed
7. (optional) see the progress on Serial console or monitor.
8. Android app guide for using the device like a [mobile or fixed air quality station](https://github.com/kike-canaries/canairio_firmware/blob/master/README.md#android-canairio-app)

### Video demo

[![Youtube CanAirIO basic loader guide](http://img.youtube.com/vi/FjfGdnTk-rc/0.jpg)](http://www.youtube.com/watch?v=FjfGdnTk-rc "Youtube CanAirIO basic loader guide")

### Troubleshooting

#### Not happen anything after upload

Please view the output messages in the serial monitor, maybe you have internet connection issues, for that:

- Wait for complete upload firmware (i.e 100%)
- Enter to serial monitor (button on top right)
- Press and hold the reset button 
- The serial output in Arduino Droid app for example is similar like this:

![serial monitor output example](images/troubleshooting00.jpg)

- The output in Arduino IDE monitor is the same.

#### When I try to compile have errors

For example if you have the next error:

![serial monitor output example](images/troubleshooting01.jpg)

```cpp
loader (1).ino:53:5: error: redefinition of 'int_payloadVersion'
```

maybe you have two or more files open in the IDE, please review the opened tabs:

![serial monitor output example](images/troubleshooting02.jpg)


## Espressif Uploader

This option not need compiling the binaries, you can download the pre-built binaries from our Github in the section releases, and please follow the next steps:

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


{% include links.html %}
