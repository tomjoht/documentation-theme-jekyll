---
title: CanAirIO M5Stack
tags:
  - device
  - firmware
  - android
  - hardware
  - anaire
  - co2
  - pm25
keywords: device, fixed stations, mobile station, sensors, hardware, co2, pm25, hardware, M5Stack
last_updated: "February 10, 2022"
summary: "CanAirIO M5Stack devices support"
series: "hardware"
sidebar: english_sidebar
permalink: canairio_m5stack.html
folder: en
---

## Overview

CanAirIO M5Stack contains special support for these kind of boards and devices. We this development we are trying to improve an easy way on the building of mobile and fixed stations for CanAirIO Air Quality network.  

## Advantages

![CanAirIO M5Stack devices](/docs/images/m5_devices_collage.jpg)

Plus the current features of CanAirIO firmware, the M5StickC Plus has the next extra features:

- Dual I2C port (Hat and M5 grove port). You can connect multiple sensors. For example one EnvII hat and three sensors via `grove port` plus `grove hub`
- Compatibility with internal I2C devices, for example in the **M5CoreInk** and **M5StickC Plus**, the internal I2C handled the real time clock and the power unit, the `CanAirIO Sensors Library` works without conflicts swapping this channel with the hat channel for reach three I2C channels at the same time.
- M5Stack has a wonderful feature, 5V output, it reduce the complexity of the DIY creation, because we need 5V for example for particulate meter sensors and old UART devices. In comparasion for example to CanAirIO Bike, it is a improvement on the build work.
- Enclosures and expansion ports. Like we mentioned, M5 has for example DIY box or expansion ports for reduce the complexity in the wiring and the connection.

## Firmware upload

We already have a super easy way for **install CanAirIO** firmware on any compatible ESP32 board like a **M5Stack** boards in a few seconds. A little video demostration: 

[![canairio_m5stickcplus](https://user-images.githubusercontent.com/423856/152767232-81c11957-26f0-4a83-bf63-6a4bee41a168.gif)](https://youtu.be/TdX1AZ4PzBA)  

More info in [canair.io/installer](https://canair.io/installer.html).  Other alternatives for upload the CanAirIO firmware, [here](https://canair.io/docs/firmware_upload.html).

## CanAirIO Sensors Lib only

The next some another M5Stack devices that only have the integration with our sensors library.

### M5CoreInk

[![M5CoreInk Basic Air Quality station](/docs/images/m5_coreink_youtube.jpg)](https://www.youtube.com/watch?v=i15iEF47CbY)  

This a basic air quality station with the possibility to have many sensors. The full source code and documentation [here](https://github.com/hpsaturn/co2_m5coreink)

### M5Atom Lite

In the CanAirIO Sensors lib also is supported this core. Please see the example of the library [here](https://github.com/kike-canaries/canairio_sensorlib/tree/master/examples/m5atom). We are close to have a complete CanAirIO firmware release for this core.

---


{% include links.html %}

