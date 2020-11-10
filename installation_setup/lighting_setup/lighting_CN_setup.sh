#!/bin/bash
sudo apt-get install nmap python3.7
echo "Please run crontab -e and add \'@reboot sudo python3.7 /home/pi/light_control/lighting_server.py \' or equivalent to daemonize the server at boot."
