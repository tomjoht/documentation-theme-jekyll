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

CanAirIO Bike try to motivate collaboration from cyclists or people that use it to have mobile tracks of air quality. We have two new device versions, CanAirIO bike with PM2.5 sensors (Sensirion SPS30) and CanAirIO CO2 (Sensirion SCD30), the latter for sensing the right ventilation in indoors to reduce COVID-19 risk.

## Features

These devices able to work in standalone mode without clouds, apps, Bluetooth, WiFi, etc. but also you could have the next features:

- Citizen Science community
- CanAirIO is Open-Source / Open-Design / Open-Access

### Mobile station features

- Two modes: mobile (Bluetooth) or fixed station (WiFi)
- Two device faces: Air quality or Bike mode screens for now.
- Some built-in functions: Brightness, AQI graph, sample time, Wifi On/Off, calibration, etc.

### Fixed station features

- CanAirIO cloud alternative : Basic remote dashboard and database
- Custom InfluxDb alternative: Store all data in your own instance
- MQTT clouds (coming soon)
- Sensor Community and other open clouds (coming soon)

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
| | |
| CPU | ESP32 Espressif | ESP32 Espressif |
|     | 240MHz Xtensa® Dual core |  240MHz Xtensa® Dual core |
| Flash              | 16Mb            | 16Mb           |
| WiFi               | Yes  | Yes |
|                    | 802.11 b/g/n | 802.11 b/g/n |
| Bluetooth          | Yes | Yes |
|                    | v4.2 BLE standard | v4.2 BLE standard |
| Battery            | 650mAh ~ >=4h     | 650mAh >= 10h |
| | |

[1]:https://www.aliexpress.com/item/33048962331.html
[2]:https://www.sensirion.com/en/environmental-sensors/particulate-matter-sensors-pm25/
[3]:https://www.sensirion.com/en/environmental-sensors/carbon-dioxide-sensors/carbon-dioxide-sensors-scd30/
[4]:https://www.mouser.de/datasheet/2/737/AM2320-1313931.pdf


## Building Guide

[![Youtube Making Of CanAirIO Bike ](http://img.youtube.com/vi/V2eO1UN5u7Y/0.jpg)](https://youtu.be/V2eO1UN5u7Y "Youtube CanAirIO basic loader guide")

## Schematics

![CanAirIO Bike Schematics](images/canairio_bike_schematics_grid.jpg)





{% include links.html %}

