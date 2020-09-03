#!/bin/bash

if [[ $USER != "root" ]]
then
	if [[ $(ping -c 1 -q google.com >&/dev/null; echo $?) == "0" ]]
	then
		echo "Systemd-resolved is blocking port 53, we need it to be free for use with dnsmasq later."
		# tutorial source: https://jonamiki.com/2020/01/29/dnsmasq-failed-to-create-listening-socket-for-port-53-address-already-in-use/
		sudo systemctl stop systemd-resolved
		sudo mv /etc/systemd/resolved.conf /etc/systemd/resolved.conf.bak
		echo "[Resolve]" | sudo tee -a /etc/systemd/resolved.conf
		echo "DNS=1.1.1.1" | sudo tee -a /etc/systemd/resolved.conf # cloudflare DNS
		echo "FallbackDNS=1.0.0.1" | sudo tee -a /etc/systemd/resolved.conf
		echo "MulticastDNS=no" | sudo tee -a /etc/systemd/resolved.conf
		echo "DNSSEC=no" | sudo tee -a /etc/systemd/resolved.conf
		echo "DNSOverTLS=no" | sudo tee -a /etc/systemd/resolved.conf
		echo "DNSStubListener=no" | sudo tee -a /etc/systemd/resolved.conf
		echo "" | sudo tee -a /etc/systemd/resolved.conf
		sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
		sudo systemctl start systemd-resolved

		# software install
		sudo apt-get -y install unzip kpartx dnsmasq nfs-kernel-server

		# pxe setup. tutorials followed: https://hackaday.com/2019/11/11/network-booting-the-pi-4/
		# as well as parts of this https://linuxhit.com/raspberry-pi-pxe-boot-netbooting-a-pi-4-without-an-sd-card/
		cd
		sudo mkdir -p /nfs/raspi_v0
		wget https://downloads.raspberrypi.org/raspios_lite_armhf_latest
		unzip raspios_lite_armhf_latest
		sudo kpartx -a -v *.img
		mkdir rootmnt
		mkdir bootmnt
		# edit those to fit your loop. on ubuntu 18.04, it's loop8, in the tutorial they used loop0.
		# check the output of kpartx for your loop.
		sudo mount /dev/mapper/loop8p2 ~/rootmnt/
		sudo mount /dev/mapper/loop8p1 ~/bootmnt/
		sudo cp -a rootmnt/* /nfs/raspi_v0
		sudo cp -a bootmnt/* /nfs/raspi_v0/boot/
		cd /nfs/raspi_v0/boot

		# those might not be necessary anymore since the tutorial is old
		sudo rm start4.elf
		sudo rm fixup4.dat
		sudo wget https://github.com/Hexxeh/rpi-firmware/raw/master/start4.elf
		sudo wget https://github.com/Hexxeh/rpi-firmware/raw/master/fixup4.dat
		#

		sudo mkdir -p /tftpboot
		echo "/nfs/raspi_v0/boot /tftpboot none defaults,bind 0 0" | sudo tee -a /etc/fstab
		sudo mount /tftpboot
		sudo chmod 777 /tftpboot

		sudo touch /nfs/raspi_v0/boot/ssh
		sudo sed -i /UUID/d /nfs/raspi_v0/etc/fstab
		# we modified the ip. the server's IP will be 192.168.128.2
		echo "console=serial0,115200 console=tty root=/dev/nfs nfsroot=192.168.128.2:/nfs/raspi_v0,vers=3 rw ip=dhcp rootwait elevator=deadline" | sudo tee /nfs/raspi_v0/boot/cmdline.txt

		echo "/nfs/raspi_v0 *(rw,sync,no_subtree_check,no_root_squash)" | sudo tee -a /etc/exports
		sudo systemctl enable rpcbind
		sudo systemctl enable nfs-kernel-server
		sudo systemctl restart rpcbind
		sudo systemctl restart nfs-kernel-server

		sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
		# our DHCP range is from 192.168.128.100/24 to 192.168.128.200/24
		echo 'dhcp-range=192.168.128.100,192.168.128.200,12h' | sudo tee -a /etc/dnsmasq.conf
		echo 'log-dhcp' | sudo tee -a /etc/dnsmasq.conf
		echo 'enable-tftp' | sudo tee -a /etc/dnsmasq.conf
		echo 'tftp-root=/tftpboot' | sudo tee -a /etc/dnsmasq.conf
		echo 'pxe-service=0,"Raspberry Pi Boot"' | sudo tee -a /etc/dnsmasq.conf
		sudo systemctl enable dnsmasq
		sudo systemctl restart dnsmasq

		echo 
		echo
		echo
		echo "Please search for Network. Then go to Network > Wired > Settings (Cogwheel) > IPv4 > Set IPv4 Method to Manual > Set Adress to 192.168.128.2 > Set to Netmask 255.255.255.0 > Leave Gateway empty > apply and reboot the computer."

		cd
	else
		echo "You are not connected to the internet. Please connect to a network to proceed."
	fi
else
	echo "Please execute the script as normal user."
fi
