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

**WARNNING**: The current guide is deprecated!

## Starting console log

`picocom -b 115200 /dev/ttyUSB0`

```bash
-->[HPMA] read > done! PM10:010 E08 [S13235] PM2.5:P009
-->[HPMA] read > done! PM10:009 E08 [S13236] PM2.5:P008
-->[AM2320] Humidity: 0.00 % Temp: 0.00 °C
-->[API] writing to canairio.herokuapp.com..done. [201]
-->[STATUS] 10001101
```


## Device status vector

The current flags status is represented on one byte and it is returned on config:

``` java
bit_sensor  = 0;    // sensor fail/ok
bit_paired  = 1;    // bluetooth paired
bit_wan     = 2;    // internet access
bit_cloud   = 3;    // publish cloud
bit_code0   = 4;    // code bit 0
bit_code1   = 5;    // code bit 1
bit_code2   = 6;    // code bit 2
bit_code3   = 7;    // code bit 3

```

The error codes are represented on up four bits. Error code table:

``` java
ecode_sensor_ok          =   0;
ecode_sensor_read_fail   =   1;
ecode_sensor_timeout     =   2;
ecode_wifi_fail          =   3;
ecode_ifdb_write_fail    =   4;
ecode_ifdb_dns_fail      =   5;
ecode_json_parser_error  =   6;
ecode_invalid_config     =   7;
ecode_api_write_fail     =   8;
```

sample:

``` java
    00000011 -> sensor ok, device paired
    00001101 -> sensor ok, wan ok, ifxdb cloud ok
    01000101 -> sensor ok, wan ok, ifxdb write fail
```


{% include links.html %}

