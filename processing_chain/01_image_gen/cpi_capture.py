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
    output_dir = expanduser("~/Pictures") # default dir will spam the Pictures dir of the user. Source: https://stackoverflow.com/questions/4028904/how-to-get-the-home-directory-in-python#4028943
    netw_addr = '192.168.128.0/24'
    wait_time = 0.0

# configuration using flags    
    try:
        opts, args = getopt.getopt(argv,"hn:s:i:w:o:t:a:")
    except getopt.GetoptError:
        print 'Use the [-h] flag to see options.'
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print 'This script interfaces with compound pi to capture photos. Command line flag options:\n\
    [-n] Number of SN in the array. Default: 1\n\
    [-o] Output directory, absolute path\n\
    [-t] Time to wait before capture.\n\
    [-a] Network address in format aaa.bbb.ccc.ddd.eee/CIDR'
            sys.exit()
        elif opt in ("-n"):
            number_sensor_nodes = int(arg)
        elif opt in ("-o"):
            output_dir = arg
        elif opt in ("-t"):
            wait_time = arg
        elif opt in ("-a"):
            netw_addr = arg

# dialing in settings
    with CompoundPiClient() as client:
        client.servers.network='192.168.128.0/24'
        client.servers.find(number_sensor_nodes)
        assert len(client.servers) == number_sensor_nodes

# changing directory so that the output will be written to the correct directory	    
        os.chdir(output_dir) 

# capture images
	print '\nWaiting', wait_time, 'second(s) before capture.'
        #client.capture(count=1,video_port=False,quality=100) # take 1 shot, with the high quality port, at 100% quality. wait for 0.5s plus user defined wait time to sync captures.
        client.capture(count=1,video_port=False,quality=100,delay=0.5+float(wait_time)) # take 1 shot, with the high quality port, at 100% quality. wait for 0.5s plus user defined wait time to sync captures. NOTE: if the NTP server has not synced the RPi, and the timestamp is in the past, CPI hangs and locks the servers. A reboot of clients and server is needed in that case.
# download images
        try:
            for addr, files in client.list().items():
                for f in files:
                    assert f.filetype == 'IMAGE'
                    print('Downloading from %s' % addr)
                    with io.open('%s.jpg' % addr, 'wb') as output:
                        client.download(addr, f.index, output)
        finally:
# clean up
            client.clear()
            client.close()

if __name__ == "__main__":
    main(sys.argv[1:])
