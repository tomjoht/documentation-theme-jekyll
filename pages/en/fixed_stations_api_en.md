---
title: Fixed stations API
tags:
  - api
keywords: api, data, fixed stations
last_updated: "March 12, 2021"
summary: "CanAirIO fixed stations API for fetch published data"
series: "api"
sidebar: english_sidebar
permalink: fixed_stations_api_en.html
folder: en
---

## CanAirIO Unified API

Initial API version for mobile and fixed CanAirIO stations

## Overview

We have a JSON API for the CanAirIO fixed stations, for now it only has two endpoints, the first one for get all current stations that are online right now with the last publication, `stations` and the second one for retrieve the complete data of each station in the last hour. The output is a [DarwinCore](https://dwc.tdwg.org/terms/) record.

## Stations list

endpoint: [http://api.canair.io:8080/dwc/stations](http://api.canair.io:8080/dwc/stations)

Sample request for retreive all stations:

```bash
curl -G http://api.canair.io:8080/dwc/stations
```

Sample output of one station only:

```json
[{
	"id": "EZTTTGOTD78432",
	"station_name": "EZTTTGOTD78432",
	"scientificName": "CanAirIO Air quality Station",
	"ownerInstitutionCodeProperty": "CanAirIO",
	"type": "FixedStation",
	"license": "CC BY-NC-SA",
	"measurements": [
		[{
			"measurementID": "2022-03-15T16:29:07.913361Z",
			"measurementType": "PM1",
			"measurementUnit": "ug/m3",
			"measurementDeterminedDate ": "2022-03-15T16:29:07.913361Z",
			"measurementDeterminedBy": "CanAirIO station EZTTTGOTD78432",
			"measurementValue": 10
		}, {
			"measurementID": "2022-03-15T16:29:07.913361Z",
			"measurementType": "PM2.5",
			"measurementUnit": "ug/m3",
			"measurementDeterminedDate ": "2022-03-15T16:29:07.913361Z",
			"measurementDeterminedBy": "CanAirIO station EZTTTGOTD78432",
			"measurementValue": 18
		}, {
			"measurementID": "2022-03-15T16:29:07.913361Z",
			"measurementType": "PM10",
			"measurementUnit": "ug/m3",
			"measurementDeterminedDate ": "2022-03-15T16:29:07.913361Z",
			"measurementDeterminedBy": "CanAirIO station EZTTTGOTD78432",
			"measurementValue": 27
		}, {
			"measurementID": "2022-03-15T16:29:07.913361Z",
			"measurementType": "Temperature",
			"measurementUnit": "C",
			"measurementDeterminedDate ": "2022-03-15T16:29:07.913361Z",
			"measurementDeterminedBy": "CanAirIO station EZTTTGOTD78432",
			"measurementValue": 24.1
		}, {
			"measurementID": "2022-03-15T16:29:07.913361Z",
			"measurementType": "Humidity",
			"measurementUnit": "%",
			"measurementDeterminedDate ": "2022-03-15T16:29:07.913361Z",
			"measurementDeterminedBy": "CanAirIO station EZTTTGOTD78432",
			"measurementValue": 36.6
		}, {
			"measurementID": "2022-03-15T16:29:07.913361Z",
			"measurementType": "Pressure",
			"measurementUnit": "hPa",
			"measurementDeterminedDate ": "2022-03-15T16:29:07.913361Z",
			"measurementDeterminedBy": "CanAirIO station EZTTTGOTD78432",
			"measurementValue": 0.0
		}, {
			"measurementID": "2022-03-15T16:29:07.913361Z",
			"measurementType": "CO2",
			"measurementUnit": "ppm",
			"measurementDeterminedDate ": "2022-03-15T16:29:07.913361Z",
			"measurementDeterminedBy": "CanAirIO station EZTTTGOTD78432",
			"measurementValue": 0
		}, {
			"measurementID": "2022-03-15T16:29:07.913361Z",
			"measurementType": "CO2 Temperature",
			"measurementUnit": "C",
			"measurementDeterminedDate ": "2022-03-15T16:29:07.913361Z",
			"measurementDeterminedBy": "CanAirIO station EZTTTGOTD78432",
			"measurementValue": 0.0
		}, {
			"measurementID": "2022-03-15T16:29:07.913361Z",
			"measurementType": "CO2 Humidity",
			"measurementUnit": "%",
			"measurementDeterminedDate ": "2022-03-15T16:29:07.913361Z",
			"measurementDeterminedBy": "CanAirIO station EZTTTGOTD78432",
			"measurementValue": 0.0
		}, {
			"measurementID": "2022-03-15T16:29:07.913361Z",
			"measurementType": "Battery voltage",
			"measurementUnit": "V",
			"measurementDeterminedDate ": "2022-03-15T16:29:07.913361Z",
			"measurementDeterminedBy": "CanAirIO station EZTTTGOTD78432",
			"measurementValue": 4.96
		}, {
			"measurementID": "2022-03-15T16:29:07.913361Z",
			"measurementType": "Geohash",
			"measurementUnit": "",
			"measurementDeterminedDate ": "2022-03-15T16:29:07.913361Z",
			"measurementDeterminedBy": "CanAirIO station EZTTTGOTD78432",
			"measurementValue": "ezty5zs"
		}, {
			"measurementID": "2022-03-15T16:29:07.913361Z",
			"measurementType": "Geohash3",
			"measurementUnit": "",
			"measurementDeterminedDate ": "2022-03-15T16:29:07.913361Z",
			"measurementDeterminedBy": "CanAirIO station EZTTTGOTD78432",
			"measurementValue": "ezt"
		}, {
			"measurementID": "2022-03-15T16:29:07.913361Z",
			"measurementType": "Version",
			"measurementUnit": "",
			"measurementDeterminedDate ": "2022-03-15T16:29:07.913361Z",
			"measurementDeterminedBy": "CanAirIO station EZTTTGOTD78432",
			"measurementValue": "v0.5.2r907"
		}]
	],
	"locationID": "2022-03-15T16:29:07.913361Z",
	"georeferencedBy": "CanAirIO firmware v0.5.2r907",
	"georeferencedDate": "2022-03-15T16:29:07.913361Z",
	"decimalLatitude ": 43.28,
	"decimalLongitude ": -2.99,
	"geohash": "ezty5zs",
	"observedOn": "2022-03-15T16:29:07.913361Z"
}]
```

## Station data

endpoint: [http://api.canair.io:8080/dwc/stations/station_id](http://api.canair.io:8080/dwc/stations/station_id)

Request sample for station with id: U33TTGOTDA585E:  

```bash
curl -G http://api.canair.io:8080/dwc/stations/U33TTGOTDA585E
```

Sample output for this station:

```json
{
	"id": "U33TTGOTDA585E",
	"station_name": "U33TTGOTDA585E",
	"scientificName": "CanAirIO Air quality Station",
	"ownerInstitutionCodeProperty": "CanAirIO",
	"type": "FixedStation",
	"license": "CC BY-NC-SA",
	"measurements": [
		[{
			"measurementID": "2022-03-15T16:45:34.835070Z",
			"measurementType": "PM1",
			"measurementUnit": "ug/m3",
			"measurementDeterminedDate ": "2022-03-15T16:45:34.835070Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 3
		}, {
			"measurementID": "2022-03-15T16:45:34.835070Z",
			"measurementType": "PM2.5",
			"measurementUnit": "ug/m3",
			"measurementDeterminedDate ": "2022-03-15T16:45:34.835070Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 5
		}, {
			"measurementID": "2022-03-15T16:45:34.835070Z",
			"measurementType": "PM10",
			"measurementUnit": "ug/m3",
			"measurementDeterminedDate ": "2022-03-15T16:45:34.835070Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 6
		}, {
			"measurementID": "2022-03-15T16:45:34.835070Z",
			"measurementType": "Temperature",
			"measurementUnit": "C",
			"measurementDeterminedDate ": "2022-03-15T16:45:34.835070Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 22.86
		}, {
			"measurementID": "2022-03-15T16:45:34.835070Z",
			"measurementType": "Humidity",
			"measurementUnit": "%",
			"measurementDeterminedDate ": "2022-03-15T16:45:34.835070Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 31.43
		}, {
			"measurementID": "2022-03-15T16:45:34.835070Z",
			"measurementType": "Pressure",
			"measurementUnit": "hPa",
			"measurementDeterminedDate ": "2022-03-15T16:45:34.835070Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 1019.78
		}, {
			"measurementID": "2022-03-15T16:45:34.835070Z",
			"measurementType": "CO2",
			"measurementUnit": "ppm",
			"measurementDeterminedDate ": "2022-03-15T16:45:34.835070Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 0
		}, {
			"measurementID": "2022-03-15T16:45:34.835070Z",
			"measurementType": "CO2 Temperature",
			"measurementUnit": "C",
			"measurementDeterminedDate ": "2022-03-15T16:45:34.835070Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 0.0
		}, {
			"measurementID": "2022-03-15T16:45:34.835070Z",
			"measurementType": "CO2 Humidity",
			"measurementUnit": "%",
			"measurementDeterminedDate ": "2022-03-15T16:45:34.835070Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 0.0
		}, {
			"measurementID": "2022-03-15T16:45:34.835070Z",
			"measurementType": "Battery voltage",
			"measurementUnit": "V",
			"measurementDeterminedDate ": "2022-03-15T16:45:34.835070Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 4.97
		}, {
			"measurementID": "2022-03-15T16:45:34.835070Z",
			"measurementType": "Geohash",
			"measurementUnit": "",
			"measurementDeterminedDate ": "2022-03-15T16:45:34.835070Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": "u33dcu0"
		}, {
			"measurementID": "2022-03-15T16:45:34.835070Z",
			"measurementType": "Geohash3",
			"measurementUnit": "",
			"measurementDeterminedDate ": "2022-03-15T16:45:34.835070Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": "u33"
		}, {
			"measurementID": "2022-03-15T16:45:34.835070Z",
			"measurementType": "Version",
			"measurementUnit": "",
			"measurementDeterminedDate ": "2022-03-15T16:45:34.835070Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": "v0.5.3r908"
		}],
		[{
			"measurementID": "2022-03-15T16:47:34.767315Z",
			"measurementType": "PM1",
			"measurementUnit": "ug/m3",
			"measurementDeterminedDate ": "2022-03-15T16:47:34.767315Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 4
		}, {
			"measurementID": "2022-03-15T16:47:34.767315Z",
			"measurementType": "PM2.5",
			"measurementUnit": "ug/m3",
			"measurementDeterminedDate ": "2022-03-15T16:47:34.767315Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 5
		}, {
			"measurementID": "2022-03-15T16:47:34.767315Z",
			"measurementType": "PM10",
			"measurementUnit": "ug/m3",
			"measurementDeterminedDate ": "2022-03-15T16:47:34.767315Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 6
		}, {
			"measurementID": "2022-03-15T16:47:34.767315Z",
			"measurementType": "Temperature",
			"measurementUnit": "C",
			"measurementDeterminedDate ": "2022-03-15T16:47:34.767315Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 22.85
		}, {
			"measurementID": "2022-03-15T16:47:34.767315Z",
			"measurementType": "Humidity",
			"measurementUnit": "%",
			"measurementDeterminedDate ": "2022-03-15T16:47:34.767315Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 30.87
		}, {
			"measurementID": "2022-03-15T16:47:34.767315Z",
			"measurementType": "Pressure",
			"measurementUnit": "hPa",
			"measurementDeterminedDate ": "2022-03-15T16:47:34.767315Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 1019.79
		}, {
			"measurementID": "2022-03-15T16:47:34.767315Z",
			"measurementType": "CO2",
			"measurementUnit": "ppm",
			"measurementDeterminedDate ": "2022-03-15T16:47:34.767315Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 0
		}, {
			"measurementID": "2022-03-15T16:47:34.767315Z",
			"measurementType": "CO2 Temperature",
			"measurementUnit": "C",
			"measurementDeterminedDate ": "2022-03-15T16:47:34.767315Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 0.0
		}, {
			"measurementID": "2022-03-15T16:47:34.767315Z",
			"measurementType": "CO2 Humidity",
			"measurementUnit": "%",
			"measurementDeterminedDate ": "2022-03-15T16:47:34.767315Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 0.0
		}, {
			"measurementID": "2022-03-15T16:47:34.767315Z",
			"measurementType": "Battery voltage",
			"measurementUnit": "V",
			"measurementDeterminedDate ": "2022-03-15T16:47:34.767315Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": 4.96
		}, {
			"measurementID": "2022-03-15T16:47:34.767315Z",
			"measurementType": "Geohash",
			"measurementUnit": "",
			"measurementDeterminedDate ": "2022-03-15T16:47:34.767315Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": "u33dcu0"
		}, {
			"measurementID": "2022-03-15T16:47:34.767315Z",
			"measurementType": "Geohash3",
			"measurementUnit": "",
			"measurementDeterminedDate ": "2022-03-15T16:47:34.767315Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": "u33"
		}, {
			"measurementID": "2022-03-15T16:47:34.767315Z",
			"measurementType": "Version",
			"measurementUnit": "",
			"measurementDeterminedDate ": "2022-03-15T16:47:34.767315Z",
			"measurementDeterminedBy": "CanAirIO station U33TTGOTDA585E",
			"measurementValue": "v0.5.3r908"
		}]
	],
	"locationID": "2022-03-15T16:47:34.767315Z",
	"georeferencedBy": "CanAirIO firmware v0.5.3r908",
	"georeferencedDate": "2022-03-15T16:47:34.767315Z",
	"decimalLatitude ": 52.54,
	"decimalLongitude ": 13.44,
	"geohash": "u33dcu0",
	"observedOn": "2022-03-15T16:47:34.767315Z"
}
```

## Deprecated section

---
**!!Deprecated!!**
The next sections are deprecated. Only use that like a old reference.

---

The current fixed stations are stored in an InfluxDB database service, each station write a data series time in separated tables. We will change it to different schema soon. For now the next endpoints are enabled.

### Data visualization

For now, the shared series time of each stations could be listed in our Grafana dashboard here:

[CanAirIO grafana](http://influxdb.canair.io:8000)

[![Mobile track visualization](/docs/images/grafana_sample.jpg)](http://influxdb.canair.io:8000)

### Data endpoint

Each series time could be fetched via the next endpoint:

```html
http://influxdb.canair.io:8086/query
```

the full documentation of InfluxDB query syntax could be consulted [here](https://docs.influxdata.com/influxdb/v1.8/tools/api/)

For example:


### New schema

We have a new schema, for now the automatic stations are in the main table `fixed_stations_01` and these stations have tags for `mac`, `name` and `geo3`, where `name` is automatic ID.

**Select stations IDs:**
```bash
curl -G 'http://influxdb.canair.io:8086/query?db=canairio' --data-urlencode 'q=select distinct("name") from "fixed_stations_01" limit 100'  > names.json
```

**Select fields from one station ID:**
```bash
curl -G 'http://influxdb.canair.io:8086/query?db=canairio' --data-urlencode 'q=select "pm25"::field,"U33TTGOTDA585E"::tag from "fixed_stations_01" limit 30'  > U33TTGOTDA585E.json
```

Also maybe works too:
```bash
curl -G 'http://influxdb.canair.io:8086/query?db=canairio' --data-urlencode "q=select \"name\", \"mac\", \"geo3\", \"pm25\" from fixed_stations_01 WHERE \"name\"='6MCESP32DE8CBC2' and time >= now() - 1m" > data_specific_station_last_minute.json
```

**From Python**

```bash
#!/usr/bin/python3

import requests

endpoint='http://influxdb.canair.io:8086/query'
database='canairio'
parameters = {'q': "select \"name\", \"mac\", \"geo3\", \"pm25\" from fixed_stations_01 WHERE \"name\"='6MCESP32DE8CBC2' and time >= now() - 1m", 'db':database}
response = requests.get(endpoint, params=parameters)
print(response.json())
```

{% include links.html %}

