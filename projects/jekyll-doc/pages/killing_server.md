---
title: Stopping (killing) a server instance
permalink: /killing_server/
---

If the Jekyll server won't stop running, but you can't stop it by pressing *Ctrl+C*, do this:

1. Find the PD by typing `ps aux | grep jekyll`. Look for a number such as 22298. 
2. Type `kill -9 22298` where "1234" is the PID.

killall ruby