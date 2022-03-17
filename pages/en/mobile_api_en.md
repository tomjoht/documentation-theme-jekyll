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

For now, the shared tracks could be listed in the Android app in the section `reports`. The app will showing the last 100 tracks: 

![Mobile track visualization](/docs/images/mobile_track_public.jpg)

## Mobile tracks endpoint

Each track could be fetched via the next endpoint:

```html
api.canair.io:8080/tracks/
```

where this `ID` parameter is the track name in the app, for example for the first track in the screenshot image above, for fetch it in `JSON` format, the track ID is `20220315134235` and for get it will be:

```
api.canair.io:8080/tracks/20220315134235
```

example output in browser:

![Mobile track visualization](/docs/images/api_mobile_track_sample.jpg)

in the **data** field are the complete track points of this air quality route.

## List all tracks

For fetch all possible tracks IDs, you can get it with:

```html
api.canair.io:8080/tracks/
```

This endpoint only list all tracks with the basic info but without data, and each ID could used with the previous endpoint described.

{% include links.html %}

