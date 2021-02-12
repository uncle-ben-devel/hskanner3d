#!/bin/bash
absolute_path_to_script=$(cd `dirname $0` && pwd)

if test -f "$absolute_path_to_script"/updated-flag; then
    echo "Bootloader was updated already, shutting down..." | tee -a bootloader_flash.log
    rm "$absolute_path_to_script"/updated-flag
    sudo shutdown now
    exit
else
    touch "$absolute_path_to_script"/updated-flag
fi

# update firmware for better power performance
echo "Checking for internet connection..."
if [[ $(ping -c 1 -q google.com >&/dev/null; echo $?) == "0" ]]
then
	sudo apt full-upgrade	# updates the firmware on the pi
else
	echo "This system is not connected to the internet. Firmware could not be updated." | tee -a "$absolute_path_to_script"/bootloader_flash.log
fi

# flash pxe-bootloader. if you want to know how to make your own bootloader with the settings you want, see https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2711_bootloader_config.md
sudo rpi-eeprom-update -d -f "$absolute_path_to_script"/./pieeprom-new.bin | tee -a "$absolute_path_to_script"/bootloader_flash.log
echo "This system will reboot now." | tee -a "$absolute_path_to_script"/bootloader_flash.log
sudo reboot
