---
title: Building and publishing
permalink: /building_and_publishing/
---
## Build on Github

If you clone this repository, you can build it on another Github repository. However, each repository reads the default _config.yml file in the root directory, so the approach for putting each configuration file inside the configuration file will need to be modified.

## Kill a server

Sometimes the preview server seems to hang. If you ever try to build your Jekyll site and you get a message saying that the server is already running or something, you can kill the server process using these commands:

`ps aux | grep jekyll`

Find the PID (looks like "22298")

Then type `kill -9 22298` where "22298" is the PID.









