# Purpose
#   This script runs on the sensor_node. It has to be run in the background as a daemon and listens to broadcasts on the specified network and port. The received message is then executed locally as a python3.7 script with superuser rights. This is very insecure, but it works and it is very simple. Note that the scripts to execute have to reside in the same directory as the receiver script. To run it at startup, a simple @reboot cron job can be set up with 'crontab -e' and adding the line '@reboot /home/pi/lighting_control/lighting_receiver.py' or equivalent.
####
# Usage
#   python3.7 lighting_receiver.py
# this script has no additional arguments.

#!/usr/bin/env python
import socket
import subprocess
import sys
import signal
import os

#os.chdir("/")
workpath = sys.path[0]  # get absolute path of script

s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
s.bind(("192.168.128.255", 5353))

try:
    while True:
        msg = ''   # clear previous message
        while True:
            msg = s.recvfrom(1024)  # buffer of 1024
            msg = msg[0].decode("UTF-8")    # interpret the received bytes as UTF-8 characters
            break
        if len(msg) > 0:
            if 'process' in locals():   # we can only kill a script if it is running. If it's not, we'll trigger an error trying to kill something that does not exist.
                print("Killing currently running LED script...")
                os.killpg(os.getpgid(process.pid), signal.SIGTERM)  # Send the signal to all the process groups. Kills the previously run LED driver script and is needed to break from the infinite loop of the cosmetic idle script.
            command = "sudo python3.7 " + workpath + "/" + msg
            print("Executing \'", command, "\'.")
            process = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True, preexec_fn=os.setsid)   # starts process async, and makes it easy to terminate later, see https://stackoverflow.com/questions/4789837/how-to-terminate-a-python-subprocess-launched-with-shell-true#4791612
            print("_")  # for visualization
            # if everything went fine, would be nice to send an ack signal back to the client
finally:
    # ensures that we can restart the receiver again after closing it - if we don't close the socket, it will be occupied for a while.
    print("This script is terminating...")
    if 's' in locals():
        s.close()
