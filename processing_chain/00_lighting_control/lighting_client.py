# this script runs on the array_server/compute_node. it gets all the IPs from the subnet you give it, then sends a message to each node at the given port in the network. the message is received by the server, running on the sensor_nodes, and executed as a python3.7 script with superuser rights. this is very insecure, but it works and it is very simple.

#!/usr/bin/env python
import socket
import sys
import subprocess

message=sys.argv[1] # message to send to server. executes "sudo python3.7 message.py".

# create network socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# import Ip adresses from the ip_adresses_list.txt file, get local ip, get port from config file
command = "hostname -I" # get ip address of this machine via bash since it is simpler than python
process = subprocess.run(command.split(), stdout=subprocess.PIPE, text=True)
local_ip = process.stdout
local_ip = local_ip.replace(" \n", "")  # get rid of formatting characters
local_ip = local_ip.split()  # get rid of second etc. IP addresses
local_ip = local_ip[0]  # get rid of second etc. IP addresses
print("Local IP:", local_ip)
local_ip="192.168.128.2"

ip_adresses=["192.168.128.2","192.168.128.170"]

server_port = 5252

for ii in range(len(ip_adresses)):
    if ip_adresses[ii] != local_ip:
        print("Connecting to", ip_adresses[ii],".")
        s.connect((ip_adresses[ii], int(server_port)))
        print("Sending message", message,".")
        s.send(bytes(message,"utf-8"))
        print("Disconnecting from", ip_adresses[ii],".")
        s.close()
    ii += 1
