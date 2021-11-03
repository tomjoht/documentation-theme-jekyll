---
title: Firmware GATT protocol
tags:
  - firmware
  - device
  - bluetooth
  - protocol
keywords: firmware, devel, debugging, bluetooth, GATT, protocol
last_updated: "November 3, 2021"
summary: "CanAirIO firmware Bluetooth protocol"
series: "firmware internals"
sidebar: english_sidebar
permalink: firmware_protocol.html
folder: en
---

# Firmware Configuration

You have for now two alternatives to send the configuration to the device:

## Via Android App

The [current firmware](https://github.com/kike-canaries/canairio_firmware/releases) supports many kinds of payloads for save for example WiFi crendentials, InfluxDb parameters, sensor type and others, via Bluetooth LE using a GATT server implementation. You can use the oficial [CanAirIO Android app](https://github.com/kike-canaries/canairio_android) for send these settings to your device on easy way (with GUI).

## Via nRF Connect App

Also can use [nRF Connect app](https://play.google.com/store/apps/details?id=no.nordicsemi.android.mcp) alternative for send these configurations, but you need configurate the payload following the next steps:


1. Start your sensor with last firmware (rev212)
2. Scan and connect to it with nRF connect App
3. Expand the GATT service item (Unknown Service, ends in aaf3)
4. Click on `upload button` on the `READ,WRITE` characteristic item (ends in ae02)
5. Change value type to `TEXT`
6. on `New Value` write any the next [payloads](#payloads) in `JSON` format.
7. Click on `send` button.
8. (optional) On your serial console your device should be report it.

## Payloads

### WiFi Credentials

For fixed stations and enable the WiFi, you can send the credentials with the next payload:

```json
{"ssid":"YourWifiName","pass":"YourPassword"}
```

### Device name

```json
"{"dname":"PM25_Berlin_Pankow_E04"}"
```

Note: The current device name of all fixed stations of CanAirIO on our server needs a different format. Only use a custom name for your local server or private instance.

### Device sample time

Time into each measure. For now CanAirIO device only supports 5 seconds or more.

```json
"{"stime":10}"
```

### Device type

For UART sensors that is impossible the auto detection, you need select it first before used.

For example, for select a CM1106 sensor, you need send:

```json
"{"stype":5}"
```

**The possible sensors type are**:

| Sensor   | Type |
|---|---|
| Auto  | 0 |
| Panasonic | 1 |
| Sensirion  | 2 |
| SDS011  | 3 |
| Mhz19 | 4 |
| CM1106 | 5 |
| SENSEAIRS8 | 6 |

The last updated list of the current sensors supported and theirs type, are in this [file](https://github.com/kike-canaries/canairio_sensorlib/blob/master/src/Sensors.hpp#L72)


### InfluxDb config

Parameters for fixed stations that will publishing in InfluxDb server.

```json
"{"ifxdb":"","ifxip":"","ifxpt":""}"
```

the fields mean:
- **ifxdb**: InfluxDb database name
- **ifxip**: InflusDb hostname or ip
- **ifxpt**: InfluxDb port number

Example:

```json
{"ifxdb":"canairio","ifxip":"influxdb.canair.io","ifxpt":8086}
```
### Location config

For fixed stations and enable publishing, you need send the coordinates of device, but in the last version of CanAirIO device, is mandatory send a Geohash with precision 7. You can generate it [here](http://geohash.org/) or using any algorith with this standard.

For example:

```json
"{"lat":52.53819,"lon":13.44024,"geo":"u33dcu6chk3"}"
```

## Actions payloads

CanAirIO device have some payloads for controling some behaivors in the device, but you need send it with the mac ID for security reasons. You can read it `wmac` field in the Config GATT characteristic, this service give the current config.

### Wifi Enable

Example of enabling the WiFi radio:

```json
"{"cmd":"wmacId","act":"wst","wenb":true}"
```

### InfluxDb Enable

Example of disabling InfluxDb publishing:

```json
"{"cmd":"wmacId","act":"ist","ienb":false}"
```

### Debug Enable

Example of enabling debug messages in console:

```json
"{"cmd":"wmacId","act":"dst","denb":true}"
```

### I2C Only

Example of enabling only I2C detection:

```json
"{"cmd":"wmacId","act":"i2c","i2conly":true}"
```

### Reboot device

Example of rebooting the device

```json
"{"cmd":"wmacId","act":"rbt"}"
```

### C02 calibration

Example of send calibration command to CO2 sensors

```json
"{"cmd":"wmacId","act":"clb"}"
```

### Clear device

Example of perform factory reset of the device (clear settings)

```json
"{"cmd":"wmacId","act":"cls"}"
```



