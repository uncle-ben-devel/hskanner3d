#!/usr/bin/env python2
# script for interfacing with compound pi, since using the command line interface sometimes fails (rarely) for unknown reasons
# written with guidance from https://compoundpi.readthedocs.io/en/release-0.4/batch.html#compoundpiclient and https://www.tutorialspoint.com/python/python_command_line_arguments.htm

import io, os
from sys import argv
from os.path import expanduser  # for the home directory
from compoundpi.client import CompoundPiClient

def main(argv):

# config
    number_sensor_nodes = int(argv[1])
    isosetting = argv[2]
    shutterspeed = argv[3]
    whitebalance = argv[4]
    netw_addr = argv[5]

    print(number_sensor_nodes, isosetting, shutterspeed, whitebalance, netw_addr)

# dialing in settings
    with CompoundPiClient() as client:
        client.servers.network = netw_addr
        client.servers.find(number_sensor_nodes)
        assert len(client.servers) == number_sensor_nodes
        print('Configuring servers.')
        #client.resolution(3280,2464)	# max res for camera module v2. see https://www.raspberrypi.org/documentation/hardware/camera/
        client.resolution(2592,1944)	# max res for camera module v1.
        client.agc('auto')
        client.awb(whitebalance)
        client.iso(isosetting)
        client.exposure('off',shutterspeed)    # set auto exposure off
        client.denoise(False)

        client.clear()
        client.close()

if __name__ == "__main__":
    main(argv)
