#!/bin/sh

DATE=$(date +"%Y/%m/%d %H:%M:%S")
FILENAME=$(date +"%Y%m%d%H%M%S")

echo "[$DATE] Capture Image"

# Capture
# https://www.raspberrypi.org/documentation/raspbian/applications/camera.md
raspistill \
        -w 1920 \
        -h 1080 \
	-ex night \
	-o /home/pi/cheomdan-ro/snapshots/$FILENAME.jpg && \
# Overlay Text
/usr/bin/convert /home/pi/cheomdan-ro/snapshots/$FILENAME.jpg \
	-pointsize 36 -fill white -annotate +1520+1040 "$DATE" \
	-pointsize 36 -fill white -annotate +40+1040 'Cheomdan Ro, Jeju-si' /home/pi/cheomdan-ro/snapshots/$FILENAME.overlay.jpg

echo "[$DATE] Update Symbolic Link"

rm /home/pi/cheomdan-ro/snapshots/latest.jpg
ln -s /home/pi/cheomdan-ro/snapshots/$FILENAME.overlay.jpg /home/pi/cheomdan-ro/snapshots/latest.jpg
