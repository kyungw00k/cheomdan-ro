#!/bin/sh
/usr/bin/find /home/pi/cheomdan-ro/snapshots -type f -mtime +3 -exec rm {} +
