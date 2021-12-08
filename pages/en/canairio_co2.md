---
title: CanAirIO CO2
tags:
  - device
  - firmware
  - android
  - hardware
  - anaire
  - co2
keywords: device, fixed stations, sensors, hardware, co2, hardware
last_updated: "December 8, 2021"
summary: "CanAirIO CO2 device"
series: "hardware"
sidebar: english_sidebar
permalink: canairio_co2.html
folder: en
---

## Overview

CanAirIO CO2 is similar to CanAirIO Bike version, please follow this [guide](https://canair.io/docs/canairio_bike.html) and then you only will need connect your SCD30 Sensirion sensor like a SPS30, via i2c port.  

Also CanAirIO supports other CO2 sensors, like SenseAir S8, Mhz19, CM1106, SCD41, etc, but you could have to change the heigh of the 3D Print box in some cases. Please read the CanAirIO Sensors Library documentation for try to connect a different sensor, here we will show the CO2 version with SCD30 sensor:

## Basic connection

[![CanAirIO CO2 Making of](/docs/images/canairio_co2_video_making.jpg)](https://youtu.be/p9lf5a-bvyI) 

## Improvements (recommended)

[![CanAirIO CO2 Improvements](/docs/images/canairio_co2_improvements.jpg)](https://youtu.be/dLxEbkqWGyo)

## Schematics

![Sensirion SCD30 Schematic](/docs/images/canairio_co2_schematic.jpg)

![Sensirion SCD30 diagram](/docs/images/canairio_co2_sdc30_diagram.jpg)

[Official datasheet ](https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/9.5_CO2/Sensirion_CO2_Sensors_SCD30_Datasheet.pdf)

## Firmware upload

We already have a super easy way for **install CanAirIO** firmware on any compatible **Arduino ESP32 board** like a TTGO T-Display board, (CO2 and bike versions), in a few seconds:

![video_2021-11-13_23-36-10](https://user-images.githubusercontent.com/423856/141661066-0fafcaa9-98b4-419b-b1e7-4371f3cb99b8.gif)  

More info in [canair.io/installer](https://canair.io/installer.html)

Other alternatives for upload the CanAirIO firmware, [here](https://canair.io/docs/firmware_upload.html).


## Cloud configuration

[![CanAirIO CO2 in Anaire ](/docs/images/canairio_co2_cloud_anaire.jpg)](https://youtu.be/29wfMPZXvps) 

## Calibration

[![CanAirIO CO2 Calibration](/docs/images/canairio_co2_calibration.jpg)](https://youtu.be/7FOx7kjxo2s)


{% include links.html %}

