#!/bin/bash
clear

# paths and settings
	cd "$(dirname "$(readlink -f "$0")")"	# goes to the current path of this script as a reference. see https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself#59916
	. hskanner.config	# load config from hskanner.config file

# execution
	echo "DO NOT run this immediately after booting. The NTP client on the sensor nodes needs some time to sync up!"
    python3.7 "$workpath"/00_lighting_control/lighting_transmitter.py "all_set.py 255 255 255 255"
	"$workpath"/01_image_gen/take_photos_script.sh
    python3.7 "$workpath"/00_lighting_control/lighting_transmitter.py "comet_effect.py"
	"$workpath"/02_image_filter/image_filter_script.sh
	"$workpath"/03_3d_gen/generate_3d_data_script.sh
	"$workpath"/04_3d_filter/filter_3d_data_script.sh  
