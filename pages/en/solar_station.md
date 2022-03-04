---
title: CanAirIO Solar Station
tags:
  - firmware
  - device
  - hardware
keywords: firmware, hardware, low energy, eco-mode, solar, solar station
last_updated: "March 4, 2022"
summary: "CanAirIO Solar Station"
series: "hardware"
sidebar: english_sidebar
permalink: solar_station.html
folder: en
---


## Overview

CanAirIO now have power saving settings thanks to the collaboration and feedback from the community. With these modes and the addition of minimal hardware we could have a solar station.

## Power saving settings

<p align="center"><img src="images/solar_station_settings.jpg" width="480" style="margin: auto; text-align: center;" ></p>

### Sleep time mode  

With this mode enable, it only suspend the sensors each `sleep time` seconds. The screen, WiFi and Bluetoot will still on.  

### Eco mode

Or solar mode. With this mode enable, the complete device is suspended each `sleep time` seconds.  
This mode only will be enter on operation when you leave the Android app (Bluetooth disconnection).  
If you want reconnected to the device, maybe the more easy way is: `unpair -> scan -> wait for that the device appears again -> connect to it`.  

## Schematic

<a href="https://canair.io/docs/pdf/schematic_canairio_solar_station.pdf" target="_blank"><img src="images/solar_station_schematics.jpg" width="480" ></a>

Design and image credits by [@Roberbike](https://github.com/roberbike)

## 3DPrint models

[GCJA5 air input box](https://github.com/kike-canaries/canairio_firmware/blob/master/box/solar_station_GCJA5/GCJA5_outdoor_input_case.stl)

<a href="" target="_blank"><img src="images/solar_station_GCJA5_collage.jpg" width="512" ></a>

## Photos

<a href="" target="_blank"><img src="images/solar_station_photo_collage.jpg" width="512" ></a>


## Thanks to

Special thank to [@Roberbike](https://github.com/roberbike) for the collaboration of this version of CanAirIO.


## Disclaimer

For review our disclaimer, policy privacy and warranty of CanAirIO devices. please enter [here](https://canair.io/docs/disclaimer.html)


{% include links.html %}

