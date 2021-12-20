---
title: Sensores
tags: [device_manual]
keywords: manual, sensores , canairio, user, PM2.5, CO2
last_updated: May 31, 2021
summary: "Sensores usados en CanAirIO "
sidebar: spanish_sidebar
permalink: sensors_es.html 
folder: es
---

| IMAGEN           | MARCA SENSOR     | DESCRIPCION     |
| ---------------- |:----------------:| -----------|
|**Material Particulado PM2.5:**|
| ![Sensirion SPS30 sensor](/docs/images/sensors_sps30.jpg)|Sensirion SPS30|1) VDD ---> Salida de 5V del elevador<br>2) SDA ---> Pin 21 ESP32<br>3) SCL ---> Pin 22 ESP32<br>4) SEL ---> GND<br>5) GND ---> GND del elevador|
|![Panasonic sensor](/docs/images/sensors_panasonic.jpg)|Panasonic SN-GCJA5|1) TX ---> Pin 17 ESP32<br>2) SDA ---> X<br>3) SCL ---> X<br>4) GND ---> GND del elevador<br>5) VDD ---> Salida de 5V del elevador|
|![Plantower sensor](/docs/images/sensors_plantower.jpg)|Plantower PMS7003 - PMSA003|1) VCC ---> Salida de 5V del elevador<br>3) GND ---> GND del elevador<br>9) TX ---> Pin 7 ESP32|
|![Honeywell sensor](/docs/images/sensors_honeywell.jpg)|Honeywell HPMA115S0|Eliminado de las guías y uso no recomendado por mal funcionamiento|
|![SDS011 sensor](/docs/images/sensors_sds011.jpg)|Nova SDS011|3) VCC ---> Salida de 5V del elevador<br>5) GND ---> GND del elevador<br>7) TX ---> Pin 7 ESP32|
||
|**Gas carbónico:**|
| ![SCD30 sensor](/docs/images/sensors_scd30.jpg)|Sensirion SCD30|5V - 3.3V ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>GND ---> GND<br>SCL ---> Pin 22 ESP32<br>SDA ---> Pin 21 ESP32<br>|
| ![SenseAir sensor](/docs/images/sensors_senseair_s8.jpg)|SenseAir S8|5V ---> Salida de 5V del elevador<br>GND ---> GND<br>RX ---> Pin 16 ESP32<br>TX ---> Pin 17 ESP32|
| ![Cubic sensor](/docs/images/sensors_cubic.jpg)|Cubic CM1106|5V ---> Salida de 5V del elevador<br>GND ---> GND<br>RX ---> Pin 16 ESP32<br>TX ---> Pin 17 ESP32|
| ![MHZ19 sensor](/docs/images/sensors_mhz19.jpg)|Winsen MHZ19|5V ---> Salida de 5V del elevador<br>GND ---> GND<br>RX ---> Pin 16 ESP32<br>TX ---> Pin 17 ESP32|
|![MHZ14 sensor](/docs/images/sensors_mhz14.jpg)|Winsen MHZ14|RX ---> Pin 16 ESP32<br>TX ---> Pin 17 ESP32<br>5V ---> Salida de 5V del elevador<br>GND ---> GND|
||
|**Humedad y Temperatura:**|
| ![SHT31 sensor](/docs/images/sensors_sht31.jpg)|Sensirion SHT31|VIN ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>GND ---> GND<br>SCL ---> Pin 22 ESP32<br>SDA ---> Pin 21 ESP32|
| ![AM2320 sensor](/docs/images/sensors_am2320.jpg)|Asair AM2320|VDD ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>SDA ---> Pin 21 ESP32<br>GND ---> GND<br>SCL ---> Pin 22 ESP32|
| ![BME280 sensor](/docs/images/sensors_bme280.jpg)|Bosch BME280|VIN ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>GND ---> GND<br>SCL ---> Pin 22 ESP32<br>SDA ---> Pin 21 ESP32|
| ![BME680 sensor](/docs/images/sensors_bme680.jpg)|Bosch BME680|VCC ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>GND ---> GND<br>SCL ---> Pin 22 ESP32<br>SDA ---> Pin 21 ESP32<br>SDO ---> X<br>CS ---> X|
| ![AHT10 sensor](/docs/images/sensors_aht10.jpg)|Asair AHT10|VIN ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>GND ---> GND<br>SCL ---> Pin 22 ESP32<br>SDA ---> Pin 21 ESP32|
| ![DHT22 sensor](/docs/images/sensors_dht22.jpg)|Asair DHT22|VCC ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>DATA ---> Pin 23 ESP32<br>NC ---> X<br>GND---> GND|
| ![DHT11 sensor](/docs/images/sensors_dht11.jpg)|Asair DHT11|VCC ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>DATA ---> Pin 23 ESP32<br>NC ---> X<br>GND---> GND|
