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

CanAirIO now have power saving settings thanks to the collaboration and feedback from the community. With these modes and the addition of minimal hardware we could have a solar station. Please note that the current status of this solution is **testing** but we have two stations working well.

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

## Components

Main parts that you need are the next, but maybe you could have this components in different shops.

| Part Ref   | Quantaty | Shop |
|:-------- |:-------------:|:---------------:| 
| Solar panel 5W or 10W or similar * | 1 | [Amazon](https://amzn.to/3HHtbRl) |
| Solar controller | 1 | [Aliexpress](https://www.aliexpress.com/item/32779467674.html) |
| Sensirion SPS30 or GCJA-5 I2C sensor **| 1 | [Aliexpress](https://www.aliexpress.com/item/1005002017660217.html), [Mouser](https://www.mouser.de/ProductDetail/403-SPS30) |
|AM2320 or similar I2C sensor| 1 | [Mouser](https://www.mouser.de/ProductDetail/485-3721) |
| Step Up DC-DC to 5v with **enable** | 1 | [Aliexpress](https://www.aliexpress.com/item/32963598972.html) |
| Battery 650-800 mAh 3.7v or bigger *** | 1 | [Aliexpress](https://www.aliexpress.com/item/4001065181282.html) |

\* Maybe for some zones on the earth with 5W it is enough but maybe 10W will be works fine on all places  
** is possible a different sensors via UART for example Plantower sensors  
*** With more capacity maybe it works fine on weeks without any sun radiation


## Tested boards

We are testing some comercial and cheapers boards, for example the TTGO T7 v1.5 its a good board because you only need remove the power LED to have a good performance.

| Board  	| Firmware rev  	| A (Deep sleep)  	| A (Execution)  	| A (pico)
|---	|---	|:---:	|:---:|:---:	|
| TTGO TDisplay  	    | rev940 (Solar) | 179uA   	| ~160mA  	| 280mA |
| TTGO TDisplay  	    | rev877 (Prod)  | 180uA  	| ~240mA  	| 300mA |
| TTGO TDisplay  	    | rev882 (Dev)   | 183uA  	| ~240mA   	| 340mA |
| ESP32 WROOM-32  	    | rev940 (Solar) | 56uA   	| ~70mA   	| 110mA |
| TTGO T7 v1.3  	    | rev940 (Solar) | 5mA  	| ~80mA   	| 110mA |
| TTGO T7 v1.3 No-LED   | rev940 (Solar) | 4.7mA  	| ~80mA   	| 330mA |
| TTGO T7 v1.5 No-LED  	| rev906 (dev) | 135uA  	| ~80mA  	| 110mA |
| TTGO T-OI PLUS No-LED | rev906 (dev) | 22uA |   ~80mA | 110maA |
| ESP32F                | rev906 (dev)	|11uA	|50-60 mA|180 mA	|
| M5STACK STAMP PICO  | rev906 (dev)	|474uA	|60-80 mA|140 mA	|

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

