# Cheomdan-ro
> Simple CCTV Project

## Require
* Raspberry Pi
* Raspberry Pi Camera
* [Minibian OS](https://minibianpi.wordpress.com)

## Setup

### Packages
```
apt-get update
apt-get upgrade
apt-get install usbutils
apt-get install wireless-tools
apt-get install gphoto2
apt-get install imagemagick
apt-get install pm-utils
apt-get install wpasupplicant
apt-get install pm-utils
apt-get install wireless-tools
apt-get install raspi-config
apt-get install git
```

### Configuration

#### Turn off WIFI Power Management
Add file `/etc/pm/power.d/wireless`

```
#!/bin/sh

/sbin/iwconfig wlan0 power off
```

`sudo chmod +x /etc/pm/power.d/wireless`

#### Add Crontab
Run script weekdays
```
*/5 06-20 * * 1-5 camera.sh
```
