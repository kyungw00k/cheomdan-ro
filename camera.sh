#!/bin/sh

DATE=$(date +"%Y/%m/%d %H:%M:%S")
FILENAME=$(date +"%Y%m%d%H%M%S")

echo "[$DATE] Capture Image"

# Capture
# https://www.raspberrypi.org/documentation/raspbian/applications/camera.md
raspistill \
	-v \
        -w 1920 \
        -h 1080 \
	-ex night \
	-o /root/cheomdan-ro/snapshots/$FILENAME.jpg && \
# Overlay Text
/usr/bin/convert /root/cheomdan-ro/snapshots/$FILENAME.jpg \
	-pointsize 36 -fill white -annotate +1520+1040 "$DATE" \
	-pointsize 36 -fill white -annotate +40+1040 'Cheomdan Ro, Jeju-si' /root/cheomdan-ro/snapshots/$FILENAME.overlay.jpg

echo "[$DATE] Update Symbolic Link"

rm /root/cheomdan-ro/snapshots/latest.jpg
ln -s /root/cheomdan-ro/snapshots/$FILENAME.overlay.jpg /root/cheomdan-ro/snapshots/latest.jpg
