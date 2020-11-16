#!/bin/bash
# This script filters the captured jpgs

	inputdir="$1"
	outputdir="$2"
    rotation="$3"
	
	# filter
	if [ -d "$outputdir" ]; then
		echo "Output directory already exists. Removing old one."
		rm -R $outputdir
	fi
    mkdir -p "$outputdir"
	cp -R "$inputdir" "$outputdir/.."
	
	if (( rotation ))	# if it's anything but zero degrees, we rotate.
	then
		echo "Rotating all images by $rotation degrees."
		cd "$outputdir" || exit 1 # exit if cd fails
		# source for this line: https://askubuntu.com/questions/591733/rotate-images-from-terminal#593517
		for file in *.jpg; do convert "$file" -rotate "$rotation" "$file"; done
	fi
