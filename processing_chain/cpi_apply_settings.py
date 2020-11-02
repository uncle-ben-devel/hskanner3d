#!/usr/bin/env python2
# script for interfacing with compound pi, since using the command line interface sometimes fails (rarely) for unknown reasons
# written with guidance from https://compoundpi.readthedocs.io/en/release-0.4/batch.html#compoundpiclient and https://www.tutorialspoint.com/python/python_command_line_arguments.htm

import io
import sys, getopt, os
from os.path import expanduser  # for the home directory
from compoundpi.client import CompoundPiClient

def main(argv):

# default config
    number_sensor_nodes = 1
    isosetting = 100
    shutterspeed = 16.67  # shutterspeed in ms
    whitebalance = 'auto'
    netw_addr = '192.168.128.0/24'

# configuration using flags    
    try:
        opts, args = getopt.getopt(argv,"hn:s:i:w:o:t:a:")
    except getopt.GetoptError:
        print 'Use the [-h] flag to see options.'
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print 'This script interfaces with compound pi to capture photos. Command line flag options:\n\
    [-s] Override default shutter speed. Floating point, capture time in ms.\n\
    [-i] ISO override. Values from 50 to 1600 are valid.\n\
    [-n] Number of SN in the array. Default: 1\n\
    [-w] White balance override. Default is automatic. Options:\n\
		auto cloudy flash fluorescent horizon incandescent shade sunlight tungsten\n\
    [-a] Network address in format aaa.bbb.ccc.ddd.eee/CIDR'
            sys.exit()
        elif opt in ("-n"):
            number_sensor_nodes = int(arg)
        elif opt in ("-s"):
            shutterspeed = arg
        elif opt in ("-i"):
            isosetting = arg
        elif opt in ("-w"):
            whitebalance = arg
        elif opt in ("-a"):
            netw_addr = arg

# dialing in settings
    with CompoundPiClient() as client:
        client.servers.network='192.168.128.0/24'
        client.servers.find(number_sensor_nodes)
        assert len(client.servers) == number_sensor_nodes
        print('Configuring servers')
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
    main(sys.argv[1:])
