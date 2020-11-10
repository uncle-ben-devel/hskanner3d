#!/bin/bash
# This script filters the captured jpgs
	printf "\n\n\n\nSetting up image filtering...\n"
	# load config file
    localpath="$(dirname "$(readlink -f "$0")")"
	cd "$localpath"
	cd ..
	. hskanner.config
    cd "$localpath"

	inputdir="$workpath"/10_image_gen_out/"$timestamp"
	outputdir="$workpath"/11_image_filter_out/"$timestamp"
	
	# filter
	if [ -d "$outputdir" ]; then
		echo "Output directory already exists. Removing old one."
		rm -R $outputdir
	fi
	cp -r "$inputdir" "$outputdir"
	
	if (( rotation ))	# if it's anything but zero degrees, we rotate.
	then
		echo "Rotating all images by $rotation degrees."
		cd "$outputdir" || exit 1 # exit if cd fails
		# source for this line: https://askubuntu.com/questions/591733/rotate-images-from-terminal#593517
		for file in *.jpg; do convert "$file" -rotate "$rotation" "$file"; done
	fi
