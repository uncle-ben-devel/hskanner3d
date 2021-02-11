# Purpose
#   This script filters the image output from the SN. Currently, it's only rotating the images so that it can be seen better by humans - the image orientation does not matter for the photogrammetry.
####
# Usage
#   ./image_filter_script.sh    <str input_directory> <str output_directory> <int rotation_degrees> <int scaling_percent>
# Directories should be put in as absolute, so from the filesystem root '/' up.
# Rotation in degrees. I have only tested 90, 180 and 270 - others may work, too.
# Scaling in percent, for downscaling. Makes computation faster and, with blurry images, more consistent.

#!/bin/bash
	inputdir="$1"
	outputdir="$2"
    rotation="$3"
    scale_percent="$4"  # percent of original file. 100 = x1, 50 = x0.5, ...
	
	if [ -d "$outputdir" ]; then
		echo "Output directory already exists. Removing old one."
		rm -R $outputdir
	fi
    mkdir -p "$outputdir"
	
    # the first filtering option copies the images over to the output
    cd "$inputdir" || exit 1 # exit if cd fails
    if (( $scale_percent != 100 )); then
        printf "Scaling images by $scale_percent"; echo "%... "
	    for file in *.*; do
            convert "$file" -filter point -resize "$scale_percent"% "$outputdir"/"$file"
        done
        printf "Done.\n\n"
    else
        echo "No scaling. Copying files to output folder."
        cp -RT "$inputdir" "$outputdir"
    fi

    # all further filtering options work on the already copied file. Add everything else here.
    if (( $rotation != 0 )); then
        echo "Rotating images by $rotation degrees..."
        cd "$outputdir" || exit 1 # exit if cd fails
        for file in *.*; do
            convert "$file" -rotate "$rotation" "$file"
        done
        printf "Done.\n\n"
    fi
