---
title: Firmware GATT protocol
tags:
  - firmware
  - device
  - bluetooth
  - protocol
keywords: firmware, devel, debugging, bluetooth, GATT, protocol
last_updated: "March 12, 2021"
summary: "CanAirIO firmware Bluetooth protocol"
series: "firmware internals"
sidebar: english_sidebar
permalink: firmware_protocol.html
folder: en
---

# Firmware Configuration

## Via Android App

The [current firmware](https://github.com/kike-canaries/esp32-hpma115s0/releases) supports setup WiFi crendentials, CanAirIO API or InfluxDb configs via Bluetooth for static statations. You can use the oficial [CanAirIO Android app](https://github.com/kike-canaries/android-hpma115s0) for send these settings to your device.

## Via nRF Connect App

Also can use [nRF Connect app](https://play.google.com/store/apps/details?id=no.nordicsemi.android.mcp) alternative for send configurations

### Protocols via nRF Connect App

#### WiFi Credentials

1. Start your sensor with last firmware (rev212)
2. Scan and connect to it with nRF connect App
3. Expand the GATT service item (Unknown Service, ends in aaf3)
4. Click on `upload button` on the `READ,WRITE` characteristic item (ends in ae02)
5. Change value type to `TEXT`
6. Put your credentials on `New Value` field, i.e. like this:
    ```json
    {"ssid":"YourWifiName","pass":"YourPassword"}
    ```
7. Click on `send` button.
8. On your serial messages your sensor will be log succesuful connection or on your display the wifi icon will be enable.

#### Device name (station name)

Repeat previous steps `1 to 6` but the payload for `dname` connection is for example:

```json
"{"dname":"PM25_Berlin_Pankow_E04"}"
```

#### CanAirIO API credentials

Repeat previous steps `1 to 6` and send the next payload with your credentials:

```json
"{"apiusr":"username","apipss":"password"}"
```

#### InfluxDb config

Repeat previous steps `1 to 6` but the payload for `InfluxDb` connection is:

```json
"{"ifxdb":"","ifxip":"","ifxtg":""}"
```

the fields mean:
- **ifxdb**: InfluxDb database name
- **ifxip**: InflusDb hostname or ip
- **ifxtg**: Custom tags **(optional)**

##### Example:

```json
{"ifxdb":"database_name","ifxip":"hostname_or_ip","ifxtg":"zone=north,zone=south"}
```
#### Location config

Repeat previous steps `1 to 6` but the payload for `sensor location` for example is:

```json
"{"lat":52.53819,"lon":13.44024,"alt":220,"spd":34.5}"
```

#### InfluxDb payload

The current version send the next variables to InfluxDb:

```
pm25","pm10,"hum","tmp","lat","lng","alt","spd","stime"
```
- **pm25 and pm10**, from Honeywell sensor (is a average of `stime` samples)
- **hum and tmp**, humidity and temperature if you connect AM2320 to your ESP32
- **lat, lng, alt, spd**, variables that you already configured

