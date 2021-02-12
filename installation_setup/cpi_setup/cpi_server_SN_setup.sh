#!/bin/bash
# see https://compoundpi.readthedocs.io/en/release-0.4/quickstart.html
	sudo apt-get install -y compoundpi-server ntp
	echo "server 192.168.128.2 prefer" | sudo tee -a /etc/ntp.conf
	echo "disable auth" | sudo tee -a /etc/ntp.conf
	echo "broadcastclient" | sudo tee -a /etc/ntp.conf
	echo "Reboot or powercycle if everything went smooth."
# you can see the results with "$ timedatectl". also useful for debug: "ntpq -p". For more info, see https://www.thegeekstuff.com/2014/06/linux-ntp-server-client/
