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

		# static setup
		echo "$HOME/nfs/raspi_v0 *(rw,sync,no_subtree_check,no_root_squash)" | sudo tee -a /etc/exports
		sudo mkdir -p $HOME/tftpboot
		echo "$HOME/nfs/raspi_v0/boot $HOME/tftpboot none defaults,bind 0 0" | sudo tee -a /etc/fstab
		sudo mount $HOME/tftpboot
		sudo chmod 777 $HOME/tftpboot

		sudo systemctl enable rpcbind
		sudo systemctl enable nfs-kernel-server
		sudo systemctl restart rpcbind
		sudo systemctl restart nfs-kernel-server

		sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.bak
		# our DHCP range is from 192.168.128.100/24 to 192.168.128.200/24
		echo 'dhcp-range=192.168.128.100,192.168.128.200,12h' | sudo tee -a /etc/dnsmasq.conf
		echo 'server=1.1.1.1' | sudo tee -a /etc/dnsmasq.conf	# dns servers
		echo 'server=1.0.0.1' | sudo tee -a /etc/dnsmasq.conf
		echo 'log-dhcp' | sudo tee -a /etc/dnsmasq.conf
		echo 'enable-tftp' | sudo tee -a /etc/dnsmasq.conf
		echo "tftp-root=$HOME/tftpboot" | sudo tee -a /etc/dnsmasq.conf
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
