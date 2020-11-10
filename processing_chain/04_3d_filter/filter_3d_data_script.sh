#!/bin/bash
	printf "\n\n\n\nSetting up filtering of 3D data...\n"
	# load config file
    localpath="$(dirname "$(readlink -f "$0")")"
	cd "$localpath"
	cd ..
	. hskanner.config
    cd "$localpath"

	inputdir="$workpath"/12_3d_gen_out/"$timestamp"
	outputdir="$workpath"/13_3d_filter_out/"$timestamp"

	# filter 3d data (placeholder)
	if [ -d "$outputdir" ]; then
		echo "Output directory already exists. Removing old one."
		rm -R $outputdir
	fi
	mkdir -p "$outputdir"
	cp -r "$inputdir" "$outputdir"
