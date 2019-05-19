#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

#Be sure system is up to date
apt-get update && sudo apt-get -y upgrade
apt-get -y install dkms raspberrypi-kernel-headers

#4bit SDIO
sed -i -e "/^dtoverlay.*sdio/d" /boot/config.txt
sh -c 'echo "dtoverlay=sdio,poll_once=off" >> /boot/config.txt'

#1bit SDIO
#sed -i -e "/^dtoverlay.*sdio/d" /boot/config.txt
#sh -c 'echo "dtoverlay=sdio,poll_once=off,bus_width=1" >> /boot/config.txt' 

#add Reset pin option
sh -c 'echo "options esp8089 esp_reset_gpio=4" > /etc/modprobe.d/esp.conf'

read -p "Press enter to reboot"
reboot



