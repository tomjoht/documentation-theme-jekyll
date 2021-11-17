---
title: CanAirIO SensorsLib
tags:
  - firmware
  - device
  - hardware
keywords: firmware, hardware
last_updated: "July 5, 2021"
summary: "CanAirIO multi sensors library"
series: "hardware"
sidebar: english_sidebar
permalink: sensorlib.html
folder: en
---

[![PlatformIO](https://github.com/kike-canaries/canairio_sensorlib/workflows/PlatformIO/badge.svg)](https://github.com/kike-canaries/canairio_sensorlib/actions/) [![Build Status](https://travis-ci.com/kike-canaries/canairio_sensorlib.svg?branch=master)](https://travis-ci.com/kike-canaries/canairio_sensorlib.svg?branch=master) ![ViewCount](https://views.whatilearened.today/views/github/kike-canaries/canairio_sensorlib.svg) 

## CanAirIO Air Quality Sensors Library

Particle meter (PM) sensor manager for multiple (PM) sensors: Honeywell, Plantower, Panasonic, Sensirion, etc and CO2 sensors. Also it handling others environment sensors.

For more details of this documentation please visit the [repository](https://github.com/kike-canaries/canairio_sensorlib#readme).

## Supported sensors

### PM sensors

| Sensor model  | UART  | I2C  | Detection mode | Status |  
|:----------------------- |:-----:|:-----:|:-------:|:----------:|
| Honeywell HPMA115S0 | Yes | --- | Auto | DEPRECATED |
| Panasonic SN-GCJA5L | Yes | Yes | Auto | STABLE |
| Plantower models    | Yes | --- | Auto | STABLE |
| Nova SDS011         | Yes | --- | Auto | STABLE |
| Sensirion SPS30     | Yes | Yes | Select / Auto | STABLE |

NOTE: Panasonic via UART in ESP8266 maybe needs select in detection

### CO2 sensors

| Sensor model  | UART  | i2c  | Detection mode | Status |  
|:----------------------- |:-----:|:-----:|:-------:|:----------:|
| Sensirion SCD30    | --- | Yes | Auto | STABLE |
| Sensirion SCD4x    | --- | Yes | Auto | TESTING |
| MHZ19      | Yes | --- | Select | STABLE |
| CM1106    | Yes | --- | Select | STABLE |
| SenseAir S8 | Yes | --- | Select | STABLE |


### Environmental sensors

| Sensor model  | Protocol  | Detection mode | Status |  
|:----------------------- |:-----:|:-------:|:----------:|
| AM2320      | i2c |  Auto | STABLE |
| SHT31       | i2c |  Auto | STABLE |
| AHT10       | i2c |  Auto | STABLE |
| BME280      | i2c |  Auto | STABLE |
| BME680      | i2c |  Auto | STABLE |
| DHTxx       | TwoWire |  Auto | DEPRECATED |

NOTE: DHT22 is supported but is not recommended

## Features

- Unified variables for all sensors 
- Auto UART port selection (Hw, Sw, UART1, UART2, etc)
- Multiple i2c reads and one UART sensor read support
- Preselected main stream UART pins from popular boards
- Auto config UART port for Plantower, Honeywell and Panasonic sensors
- Unified calibration trigger for all CO2 sensors
- Unified CO2 Altitude compensation
- Unified temperature offset for CO2 and environment sensors
- Public access to main objects of each library (full methods access)
- Basic debug mode support toggle in execution
- Basic power saving management with sample time > 30s on SPS30  

Full list of all sub libraries supported [here](https://github.com/kike-canaries/canairio_sensorlib/blob/master/library.json#L72-L89)


## Quick implementation

```java
sensors.setOnDataCallBack(&onSensorDataOk);   // all data read callback
sensors.init();                               // start all sensors and
                                              // try to detect UART sensors like:
                                              // Panasonic, Honeywell or Plantower.
                                              // For special UART sensors try select it:
                                              // init(sensors.Sensirion)
                                              // init(sensors.Mhz19)
                                              // init(sensors.CM1106)
                                              // init(sensors.SENSEAIRS8)
                                              // For I2C sensors, with empty parameter is enough.
```

## Full implementation

You can review a full implementation on [CanAirIO project firmware](https://github.com/kike-canaries/canairio_firmware/blob/master/src/main.cpp), but a little brief is the next:

```java
/// sensors data callback
void onSensorDataOk() {
    Serial.print  (" PM1.0: " + sensors.getStringPM1());  // some fields sample
    Serial.print  (" PM2.5: " + sensors.getStringPM25());
    Serial.println(" PM10: "  + sensors.getStringPM10());
    Serial.println(" CO2:  "  + sensors.getStringCO2());
}

/// sensors error callback
void onSensorDataError(const char * msg){
    Serial.println(msg);
}

void setup() {

    sensors.setOnDataCallBack(&onSensorDataOk);     // all data read callback
    sensors.setOnErrorCallBack(&onSensorDataError); // [optional] error callback
    sensors.setSampleTime(15);                      // [optional] sensors sample time (default 5s)
    sensors.setTempOffset(cfg.toffset);             // [optional] temperature compensation
    sensors.setCO2AltitudeOffset(cfg.altoffset);    // [optional] CO2 altitude compensation
    sensors.setDebugMode(false);                    // [optional] debug mode enable/disable
    sensors.detectI2COnly(true);                    // [optional] force to only i2c sensors
    sensors.init();                                 // start all sensors with auto detection mode.
                                                    // Also you can try to select one:
                                                    // sensors.init(sensors.Sensirion);
                                                    // All i2c sensors are autodetected.

    // Also you can access to sub library objects, and perform for example calls like next:

    // sensors.sps30.sleep()
    // sensors.bme.readPressure();
    // sensors.mhz19.getRange();
    // sensors.scd30.getTemperatureOffset();
    // sensors.aht10.readRawData();
    // sensors.s8.set_ABC_period(period)
    // ...


    if(sensors.isPmSensorConfigured())
        Serial.println("-->[SETUP] Sensor configured: " + sensors.getPmDeviceSelected());

    delay(500);
}

void loop() {
    sensors.loop();  // read sensor data and showed it
}
```

### Output

On your serial monitor you should have something like that:

```bash
-->[SETUP] Detecting sensors..
-->[SETUP] Sensor configured: SENSIRION
-->[MAIN] PM1.0: 002 PM2.5: 004 PM10: 006
-->[MAIN] PM1.0: 002 PM2.5: 002 PM10: 002
-->[MAIN] PM1.0: 002 PM2.5: 002 PM10: 002
```

### Examples

For more implementation examples, please visit the [repository section](https://github.com/kike-canaries/canairio_sensorlib#examples).

## Demo

[![CanAirIO auto configuration demo](https://img.youtube.com/vi/hmukAmG5Eec/0.jpg)](https://www.youtube.com/watch?v=hmukAmG5Eec)

CanAirIO sensorlib auto configuration demo on [Youtube](https://www.youtube.com/watch?v=hmukAmG5Eec)


## Wiring

The current version of library supports 3 kinds of wiring connection, UART, i2c and TwoWire, in the main boards the library using the defaults pins of each board, but in some special cases the pins are:

### UART

The library has [pre-defined some UART pin configs](https://github.com/kike-canaries/canairio_sensorlib/blob/master/src/Sensors.hpp#L19-L52), these are selected on compiling time. Maybe you don't need change anything with your board.  

Also you can define the UART pins in the init() method, please see below.  

### Custom UART RX/TX:

You can pass the custom pins if it isn't autodected:

```cpp
sensors.init(sensors.Auto,RX,TX); // custom RX, custom TX pines.
```

### I2C (recommended)

We are using the default pins for each board, some times it's pins are 21,22, please check your board schematic.

### TwoWire (deprecated soon)

For now we are using it only for DHT sensors in PIN 23. For more info please review the next lines [here](https://github.com/kike-canaries/canairio_sensorlib/blob/master/src/Sensors.hpp#L19-L52).


---

For more details of this documentation please visit the [repository](https://github.com/kike-canaries/canairio_sensorlib#readme).


