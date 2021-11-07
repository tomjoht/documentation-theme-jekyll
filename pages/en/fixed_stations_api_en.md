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


## Overview

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

Linux
```bash
curl -G 'http://influxdb.canair.io:8086/query?db=canairio' --data-urlencode 'q=select * from "PM25_Berlin_CanAirIO_v2" WHERE time >= now() - 12h' > PM25_Berlin_CanAirIO_v2.json
```
Linux - New Data Model
```bash
curl -G 'http://influxdb.canair.io:8086/query?db=canairio' --data-urlencode "q=select \"name\", \"mac\", \"geo3\", \"pm25\" from fixed_stations_01 WHERE \"name\"='6MCESP32DE8CBC2' and time >= now() - 1m" > data_specific_station_last_minute.json
```
Python - New Data Model
```bash
#!/usr/bin/python3

import requests

endpoint='http://influxdb.canair.io:8086/query'
database='canairio'
parameters = {'q': "select \"name\", \"mac\", \"geo3\", \"pm25\" from fixed_stations_01 WHERE \"name\"='6MCESP32DE8CBC2' and time >= now() - 1m", 'db':database}
response = requests.get(endpoint, params=parameters)
print(response.json())
```

Windows
```bash
curl -Headers @{"accept"="application/json"}  'http://influxdb.canair.io:8086/query?db=canairio' -Body @{"q" = 'select * from "PM2.5_BOG_TUN_EstacionTunal" WHERE time >= now() - 12h'}  -OutFile PM2.5_BOG_TUN_EstacionTunal.json
```

If you want to get the data with a specific time resolution, you need a **agregation function** in the select section of the query and group the results by the resolution time, in the next example we use the **agregation function** mean() for all the variables, you can use the same or one of median(), count(), min(), max(), sum(), first(), last(), spread() or stddev().

Note the last part of the query, we add the sql clause **GROUP BY time(resolution_time)**

```bash
curl -G 'http://influxdb.canair.io:8086/query?db=canairio' --data-urlencode 'q=select mean(*) from "PM25_Berlin_CanAirIO_v2" WHERE time >= now() - 12h GROUP BY time(1m)' > PM25_Berlin_CanAirIO_v2.json
```

The last couple of examples return the data in json format, if you want to get the data in **CSV format** you need to add the header "Accept: application/csv" to the curl request using the parameter -H like show the next example:

```bash
curl -H 'Accept:application/csv' -G 'http://influxdb.canair.io:8086/query?db=canairio' --data-urlencode 'q=select mean(*) from "PM25_Berlin_CanAirIO_v2" WHERE time >= now() - 12h GROUP BY time(1m) FILL(none)' > PM25_Berlin_CanAirIO_v2.csv
```


### Fixed stations names

For get the complete list of fixed stations names:

```bash
curl -G 'http://influxdb.canair.io:8086/query?db=canairio' --data-urlencode 'q=show measurements'
```

But the more important stations of CanAirIO with more stable data is listed [here](https://github.com/daquina-io/VizCalidadAire/blob/canairio/canairio_sensors_mod.csv).

## Python example

In your OS please install before the `python3-virtualenv` package, then:

create and activate your virtual space:

```bash
virtualenv venv && source venv/bin/activate
```

install the next package for run the test:

```bash
pip3 install influxdb ipython
```

### Query

enter to ipython console with the command `ipython` and execute the next lines for import the influxDb client and instance it:

```python
from influxdb import InfluxDBClient
client = InfluxDBClient(host='influxdb.canair.io', port=8086, database='canairio')
```

after that, run a query:

```python
client.query('select * from "PM2.5_BOG_FON_Hayuelos_E01" WHERE time >= now() - 10m')
```

you should have an output similar to next:

![python output from fixed station query](/docs/images/api_python_fixed_sample.jpg)

### Stations names

for get the all names of fixed stations:

```python
client.get_list_measurements()
```

## All tracks request

For now we don't have this development, CanAirIO is a opensource initiative and you able to send any pull request for help us in improve our API. For now we have published some backups of last one year, for example:

[CanAirIO full snap - fixed stations](http://influxdb.canair.io:8080/data/)

Please read the `README` file in the link for details.


{% include links.html %}

