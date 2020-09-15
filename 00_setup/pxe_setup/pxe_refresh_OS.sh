#!/bin/bash

# pxe setup. tutorials followed: https://hackaday.com/2019/11/11/network-booting-the-pi-4/
# as well as parts of this https://linuxhit.com/raspberry-pi-pxe-boot-netbooting-a-pi-4-without-an-sd-card/
# this is modified a lot. this script will copy the files from an install on an SD card you insert into the PC. this should make maintaining it really easy. You can either SSH into a system that's booted off of PXE, edit files locally, or prepare the OS on an SD card and update it.

if [[ $USER != "root" ]]
then
	if [[ $(ping -c 1 -q google.com >&/dev/null; echo $?) == "0" ]]
	then
		# cleanup. we move all remnants of the old install to a backup directory.
			timestamp=$(date "+%d-%h-%Y-%T")
			backupdir="$HOME/pxe_backup/$timestamp"
			mkdir -p $backupdir/nfs
			mkdir -p $backupdir/tftpboot
			echo "Moving old PXE file system from internal storage to the backup directory."
			sudo mv $HOME/nfs $backupdir/
			sudo umount $HOME/tftpboot
			sudo mv $HOME/tftpboot $backupdir/tftpboot

		# copying files over to local storage
			cd
			mkdir -p $HOME/nfs/raspi_v0/boot
			echo "Copying file system from external storage to internal storage."
			echo
			echo "PLEASE NOTE: if YOU have modified /etc/fstab or /etc/dhcpcd.conf on the SD card, please return them to their default states after copying."
			echo
			echo "The system will likely not connect to the internet while ethernet is connected. To fix that, delete the default route (and add the correct one, if needed). Links for this issue below:"
			echo "https://raspberrypi.stackexchange.com/questions/15119/force-raspberry-to-get-internet-from-specific-network#15135"
			
			sudo cp -a /media/$USER/rootfs/* $HOME/nfs/raspi_v0
			sudo cp -a /media/$USER/boot/* $HOME/nfs/raspi_v0/boot/

		# those might not be necessary anymore since the tutorial is old
			cd $HOME/nfs/raspi_v0/boot
			sudo rm start4.elf
			sudo rm fixup4.dat
			sudo sed -i /UUID/d $HOME/nfs/raspi_v0/etc/fstab
			sudo wget https://github.com/Hexxeh/rpi-firmware/raw/master/start4.elf
			sudo wget https://github.com/Hexxeh/rpi-firmware/raw/master/fixup4.dat


		# enable ssh
			sudo touch $HOME/nfs/raspi_v0/boot/ssh
			echo "console=serial0,115200 console=tty root=/dev/nfs nfsroot=192.168.128.2:$HOME/nfs/raspi_v0,vers=3 rw ip=dhcp rootwait elevator=deadline" | sudo tee $HOME/nfs/raspi_v0/boot/cmdline.txt
			echo "OS refreshed. Please reboot!"
	else
		echo "You are not connected to the internet. Please connect to a network to proceed."
	fi
else
	echo "Please execute the script as normal user."
fi
