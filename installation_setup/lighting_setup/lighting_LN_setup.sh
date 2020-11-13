#!/bin/bash
sudo apt-get install python3-pip python3.7
pip3 install adafruit-circuitpython-neopixel
echo "Please run crontab -e and add \'@reboot sudo python3.7 /home/pi/light_control/lighting_receiver.py \' or equivalent to daemonize the server at boot."
