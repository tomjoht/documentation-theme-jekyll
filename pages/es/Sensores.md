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
| ![SCD30 sensor](https://github.com/kike-canaries/docs/blob/main/images/SCD30%20connection.jpg)         | Sensirion SCD30 |Falta|
| ![SenseAir sensor](https://github.com/kike-canaries/docs/blob/main/images/SenseAir%20connection.jpg)         |Sensor de Gas Carbonico SenseAir S8|Falta|
| ![Cubic sensor](https://github.com/kike-canaries/docs/blob/main/images/Cubic%20connection.jpg)    |Sensor de Gas Carbonico Cubic|Falta|
| ![MHZ19 sensor](https://github.com/kike-canaries/docs/blob/main/images/MHZ19%20connection.jpg)    |Sensor de Gas Carbonico Winsen MHZ19|Falta|
|![MHZ14 sensor](https://github.com/kike-canaries/docs/blob/main/images/MHZ14%20connection.jpg)|Sensor de Gas Carbonico Winsen MHZ14|Falta|
|![Sensirion SPS30 sensor](https://github.com/kike-canaries/docs/blob/main/images/Sensirion%20connection%20SPS30.jpg)|Sensor de Material Particulado Sensirion SPS30|Falta|
|![Panasonic sensor](https://github.com/kike-canaries/docs/blob/main/images/Panasonic%20connection.jpg)|Sensor de Material Particulado Panasonic|Falta|
|![Plantower sensor](https://github.com/kike-canaries/docs/blob/main/images/Plantower%20connection.jpg)|Sensor de Material Particulado Plantower|Falta|
|![Honeywell sensor](https://github.com/kike-canaries/docs/blob/main/images/Honeywell%20sensor.jpg)|Sensor Honeywell|ELIMINADO DE LA GUIÁS Y NO RECOMENDADO POR MAL FUNCIONAMIENTO|
|![settings](https://github.com/kike-canaries/docs/blob/main/images/app_canairio_settings.jpg?raw=true)|Panel Settings |Variable Filter<br><br>  Bluetooth Status<br><br> Mobile Station<br><br> Fixed Station<br><br>Device Info<br><br>|
|![variables](https://github.com/kike-canaries/docs/blob/main/images/app_canairio_mydevice_variables.jpg?raw=true)|Filtro de variables |Elegir las variables a monitorear|Una vez emparejado en CanAirIO en el panel settings se puede en Variable Filter seleccionar el tipo de variables que queremos monitorear|
|![mobilestat](https://github.com/kike-canaries/docs/blob/main/images/app_canairio_mobile_station.jpg?raw=true)|Configuracion CanAirIO movil|Bluetooth Connecten ON/OFF<br><br><br>Sample Time Interval : en este campo se configura el tiempo en que se muestrea, para recorridos moviles se recomienda poner en 5 segundos y para estacion fija 300 segundos<br><br><br>Sensor Type : aca en esta pcion se despiegan las opciones de sensor conectado. PM o CO2<br><br><br>Reboot Device : Resetea el sensor<br><br><br>Factory Reset : Borra todos los datos grabados en el sensor|
|![fixedone](https://github.com/kike-canaries/docs/blob/main/images/app_canairio_fixed_station_one.jpg?raw=true)|Configurar CanAirIo como estacion fija|Bluetooth Status : Connected ON/OFF<br><br><br>Station Name : Para nombrar la estacion se sugiere la siguiente forma<br>**PAIS_CIUDAD_LOCALIDAD_NombreSensor** <br><br><br>WiFi Name : escriba el SSID de la WIFi <br>**NOTA** : debe ser exactamente igual, es posible que al final tenga un espacio, solo es posible conectarse a redes de 2.4GHz<br><br><br> Enable WiFi Connection ON/OFF<br><br><br>Enable Publication ON/OFF en la opci{on OFF se activa la funcion Advanced Settings|
|![fixedone](https://github.com/kike-canaries/docs/blob/main/images/app_canairio_fixed_station_influx.jpg?raw=true)|Advanced Settings<br><br><br>Configuracion InfluxDB|Database Name : nombre de la Base de Datos<br><br><br>Hostname : direccion URL de la base de datos<br><br><br>Port : Puerto 8086 debe ser ese el puerto|
|![sendlatlong](https://raw.githubusercontent.com/kike-canaries/docs/49f614b6082d61554334ed3c97f831e0e1c0224f/images/app_canairio_set_lat_long.jpg)|Advanced Settings<br><br>Send Lat/Long to device|Send Lat/Long to device : activando ésta funcionalidad se envian los datos de Latitud y Longitud al sensor, éste las comparte en la base de datos InfluxDB|
|![deviceinfo](https://github.com/kike-canaries/docs/blob/main/images/app_canairio_deviceinfo.jpg?raw=true)|Device Info|MAC : Mac Adress del dispositivo<br><br><br>Firmware : tipo de tarjeta y version del firmware<br><br><br> WiFi : ON/OFF<br><br><br>IFDB : Indica si comparte o no datos con InfluxDB<br><br><br>GW : ???<br><br><br>Send Feedback : Apunta a el GitHub de CanAirIO para dejar comentarios o solicitar funcionalidades o reportar bugs  |
