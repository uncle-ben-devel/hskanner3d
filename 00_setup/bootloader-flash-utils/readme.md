This is a setup to make the Raspberry Pi 4 Model B fit for running off of a PXE server, omitting the SD card completely and making maintenance a breeze.
		bootconf.txt
contains the settings that were used to make the pieeprom-new.bin file, which will be flashed using the following steps. As for the settings chosen, please refer to https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2711_bootloader_config.md for further information. A copy of that website should also be in this folder.

1.	Unzip the archive https://downloads.raspberrypi.org/raspbian_latest contained within this folder.
1.	Flash the .img file to a SD card. The contents of that card will be erased!
1.	Put the
		flash_bootloader.sh and  
		pieeprom-new.bin 
	files in the /home/pi directory of the rootfs partition.
	1.	If you want to configure the Pi from the network over ssh, there's some extra steps.
	1.	Create an empty file called "ssh" in the /boot directory of the rootfs partition
			touch /media/$USER/rootfs/boot/ssh
	1.	Edit /etc/dhcpcd.conf on the rootfs partion with an editor of your choice, for example with nano.
			nano /media/$USER/rootfs/etc/dhcpcd
		and set a static IP. To do that, uncomment the lines
			interface eth0
			static ip_address=192.168.128.10/24
		and type your preferred IP address for the device. In this case, I chose 192.168.128.10/24.
	1.	On your host machine, set your IP static to 192.168.128.x, with a subnet mask of 255.255.255.0 and no gateway. x can be anything you want from 1 to 254, but it cannot be the same as the one you set on the raspberry disk.
1.	Insert the SD card into the raspberry pi and power it up. If you want to configure over the network, connect it to your PC with an ethernet cable.
1.	Log in. The default username and password are pi and raspberry, respectively.
1.	Mark flash_bootloader.sh as executable with 
		chmod +x flash_bootloader.sh
	and execute it with root permissions
		sudo ./flash_bootloader.sh
1.	You can remove power or shut the unit down with
		sudo shutdown now
1.	You're done with making this unit fit for PXE boot. If you want to see if it worked, connect a USB-TTL adapter to TX (GPIO14), RX (GPIO15) and GND of the Raspberry Pi (see pinout image in this folder). Note that RX on the adapter goes to TX on the Pi and vice versa. Then connect to the Pi using a terminal emulator like cutecom, connecting at 115200 baud, 8-N-1, no flow control. Make sure you are in the dialout group, you can't open serial ports if you're not! After that, give power to the Pi. You should see some text. If you removed the SD card, you can see a message mentioning the missing SD card.
