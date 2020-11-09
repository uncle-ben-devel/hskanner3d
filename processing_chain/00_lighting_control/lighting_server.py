# this script runs on the sensor_node. it hosts a server that clients can send messages to. the message is then executed on the pi as a python3.7 script with superuser rights. this is very insecure, but it works and it is very simple.

#!/usr/bin/env python
import socket
import subprocess
from signal import signal, SIGPIPE, SIG_DFL
signal(SIGPIPE,SIG_DFL) 


def get_local_ip():
    command = "hostname -I" # get ip address of this machine via bash since it is simpler than python
    process = subprocess.run(command.split(), stdout=subprocess.PIPE, text=True)
    local_ip = process.stdout
    local_ip = local_ip.replace(" \n", "")  # get rid of formatting characters
    local_ip = local_ip.split()  # get rid of second etc. IP addresses
    local_ip = local_ip[0]  # get rid of second etc. IP addresses
    local_port = 5252
    print ("This machine's IP:", local_ip, ":", local_port)
    return local_ip, local_port

local_ip, local_port = get_local_ip()
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((local_ip, local_port))
s.listen(5)


while True:
    # now our endpoint knows about the OTHER endpoint.
    clientsocket, address = s.accept()
    print("Connection from", address,"has been established.")
    full_msg = ''   # clear previous message
    while True:
        msg = clientsocket.recv(1)  # receive one byte
        if len(msg) <= 0:           # if message is over, stop receiving.
            break
        full_msg += msg.decode("utf-8") # append current byte to message

    if len(full_msg) > 0:
        if 'process' in locals():
            process.kill()
        command = "sudo python3.7 " + full_msg + ".py"
        print("Received message:", full_msg)
        print("Executing \'", command, "\'.")
        #process = subprocess.run(command.split(), stdout=subprocess.PIPE)
        process = subprocess.Popen(command.split(), stdout=subprocess.PIPE)
        clientsocket.close()
        print("Connection with", address,"has been terminated.")    

