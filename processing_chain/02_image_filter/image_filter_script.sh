# Purpose
#   This script filters the image output from the SN. Currently, it's only rotating the images so that it can be seen better by humans - the image orientation does not matter for the photogrammetry.
####
# Usage
#   ./image_filter_script.sh    <str input_directory> <str output_directory> <int rotation_degrees> 
# Directories should be put in as absolute, so from the filesystem root '/' up.
# Rotation in degrees. I have only tested 90, 180 and 270 - others may work, too.

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
