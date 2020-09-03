#HSkAnner 3D
3D scanning using a network of Raspberry Pies with camera modules and photogrammetry. This project is funded and overseen by Hochschule Karlsruhe - Technik und Wirtschaft and developed by Benedikt Reinberger. This project involves the design and assembly of a complete 3D scanner. If you want to build your own, this may be a good starting point.

## What you will need
	- more than one unit of Raspberry Pi 4B (in the following only called RPi) with the camera module installed
	- one micro SD card
	- an ethernet switch
	- power adapters and cables for the RPis
	- a computer with a free storage medium for installing the OS
	- lighting
## Setup
### Setting up the RPis (Sensor Nodes, SN)
First, we are going to prepare the RPis for booting over the network via PXE. This is an essential step for ease of maintenance as well as reliability, since we will be omitting the use of SD cards after this initial step.

-	First, download the OS for the RPi from
```
    https://downloads.raspberrypi.org/raspios_armhf_latest
```
-	Unzip the archive you downloaded.
-	Flash the .img file to a SD card. The contents of that card will be erased!
-	Put the
```
	flash_bootloader.sh and  
	pieeprom-new.bin
```
files in the /home/pi directory of the rootfs partition on the SD card you just flashed.
-	Create an empty file called "ssh" in the /boot directory of the rootfs partition
```
	touch /media/$USER/rootfs/boot/ssh
```
-	Edit /etc/dhcpcd.conf on the rootfs partion with an editor of your choice, for example with nano.
```
		nano /media/$USER/rootfs/etc/dhcpcd
```
	and set a static IP. To do that, uncomment the lines
```
	interface eth0
	static ip_address=192.168.0.10/24
```
	and type your preferred IP address for the device. In this case, I chose 192.168.0.10/24.
-	On your host machine, set your IP static to 192.168.0.x, with a subnet mask of 255.255.255.0 and no gateway. x can be anything you want from 1 to 254, but it cannot be the same as the one you just set on the RPi SD card.
-	Insert the SD card into the raspberry pi and power it up. If you want to configure over the network, connect it to your PC with an ethernet cable.
-	Log in. The default username and password are pi and raspberry, respectively. Since we are working over the network, we will use SSH to connect to the RPi.
```
	ssh pi@192.168.0.10
```
-	Connect the RPi to the internet if you want to update the firmware as well. You can do that using USB tethering and your phone, or connect to WiFi using
```
	sudo raspi-config
```
-	Mark flash_bootloader.sh as executable with
```
	chmod +x flash_bootloader.sh
```
	and execute it with root permissions
```
	sudo ./flash_bootloader.sh
```
	The RPi will reboot to finish the bootloader and firmware updates.
-	You can remove power or shut the unit down with
```
	sudo shutdown now
```
-  You're done with making this unit fit for PXE boot. If you want to see if it worked, connect a USB-TTL adapter to TX (GPIO14), RX (GPIO15) and GND of the Raspberry Pi (see pinout image in /00_setup/bootloader-flash-utils). Note that RX on the adapter goes to TX on the Pi and vice versa. Then connect to the Pi using a terminal emulator like cutecom, connecting at 115200 baud, 8-N-1, no flow control. Make sure you are in the dialout group, you can't open serial ports if you're not! After that, boot the RPi up. You should see some text. If you removed the SD card before starting, you can see a message mentioning the missing SD card.
-	Now you have to repeat the process of inserting the SD card, booting, SSHing into the RPi, executing the flash_bootloader.sh script for each RPi. Unfortunately, there does not seem to be an easier way to do that.

### Setting up the PC (Compute Node, CN)
Now that our RPis can boot from the network, we have to setup a PXE server on the PC.

___
this manual is unfinished.
