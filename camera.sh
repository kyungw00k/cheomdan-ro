#!/bin/sh

DATE=$(date +"%Y/%m/%d %H:%M:%S")
FILENAME=$(date +"%Y%m%d%H%M%S")
BASEDIR="/home/pi/cheomdan-ro"

echo "[$DATE] Capture Image"

# Capture
# https://www.raspberrypi.org/documentation/raspbian/applications/camera.md
raspistill \
        -w 1920 \
        -h 1080 \
	-ex night \
	-o $BASEDIR/docs/snapshots/$FILENAME.jpg && \
# Overlay Text
/usr/bin/convert $BASEDIR/docs/snapshots/$FILENAME.jpg \
	-pointsize 36 -fill white -annotate +1520+1040 "$DATE" \
	-pointsize 36 -fill white -annotate +40+1040 'Cheomdan Ro, Jeju-si' $BASEDIR/docs/snapshots/$FILENAME.overlay.jpg

echo "[$DATE] Upload to Dropbox"

cp $BASEDIR/docs/snapshots/$FILENAME.overlay.jpg $BASEDIR/docs/snapshots/latest.jpg

cd $BASEDIR
$BASEDIR/dropbox_uploader.sh upload $BASEDIR/docs/snapshots/latest.jpg latest.jpg
