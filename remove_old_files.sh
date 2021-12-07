#!/bin/sh
/usr/bin/find /home/pi/cheomdan-ro/docs/snapshots -type f -mtime +3 -exec rm {} +
/usr/bin/find /home/pi/cheomdan-ro/logs -type f -mtime +3 -exec rm {} +
