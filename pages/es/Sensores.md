---
title: Sensores
tags: [device_manual]
keywords: manual, sensores , canairio, user, PM2.5, CO2
last_updated: May 31, 2021
summary: "opciones de sensor en CanAirIO "
sidebar: spanish_sidebar
permalink: 
folder: es
---

| IMAGEN           | MARCA SENSOR     | DESCRIPCION     |
| ---------------- |:----------------:| -----------|
|**Material Particulado PM2.5:**|
| ![Sensirion SPS30 sensor](https://github.com/kike-canaries/docs/blob/main/images/Sensirion%20connection%20SPS30_1.jpg)|Sensirion SPS30|1) VDD ---> Salida de 5V del elevador<br>2) SDA ---> Pin 21 ESP32<br>3) SCL ---> Pin 22 ESP32<br>4) SEL ---> GND<br>5) GND ---> GND del elevador|
|![Panasonic sensor](https://github.com/kike-canaries/docs/blob/main/images/Panasonic%20connection1.jpg)|Panasonic SN-GCJA5|1) TX ---> Pin 17 ESP32<br>2) SDA ---> X<br>3) SCL ---> X<br>4) GND ---> GND del elevador<br>5) VDD ---> Salida de 5V del elevador|
|![Plantower sensor](https://github.com/kike-canaries/docs/blob/main/images/Plantower%20connection.jpg)|Plantower PMS7003 - PMSA003|1) VCC ---> Salida de 5V del elevador<br>3) GND ---> GND del elevador<br>9) TX ---> Pin 7 ESP32|
|![Honeywell sensor](https://github.com/kike-canaries/docs/blob/main/images/Honeywell%20sensor1.jpg)|Honeywell HPMA115S0|Eliminado de las guías y uso no recomendado por mal funcionamiento|
|![SDS011 sensor](https://github.com/kike-canaries/docs/blob/main/images/SDS011%20connection.jpg)|Nova SDS011|3) VCC ---> Salida de 5V del elevador<br>5) GND ---> GND del elevador<br>7) TX ---> Pin 7 ESP32|
||
|**Gas carbónico:**|
| ![SCD30 sensor](https://github.com/kike-canaries/docs/blob/main/images/SCD30%20connection.jpg)|Sensirion SCD30|5V - 3.3V ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>GND ---> GND<br>SCL ---> Pin 22 ESP32<br>SDA ---> Pin 21 ESP32<br>|
| ![SenseAir sensor](https://github.com/kike-canaries/docs/blob/main/images/SenseAir%20connection.jpg)|SenseAir S8|5V ---> Salida de 5V del elevador<br>GND ---> GND<br>RX ---> Pin 16 ESP32<br>TX ---> Pin 17 ESP32|
| ![Cubic sensor](https://github.com/kike-canaries/docs/blob/main/images/Cubic%20connection.jpg)|Cubic CM1106|5V ---> Salida de 5V del elevador<br>GND ---> GND<br>RX ---> Pin 16 ESP32<br>TX ---> Pin 17 ESP32|
| ![MHZ19 sensor](https://github.com/kike-canaries/docs/blob/main/images/MHZ19%20connection.jpg)|Winsen MHZ19|5V ---> Salida de 5V del elevador<br>GND ---> GND<br>RX ---> Pin 16 ESP32<br>TX ---> Pin 17 ESP32|
|![MHZ14 sensor](https://github.com/kike-canaries/docs/blob/main/images/MHZ14%20connection.jpg)|Winsen MHZ14|RX ---> Pin 16 ESP32<br>TX ---> Pin 17 ESP32<br>5V ---> Salida de 5V del elevador<br>GND ---> GND|
||
|**Humedad y Temperatura:**|
| ![SHT31 sensor](https://github.com/kike-canaries/docs/blob/main/images/SHT31.jpg)|Sensirion SHT31|VIN ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>GND ---> GND<br>SCL ---> Pin 22 ESP32<br>SDA ---> Pin 21 ESP32|
| ![AM2320 sensor](https://github.com/kike-canaries/docs/blob/main/images/AM2320.jpg)|Asair AM2320|VDD ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>SDA ---> Pin 21 ESP32<br>GND ---> GND<br>SCL ---> Pin 22 ESP32|
| ![BME280 sensor](https://github.com/kike-canaries/docs/blob/main/images/BME280.jpg)|Bosch BME280|VIN ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>GND ---> GND<br>SCL ---> Pin 22 ESP32<br>SDA ---> Pin 21 ESP32|
| ![BME680 sensor](https://github.com/kike-canaries/docs/blob/main/images/BME680.jpg)|Bosch BME680|VCC ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>GND ---> GND<br>SCL ---> Pin 22 ESP32<br>SDA ---> Pin 21 ESP32<br>SDO ---> X<br>CS ---> X|
| ![AHT10 sensor](https://github.com/kike-canaries/docs/blob/main/images/AHT10.jpg)|Asair AHT10|VIN ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>GND ---> GND<br>SCL ---> Pin 22 ESP32<br>SDA ---> Pin 21 ESP32|
| ![DHT22 sensor](https://github.com/kike-canaries/docs/blob/main/images/DHT-22-Sensor.jpg)|Asair DHT22|VCC ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>DATA ---> Pin 23 ESP32<br>NC ---> X<br>GND---> GND|
| ![DHT11 sensor](https://github.com/kike-canaries/docs/blob/main/images/DHT11.jpg)|Asair DHT11|VCC ---> Pin de 3.3V del ESP32 o Salida de 5V del elevador<br>DATA ---> Pin 23 ESP32<br>NC ---> X<br>GND---> GND|
