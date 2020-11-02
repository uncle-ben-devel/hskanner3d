#!/bin/bash
# this uses compound pi to capture the images.
# settings available can be taken from https://compoundpi.readthedocs.io/en/release-0.4/commands.html
	printf "\n\n\n\nSetting up capture...\n"
	# load config file
	cd "$(dirname "$(readlink -f "$0")")"
	cd ..
	. hskanner.config

	outputdir="$workpath"/10_image_gen_out/"$timestamp"

	if [ -d "$outputdir" ]; then
		echo "Output directory already exists. Removing old one."
		rm -R $outputdir
	fi
	mkdir -p "$outputdir"

# fire at will!
	# execute cpi_apply settings one before if you want custom settings
	python2 "$workpath"/01_image_gen/cpi_capture.py -o "$outputdir" -t "$selftimer" -a "$network_subnet" -n "$number_sensor_nodes"
	echo "Capture done."

	if (( openfilebrowser ))
	then
		echo "Opening file browser."
		nohup nautilus -w "$outputdir" > /dev/null 2>&1 & # nohup will execute nautilus async, and disconnected from the terminal. see https://stackoverflow.com/questions/2368137/asynchronous-shell-commands
	fi

	exit 0
