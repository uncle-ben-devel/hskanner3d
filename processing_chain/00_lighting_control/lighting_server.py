# this script runs on the sensor_node. it hosts a server that clients can send messages to. the message is then executed on the pi as a python3.7 script with superuser rights. this is very insecure, but it works and it is very simple.

#!/usr/bin/env python
import socket
import subprocess
import sys
import os
import signal

def get_local_ip():
    command = "hostname -I" # get ip address of this machine via bash since it is simpler than python
    process = subprocess.run(command.split(), stdout=subprocess.PIPE, text=True)
    local_ip = process.stdout
    local_ip = local_ip.replace(" \n", "")  # get rid of formatting characters
    local_ip = local_ip.split()  # get rid of second etc. IP addresses
    local_ip = local_ip[0]  # get rid of second etc. IP addresses
    local_port = 5252
    print ("This machine's IP:", local_ip, ":", local_port)
    print("_")  # for visualization
    return local_ip, local_port

os.chdir("/")
workpath = sys.path[0]  # get absolute path of script

local_ip, local_port = get_local_ip()
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((local_ip, local_port))
s.listen(5) # listen queue of N

try:
    while True:
        # now our endpoint knows about the OTHER endpoint.
        clientsocket, address = s.accept()
        print("Connection from", address,"has been established.")
        full_msg = ''   # clear previous message
        while True:
            msg = clientsocket.recv(1)  # receive one byte (or bit?) - oddly, this is faster than using 8.
            if len(msg) <= 0:           # if message is over, stop receiving.
                break
            full_msg += msg.decode("utf-8") # append current snippet to message

        if len(full_msg) > 0:
            if 'process' in locals():
                print("Killing currently running LED script...")
                os.killpg(os.getpgid(process.pid), signal.SIGTERM)  # Send the signal to all the process groups. Kills the previously run LED driver script.
            command = "sudo python3.7 " + workpath + "/" + full_msg + ".py"
            print("Executing \'", command, "\'.")
            process = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True, preexec_fn=os.setsid)   # starts process async, and makes it easy to terminate later, see https://stackoverflow.com/questions/4789837/how-to-terminate-a-python-subprocess-launched-with-shell-true#4791612
            clientsocket.close()
            print("Connection with", address,"has been terminated.") 
            print("_")  # for visualization
            # if everything went fine, would be nice to send an ack signal back to the client
finally:
    print("This script is terminating...")
    if 's' in locals():
        s.close()
    if 'clientsocket' in locals():
        clientsocket.close()
    sys.exit()
