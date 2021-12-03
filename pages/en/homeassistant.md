---
title: Home Assistant Integration
tags:
  - firmware
  - device
  - cloud
  - protocol
  - debugging
keywords: firmware, home assistant, automatitation, sensors, cloud, control
last_updated: "December 1, 2021"
summary: "CanAirIO Home Assistant integration"
series: "firmware internals"
sidebar: english_sidebar
permalink: home_assistant.html
folder: en
---


## Overview

[![Home Assistant site](/docs/images/hass_media00.jpg)](https://www.home-assistant.io/)


The last version of CanAirIO firmware is integrated with the open source project [Home Assistant](https://www.home-assistant.io/), with the next features for now: 

- **MQTT Discovery** (zero-config for have able your device on HASS)
- **Multi sensor device implementation** (One device multiple entities)

You only need for that a Home Assistant instance running with built-in MQTT integration, and your CanAirIO device will be in the device list automatically.


## Home Assistant installation

The team of Hass have many alternatives for install Hass to have a centralized controller for you home, for example a local instance running on your PC or laptop, dedicated instance for example on a RaspberryPi or similar hardware. For more details please follow the [official instructions](https://www.home-assistant.io/installation/).

[![Home Assistant Installation](/docs/images/hass_media01.jpg)](https://www.home-assistant.io/installation/)

## MQTT Broker

After install Home Assistant you need a MQTT broker, for that you have two alternatives: install a basic add-on or install a external MQTT broker. For simplicity here we will show the add-on alternative, for that please install it from **Add-on Store** on **Supervisor** section, and install the add-on called **Mosquitto Broker**: 

![MQTT Broker Installation](/docs/images/hass_media02.jpg)

You only need start this service and no more. If you want a different alternative or more info about extra configuration, please enter [here](https://www.home-assistant.io/docs/mqtt/broker)

## MQTT Home Assistant integration

Home Assistant works with many integrations. For understand the MQTT messages from our CanAirIO devices, it needs a MQTT integration. For install and configure it, you only need enter to **configuration** section, and add the **Mosquitto broker integration**, like this:

![MQTT Broker Integration](/docs/images/hass_config_03.jpg)

 With the button configure, we need **copy the default password** that Home Assistant configured, and save it for the next steps with our CanAirIO device:

![MQTT Broker Integration](/docs/images/hass_config_04.jpg)

## CanAirIO Configuration

In the app, please put the **credentials** and the **IP** of the machine that has the MQTT Broker instance (in this case, the Home Assistant IP address) in **Settings->Fixed station->Advanced Settings->Home Assistant Discovery** settings, like this:

![MQTT Broker Integration](/docs/images/hass_config_07.jpg)

Maybe you need wait for few seconds, and the CanAirIO will be in **device section automatically**, thanks a discovery feature of Home Assistant, reducing the complexity for add devices. You should have your CanAirIO devices like this: 

![MQTT Broker Integration](/docs/images/hass_config_05.jpg)  

![MQTT Broker Integration](/docs/images/hass_config_06.jpg)  


For new devices, only do the last step, and that is it.

## Customization

![MQTT Broker Installation](/docs/images/hass_media03.jpg)

Home Assistant it's very easy and flexible. In the last step for example, you only need to add it to the main **overview** section, pressing the button **ADD TO LOVELACE** and follow the alternatives for generate a new **card** in your dashboard.


## Troubleshooting

![hass01](https://user-images.githubusercontent.com/423856/144431251-e81f4656-bc19-4598-980b-be57bf088ca8.gif)

Using our [canair.io/installer](https://canair.io/installer) you can use it to have log output of your device and follow the possible issues. For that you only need:

- connect your device
- launch the CanAirIO Web Installer
- choose the USB of the list
- choose the option **logs**
- restart your device to see the complete output

---

Remember also that we have a [Telegram group](https://t.me/canairio) for support.

---
{% include links.html %}

