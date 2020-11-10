#!/bin/bash

# this script will call meshroom functions to generate 3d data depending on the pipeline file used, and then open the generated model in meshlab (you need Meshlab installed for that to work)
	rm -R /tmp/MeshroomCache	# delete old data in the cache
	printf "\n\n\n\nSetting up generation of 3D data...\n"
	# load config file
    localpath="$(dirname "$(readlink -f "$0")")"
	cd "$localpath"
	cd ..
	. hskanner.config
    cd "$localpath"
	
	pipe_path="$workpath"/03_3d_gen/"$pipe_file"
	inputdir="$workpath"/11_image_filter_out/"$timestamp"
	outputdir="$workpath"/12_3d_gen_out/"$timestamp"

	if [ -d "$outputdir" ]; then
		echo "Output directory already exists. Removing old one."
		rm -R $outputdir
	fi
# execute the command in meshroom
	"$meshroomroot"/./meshroom_photogrammetry --pipeline "$pipe_path" --output "$outputdir"  --input "$inputdir"
# check if there were no errors in the pipeline by checking if the output directory exists
	if test -d "$outputdir"; then
		echo "Meshing completed successfully."
	else
		echo "Meshing failed."
		exit 1
	fi

	if (( view_mesh ))
	then
		if test -f "$outputdir/sfm.ply"
		then
			nohup meshlab "$outputdir"/sfm.ply > /dev/null 2>&1 &
		fi

		if test -f "$outputdir/texturedMesh.obj"
		then
			nohup meshlab "$outputdir"/texturedMesh.obj > /dev/null 2>&1 &
		fi
	fi
