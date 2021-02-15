# Purpose
#   Script for interfacing with compound pi, since using the command line interface sometimes fails (hangs the command line) for unknown reasons. Written with guidance from https://compoundpi.readthedocs.io/en/release-0.4/batch.html#compoundpiclient and https://www.tutorialspoint.com/python/python_command_line_arguments.htm
#   This script only writes the capture settings to the SN, so that it doesn't have to do that every capture, since it is time consuming.
####
# Usage
#   python2 cpi_apply_settings.py <int number_sensor_nodes> <int iso_setting> <float shutterspeed> <str whitebalance> <ip/cidr network_addr>
# ip/cidr notation: Give network, set host to 0 and give the number of ones in the subnet mask after a '/'.
# Examples: 192.168.0.0/16; 192.168.1.0/24; 192.0.0.0/8; ...
# The unit for the shutter speed is milliseconds (ms). 
# Possible whitebalance settings are: 'auto', 'cloudy', 'flash', 'fluorescent', 'horizon', 'incandescent', 'off', 'shade', 'sunlight' and 'tungsten'.

#!/usr/bin/env python2

from sys import argv
from compoundpi.client import CompoundPiClient

def main(argv):
    # config
    number_sensor_nodes = int(argv[1])
    isosetting = argv[2]
    shutterspeed = argv[3]
    whitebalance = argv[4]
    netw_addr = argv[5]

    # dialing in settings
    with CompoundPiClient() as client:
        client.servers.network = netw_addr
        client.servers.find(number_sensor_nodes)
        if len(client.servers) <= number_sensor_nodes:
            print('\n\n\n\nNot all clients have been found! You can either wait or reboot both systems.\n\n\n\n')
        assert len(client.servers) >= number_sensor_nodes
        print('Configuring servers.')
        client.resolution(3280,2464)	# max res for camera module v2. see https://www.raspberrypi.org/documentation/hardware/camera/
        #client.resolution(2592,1944)	# max res for camera module v1.
        client.agc('auto')
        client.awb(whitebalance)
        client.iso(isosetting)
        client.exposure('off',shutterspeed)    # set auto exposure off
        client.denoise(False)

        client.clear()
        client.close()

if __name__ == "__main__":
    main(argv)
