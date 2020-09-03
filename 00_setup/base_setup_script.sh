#!/bin/bash

if [[ $USER == "root" ]]
then
	echo "Muting sound output."
	amixer -D pulse set Master 1+ off
	echo "Creating template for new empty file."
	touch $HOME/Templates/emptyfile
	# base software installation
	echo "Updating repositories."
	apt-get update
	echo "Updating software."
	apt-get -y upgrade
	echo "Installing development software."
	apt-get install -y cutecom git meshlab

	#getting the username of the dev account. may be problematic with multiple users.
	usrname=$(eval getent passwd {$(awk '/^UID_MIN/ {print $2}' /etc/login.defs)..$(awk '/^UID_MAX/ {print $2}' /etc/login.defs)} | cut -d: -f1)
	echo "Adding user $usrname to group dialout so they can use the serial interface."
	usermod -a -G dialout $usrname
	
	echo echo echo
	echo "To turn off display blanking, go to Settings > Power > Blank screen and select the dropdown option Never."
	echo
	echo "Search for Software & Updates and go to Additional Drivers, then select Using NVIDIA Server Driver metapackage from nvivdia-driver-440-server (proprietary, tested)."
else
	echo "You are not root. Please execute this script as root or use sudo."
fi
