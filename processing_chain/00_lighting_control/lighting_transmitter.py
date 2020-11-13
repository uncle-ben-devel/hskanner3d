# this script runs on the array_server/compute_node. it gets all the IPs from the subnet you give it, then sends a message to each node at the given port in the network. the message is received by the server, running on the sensor_nodes, and executed as a python3.7 script with superuser rights. this is very insecure, but it works and it is very simple.

#!/usr/bin/env python
import socket
from sys import argv, path
import os
import subprocess

os.chdir("/")
workpath = path[0]  # get absolute path of script

message = argv[1] # message to send to server. executes "sudo python3.7 message".

# create network socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)


# define the port to attempt to connect to
server_port = 5252

try:
    print("Sending message \'", message,"\'.")
    s.sendto(bytes(message,"utf-8"),("192.168.128.255",5353))
finally:
    s.close()
