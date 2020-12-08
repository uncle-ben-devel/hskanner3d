# Purpose
#   Script for interfacing with compound pi, since using the command line interface sometimes fails (hangs the command line) for unknown reasons. Written with guidance from https://compoundpi.readthedocs.io/en/release-0.4/batch.html#compoundpiclient and https://www.tutorialspoint.com/python/python_command_line_arguments.htm
#   This script only captures images with the SN, for setting the settings, use cpi_apply_settings.
####
# Usage
#   python2 cpi_capture.py <int number_sensor_nodes> <str output_dir> <ip/cidr network_addr> <float wait_time>
# ip/cidr notation: Give network, set host to 0 and give the number of ones in the subnet mask after a '/'.
# Examples: 192.168.0.0/16; 192.168.1.0/24; 192.0.0.0/8; ...
# Directories should be put in as absolute, so from the filesystem root '/' up.
# The wait time is used as a self timer and to sync the captures. Note that it always takes longer to take the image than the wait time because there are more things to do until a capture can be done and I use the built-in delay function of compound pi, since that ensures capture sync (all cameras triggered at the same time).

#!/usr/bin/env python2

from io import open as io_open
from os import makedirs
from os import chdir
from sys import argv
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
        makedirs(output_dir)
        chdir(output_dir)

# capture images
	print '\nWaiting', wait_time, 'second(s) before capture.'
        if wait_time == 0.0:    # only wait if the wait time is not zero. If wait time is used but the clocks of the SN and the CN have not synced via NTP, it will sometimes wait for hours, days, or forever, depending on the clock difference.
            client.capture(count=1,video_port=False,quality=90) # take 1 shot, with the high quality port. no wait time means no synced capture, but also no dependency on NTP sync.
        else:
            client.capture(count=1,video_port=False,quality=90,delay=wait_time) # take 1 shot, with the high quality port. wait for user defined wait time to sync captures. NOTE: if the NTP server has not synced the RPi, and the timestamp is in the past, CPI hangs and locks the servers. A reboot of clients and server is needed in that case.
# download images
        try:
            for addr, files in client.list().items():
                for f in files:
                    assert f.filetype == 'IMAGE'
                    print('Downloading from %s' % addr)
                    with io_open('%s.jpg' % addr, 'wb') as output:
                        client.download(addr, f.index, output)
        finally:
# clean up
            client.clear()
            client.close()

if __name__ == "__main__":
    main(argv)
