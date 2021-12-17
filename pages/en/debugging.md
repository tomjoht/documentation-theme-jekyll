---
title: Firmware Debugging
tags:
  - firmware
  - device
  - debugging
keywords: firmware, devel, debugging
last_updated: "March 12, 2021"
summary: "CanAirIO firmware debugging"
series: "firmware internals"
sidebar: english_sidebar
permalink: firmware_debugging.html
folder: en
---


## Overview

For see the logs from the device, CanAirIO have logs output via USB serial connection. For connected to it, please follow the next steps:

## Frow CanAirIO Web installer

[CanAirIO Web installer](https://canair.io/installer) has this functionality, you only should choose your board (install button), select your USB, and press the button **LOGS** like this:

![Web installer logs](/docs/images/web_installer_logs.gif)

## From any Linux shell

Run `picocom -b 115200 /dev/ttyUSB0` and then press the reset button of your ESP32 board, you should have something like this:

```cpp
19:05:08.081 > == CanAirIO Setup ==
19:05:08.083 > 
19:05:08.541 > -->[OGUI] display config ready.
19:05:08.836 > -->[INFO] ESP32MAC:	24:0A:C4:06:F5:C6
19:05:08.841 > -->[INFO] Hostname:	CanAirIO5C6
19:05:08.843 > -->[INFO] Revision:	r877
19:05:08.846 > -->[INFO] Firmware:	0.5.0
19:05:08.848 > -->[INFO] Flavor  :	WEMOSOLED
19:05:08.851 > -->[INFO] Target  :	prod
19:05:08.853 > -->[INFO] Detecting sensors:
19:05:08.856 > -->[INFO] Sensorslib version	: 0.4.2
19:05:08.859 > -->[INFO] enable sensor GPIO	: 27
19:05:08.862 > -->[INFO] config UART sensor	: 0
19:05:09.101 > -->[SLIB] new sample time	: 1
19:05:09.104 > -->[SLIB] temperature offset	: 0.00
19:05:09.107 > -->[SLIB] altitude offset   	: 0.00
19:05:09.110 > -->[SLIB] only i2c sensors  	: 1
19:05:09.650 > -->[INFO] Detection sensors FAIL!
19:05:09.898 > -->[WDOG] watchdog config to check each 120 seconds.
19:05:09.903 > -->[INFO] InfluxDb	: disabled
19:05:09.906 > -->[INFO] WiFi    	: disabled
19:05:11.128 > -->[BTLE] GATT server ready. (Waiting for client)
19:05:16.214 > -->[SLIB] new sample time	: 5
19:05:16.255 > -->[WIFI] started PAX counter sniffer ;)
```

For example in this output you don't have any sensor connected but the **PAX Counter** was enable

## Increased verbose output

For try to have more logs and more information of your CanAirIO device, please enable the **debug mode** in your CanAirIO App, in `->settings->mobile station->enable debug mode switch`.

## Advanced debug level

For increase more the verbose output and have the output from the internals of the ESP32 core, you need rebuild the firmware with the `CORE_DEBUG_LEVEL` in 4 for example. You can change it in the `platformio.ini` file in the [source code](https://github.com/kike-canaries/canairio_firmware/blob/master/platformio.ini#L25).



{% include links.html %}

