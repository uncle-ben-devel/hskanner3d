#!/bin/bash

if [ $USER = "root" ]
then
	# update firmware for better power performance
	if [[ $(ping -c 1 -q google.com >&/dev/null; echo $?) == "0" ]]
	then
		apt full-upgrade	# updates the firmware on the pi
	else
		echo "This system is not connected to the internet. Firmware could not be updated."
	fi
	# flash pxe-bootloader. if you want to know how to make your own bootloader with the settings you want, see https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2711_bootloader_config.md
	rpi-eeprom-update -d -f ./pieeprom-new.bin
	echo "This system will reboot now."
	reboot
else
	echo "Please execute the script as root or with the sudo command and ensure you have a working internet connection."
fi
