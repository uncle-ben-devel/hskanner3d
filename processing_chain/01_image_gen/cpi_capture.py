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
    output_dir = argv[2]
    netw_addr = argv[3]
    wait_time = float(argv[4])

# dialing in settings
    with CompoundPiClient() as client:
        client.servers.network = netw_addr
        client.servers.find(number_sensor_nodes)
        assert len(client.servers) == number_sensor_nodes
# changing directory so that the output will be written to the correct directory	    
        os.makedirs(output_dir)  
        os.chdir(output_dir)

# capture images
	print '\nWaiting', wait_time, 'second(s) before capture.'
        if wait_time == 0.0:
            client.capture(count=1,video_port=False,quality=90) # take 1 shot, with the high quality port. no wait time means no synced capture, but also no dependency on NTP sync.
        else:
            client.capture(count=1,video_port=False,quality=90,delay=wait_time) # take 1 shot, with the high quality port. wait for user defined wait time to sync captures. NOTE: if the NTP server has not synced the RPi, and the timestamp is in the past, CPI hangs and locks the servers. A reboot of clients and server is needed in that case.
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
    main(argv)
