---
title: Mobile API
tags:
  - api
keywords: api, data, mobile, tracks
last_updated: "March 12, 2021"
summary: "CanAirIO mobile API for recorded user tracks"
series: "api"
sidebar: english_sidebar
permalink: mobile_api_en.html
folder: en
---


## Overview

The current mobile tracks recorded for the Android app in mobile station mode, are stored in Firebase real time database. For now this data isn't unified with fixed stations, these tracks are in seperated storage. 

## Data visualization

For now, the shared tracks could be listed in the Android app in the section `public`. The app will showing the last 100 tracks: 

![Mobile track visualization](/docs/images/mobile_track_public.jpg)

## Mobile track endpoint

Each track could be fetched via the next endpoint:

```html
http://canairio.herokuapp.com/tracks/get/ID?output=csv
```

where `ID` is the track name in the app, for example for the first track in the screenshot image abovie, for fetch it in `CSV` format, the track ID is `20210408074648` and the get is:

```
http://canairio.herokuapp.com/tracks/get/20210408074648?output=csv
```

Also you can fetch it in JSON format:

```
http://canairio.herokuapp.com/tracks/get/20210408074648?output=json
```

example output in browser:

![Mobile track visualization](/docs/images/api_mobile_track_sample.jpg)

## All tracks request

For now we don't have this development, CanAirIO is a opensource initiative and you able to send any pull request for help us in improve our API. For now we have published some backups of last one year, for example:

[mobile-tracks-export-20210410.zip](http://influxdb.canair.io:8080/data/mobile-tracks-export-20210410.zip)


{% include links.html %}

