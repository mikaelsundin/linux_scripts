#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

#Get file
wget https://github.com/mikaelsundin/linux_scripts/raw/master/rpi_esp8266_sdio/esp8089-dkms_1.9.20170510_all.deb

#Extract and install
gunzip esp8089-dkms_1.9.20180430_all.deb.gz
dpkg -i esp8089-dkms_1.9.20180430_all.deb

#add ESP8089 to be loaded at boot.
sudo sed -i '/eps8089/d' /etc/modules
sudo sh -c 'echo "esp8089" >> /etc/modules'

read -p "Press enter to reboot"
reboot

