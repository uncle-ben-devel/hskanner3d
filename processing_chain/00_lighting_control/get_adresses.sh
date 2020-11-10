#!/bin/bash
	# load config file
    localpath="$(dirname "$(readlink -f "$0")")"
	cd "$localpath"
	cd ..
	. hskanner.config
    cd "$localpath"

    nmap -n "$network_subnet" | grep 'Nmap scan report for' | cut -f 5 -d ' ' > ip_adresses_list.txt
