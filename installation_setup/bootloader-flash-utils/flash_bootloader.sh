#!/bin/bash

if test -f /home/pi/updated-flag; then
    echo "Bootloader was updated already, shutting down..." | tee -a bootloader_flash.log
    rm /home/pi/updated-flag
    sudo shutdown now
    exit
else
    touch updated-flag
fi

# update firmware for better power performance
if [[ $(ping -c 1 -q google.com >&/dev/null; echo $?) == "0" ]]
then
	sudo apt full-upgrade	# updates the firmware on the pi
else
	echo "This system is not connected to the internet. Firmware could not be updated." | tee -a bootloader_flash.log
fi

# flash pxe-bootloader. if you want to know how to make your own bootloader with the settings you want, see https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2711_bootloader_config.md
sudo rpi-eeprom-update -d -f /home/pi/./pieeprom-new.bin | tee -a bootloader_flash.log
echo "This system will reboot now." | tee -a bootloader_flash.log
sudo reboot
