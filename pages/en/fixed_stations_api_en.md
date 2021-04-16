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

## Data visualization

For now, the shared series time of each stations could be listed in our Grafana dashboard here:

[CanAirIO grafana](http://influxdb.canair.io:8000)

[![Mobile track visualization](/docs/images/grafana_sample.jpg)](http://influxdb.canair.io:8000)

## Data endpoint

Each series time could be fetched via the next endpoint:

```html
http://influxdb.canair.io:8086/query
```

the full documentation of InfluxDB query syntax could be consulted [here](https://docs.influxdata.com/influxdb/v1.8/tools/api/)

For example:

```bash
curl -G 'http://influxdb.canair.io:8086/query?db=canairio' --data-urlencode 'q=select * from "PM25_Berlin_CanAirIO_v2" WHERE time >= now() - 12h' > PM25_Berlin_CanAirIO_v2.json
```

## Fixed stations names

For get the complete list of fixed stations names:

```bash
curl -G 'http://influxdb.canair.io:8086/query?db=canairio' --data-urlencode 'q=show measurements'
```

But the more important stations of CanAirIO with more stable data is listed [here](https://github.com/daquina-io/VizCalidadAire/blob/canairio/canairio_sensors_mod.csv).

## Python example

In your OS please install before `python3-virtualenv`package, then:

create and activate your virtual env space:

```bash
virtualenv venv && source venv/bin/activate
```

install the next package for run the test:

```bash
pip3 install influxdb ipython
```

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



## All tracks request

For now we don't have this development, CanAirIO is a opensource initiative and you able to send any pull request for help us in improve our API. For now we have published some backups of last one year, for example:

[CanAirIO full snap - fixed stations](http://influxdb.canair.io:8080/data/)

Please read the `README` file in the link for details.


{% include links.html %}

