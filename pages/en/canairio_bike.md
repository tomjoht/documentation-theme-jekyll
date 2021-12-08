---
title: CanAirIO Bike
tags:
  - firmware
  - device
  - hardware
keywords: firmware, hardware
last_updated: "June 14, 2021"
summary: "CanAirIO Bike Device"
series: "hardware"
sidebar: english_sidebar
permalink: canairio_bike.html
folder: en
---

![CanAirIO Bike](images/canairio_bike_header.jpg)

## Overview

CanAirIO Bike try to motivate collaboration from cyclists or people that use it to have mobile tracks of air quality. We have two new device versions, CanAirIO bike with PM2.5 sensors (Sensirion SPS30) and [CanAirIO CO2](https://canair.io/docs/canairio_co2.html) (Sensirion SCD30), the latter for sensing the right ventilation in indoors or into the public transportation to reduce COVID-19 risk.  

Also CanAirIO firmware supports [more sensors](https://github.com/kike-canaries/canairio_sensorlib#readme) if you want make a different variant.

## Features

These devices able to work in standalone mode without clouds, apps, Bluetooth, WiFi, etc. but also you could have the next features:

- Citizen Science community
- CanAirIO is Open-Source / Open-Design / Open-Access
- Two modes: mobile (Bluetooth) or fixed station (WiFi)
- AQI graph with colors for PM and CO2 values
- Standard Bluetooth low energy device (GATT)
- Automatic remote firmware updates
- Two action buttons with some shortcuts
- Good quiescent current ~173uA
- USB Type C interface (support charging on power off)

### Mobile station features

- GPS data tagging via CanAirIO app using Bluetooth Low Energy
- PAX Counter capability (it counts the persons around you)
- Two device faces: Air quality or Bike mode screens for now.
- Some built-in functions: Brightness, AQI graph, sample time, Wifi On/Off, calibration, etc.

### Fixed station features

- CanAirIO cloud alternative : Basic remote dashboard and database
- Custom InfluxDb alternative: Store all data in your own instance
- MQTT clouds (coming soon)
- Sensor Community and other open clouds (coming soon)


## Building Guide

<a href="https://youtu.be/V2eO1UN5u7Y" target="_blank" style="padding-left: 20px" ><img src="images/canairio_bike_make_of_youtube.jpg" width="480" ></a>

## Soldering improvements

<a href="https://youtu.be/Oarq0K0Sz3c" target="_blank" style="padding-left: 20px" ><img src="images/canairio_bike_soldering_on_youtube.jpg" width="480" ></a>

## Components

Main parts that you need are the next, but maybe you could have this components in different shops.

| Part Ref   | Quantaty | Shop |
|:-------- |:-------------:|:---------------:| 
| TTGO T-Display | 1 | [Aliexpress](https://www.aliexpress.com/item/33048962331.html), [Amazon](https://www.amazon.de/gp/product/B07WTNCWLW/ref=ppx_yo_dt_b_asin_title_o04_s00?ie=UTF8&psc=1) |
| Sensirion SPS30 | 1 | [Aliexpress](https://www.aliexpress.com/item/1005002017660217.html), [Mouser](https://www.mouser.de/ProductDetail/403-SPS30) * |
|AM2320| 1 | [Mouser](https://www.mouser.de/ProductDetail/485-3721) |
| M2 screws box ** | 1 | [Amazon](https://www.amazon.de/gp/product/B07SGP8TWS/ref=ppx_yo_dt_b_asin_title_o07_s01?ie=UTF8&psc=1) |
| Step Up DC-DC to 5v | 1 | [Aliexpress](https://www.aliexpress.com/item/32963598972.html) |
| Battery 650-800 mAh 3.7v *** | 1 | [Aliexpress](https://www.aliexpress.com/item/4001065181282.html) |
| Magnets box (optional) | 1 | [Amazon](https://www.amazon.de/gp/product/B00TACFTAA/ref=ppx_yo_dt_b_asin_title_o04_s00?ie=UTF8&psc=1) |
| Heat shrink box (optional) | 1 | [Aliexpress](https://www.aliexpress.com/item/32843983164.html) |

**Notes**:

- The SPS30 in Mouser, needs buy the cable independent [1](https://www.mouser.de/ProductDetail/538-87439-0501),[2](https://www.mouser.de/ProductDetail/538-79758-0016).  
- Screws M2x4(4), M2x5(8), M2x6(2), M2x7(2).  
- Similar battery, same voltage, similar capacity but with dimensions max: 48x30x6 mm.  

## 3D Printer box

Please enter [here](https://www.thingiverse.com/thing:4886061) for details and follow some instructions, but:

** ***************** **
** W A R N N I N G **

The full updated and last versions for all box versions, are in the [official repository](https://github.com/kike-canaries/canairio_firmware/tree/master/box) because it is more easy for handling the versions than Thingiverse. This page it is only a guide.

** ***************** **

![CanAirIO Bike 3D printer files](images/canairio_bike_3dprint_models.jpg)


## Instructions

[![CanAirIO Instructions](images/canairio_bike_instructions_display.jpg)](https://hackaday.io/project/179753/instructions)

Complete list of steps and instructions [here](https://hackaday.io/project/179753/instructions).


## Schematics

![CanAirIO Bike Schematics](images/canairio_bike_schematics_grid.jpg)

Please note that it is a general diagram, for details of pin connections please review the datasheet of each component. For example the next diagrams:

### SPS30 pinout diagram

![CanAirIO Bike Schematics](images/canairio_bike_schematics_sps30.jpg)

### AM2320 pinout diagram

![CanAirIO Bike Schematics](images/canairio_bike_schematics_am2320.jpg)


## Firmware Upload

We already have a super easy way for **install CanAirIO** firmware on any compatible **Arduino ESP32 board** like a TTGO T-Display board, (CO2 and bike versions), in a few seconds:

![video_2021-11-13_23-36-10](https://user-images.githubusercontent.com/423856/141661066-0fafcaa9-98b4-419b-b1e7-4371f3cb99b8.gif)  

More info in [canair.io/installer](https://canair.io/installer.html)

Other alternatives for upload the CanAirIO firmware, [here](https://canair.io/docs/firmware_upload.html).

## Quick start guide

![CanAirIO Bike Quick Start](images/canairio_bike_quick_start.jpg)

## Specifications

| Specs    | CanAirIO Bike | CanAirIO CO2 |
|:-------- |:-------------:|:---------------:| 
| Main board | [TTGO T-Display][1]     | [TTGO T-Display][1] |
| Air quality sensor | [Sensirion SPS30 (PM)][2] | [Sensirion SCD30 (CO2)][3] |
| Environment sensor | [AM2320 T&H][4] | [SCD30 T&H][3] |
| Auto calibration   | Factory | Manual |
| Sensors Units      | PM (1.0,2.5,10 mg/u³),°C,%RH | CO2 (PPM),°C, %RH |
| Track Units        | Kms, HH:MM:SS | Kms, HH:MM:SS |
| Firmware updates   | OTA / remote  | OTA / remote |
| CanAirIO Cloud     | Included      | Included     |
| Recommended on     | Outdoor**/ Indoor | Indoor |
| Dimmensions        | 57x24x101 (mm) | 57x20x87 (mm) |
| Weight             | 95g | 52g |
| CPU | ESP32 Espressif | ESP32 Espressif |
|     | 240MHz Xtensa® Dual core |  240MHz Xtensa® Dual core |
| Flash              | 16Mb            | 16Mb           |
| WiFi               | Yes  | Yes |
|                    | 802.11 b/g/n | 802.11 b/g/n |
| Bluetooth          | Yes | Yes |
|                    | v4.2 BLE standard | v4.2 BLE standard |
| Battery            | 650mAh ~ >=4h     | 650mAh >= 10h |

[1]:https://www.aliexpress.com/item/33048962331.html
[2]:https://www.sensirion.com/en/environmental-sensors/particulate-matter-sensors-pm25/
[3]:https://www.sensirion.com/en/environmental-sensors/carbon-dioxide-sensors/carbon-dioxide-sensors-scd30/
[4]:https://www.mouser.de/datasheet/2/737/AM2320-1313931.pdf


## Disclaimer

For review our disclaimer, policy privacy and warranty of CanAirIO Bike device. please enter [here](https://canair.io/docs/disclaimer.html)


{% include links.html %}

