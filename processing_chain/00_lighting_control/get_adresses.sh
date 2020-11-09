#!/bin/bash
nmap -n $1 | grep 'Nmap scan report for' | cut -f 5 -d ' ' > ip_adresses_list.txt
