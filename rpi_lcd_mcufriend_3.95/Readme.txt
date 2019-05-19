#
#This TFT requires rpi_esp8266_sdio PCB to get correct pinout for RPI.


#Test code to show jpeg slideshow on the LCD.
sudo apt-get install fbi
sudo fbi -T 1 -t 2 -d /dev/fb1 -noverbose *.jpg


