# Purpose
#   this script runs on the array_server/compute_node. It sends a message to each node with the broadcast IP (a.b.c.255) at the given port in the network. The message is received by the receivers, running on the sensor_nodes, and executed as a python3.7 script with superuser rights. This is very insecure, but it works and it is very simple.
####
# Usage
#   python3.7 lighting_transmitter.py "<str name_of_python_script_to_execute> <str script_argument1> <str script_argument2> <...> <str script_argumentN>"
# For example: 'python3.7 lighting_transmitter.py "all_set.py 255 255 255 255 120"' executes 'sudo python3.7 all_set.py 255 255 255 255 120' on the Raspberry Pies, turning on the LED strip to full brightness.

#!/usr/bin/env python
import socket
from sys import argv
#, path
#import os
#import subprocess

#os.chdir("/")
#workpath = path[0]  # get absolute path of script

message = argv[1] # message to send to server. executes "sudo python3.7 message".

# create network socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

try:
    print("Sending message \'", message,"\'.")
    s.sendto(bytes(message,"utf-8"),("192.168.128.255",5353))   # sends the message in the network 192.168.128.0/24 at the broadcast IP, port 5353.
finally:
    s.close()
