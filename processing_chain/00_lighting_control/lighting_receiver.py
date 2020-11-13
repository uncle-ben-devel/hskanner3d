# this script runs on the sensor_node. it hosts a server that clients can send messages to. the message is then executed on the pi as a python3.7 script with superuser rights. this is very insecure, but it works and it is very simple.

#!/usr/bin/env python
import socket
import subprocess
import sys
import os
import signal

os.chdir("/")
workpath = sys.path[0]  # get absolute path of script

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
s.bind(("192.168.128.255", 5353))

try:
    while True:
        msg = ''   # clear previous message
        while True:
            msg = s.recvfrom(1024)  # buffer of 1024
            msg = msg[0].decode("UTF-8")
            break
        if len(msg) > 0:
            if 'process' in locals():
                print("Killing currently running LED script...")
                os.killpg(os.getpgid(process.pid), signal.SIGTERM)  # Send the signal to all the process groups. Kills the previously run LED driver script.
            command = "sudo python3.7 " + workpath + "/" + msg
            print("Executing \'", command, "\'.")
            process = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True, preexec_fn=os.setsid)   # starts process async, and makes it easy to terminate later, see https://stackoverflow.com/questions/4789837/how-to-terminate-a-python-subprocess-launched-with-shell-true#4791612
            print("_")  # for visualization
            # if everything went fine, would be nice to send an ack signal back to the client
finally:
    print("This script is terminating...")
    if 's' in locals():
        s.close()
