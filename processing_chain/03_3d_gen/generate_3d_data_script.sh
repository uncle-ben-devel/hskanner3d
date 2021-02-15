# Purpose
#   This script will call meshroom functions to generate 3d data depending on the pipeline file used, and then open the generated model in meshlab if the user wants to (Meshlab needs to be installed for that to work).
####
# Usage
#   ./ generate_3d_data_script.sh   <str meshroom_root_directory> <str pipeline_file_path> <str input_directory> <str output_directory> <bool view_mesh_after_computation>
# Directories should be put in as absolute, so from the filesystem root '/' up.
# pipeline_file_path is the full path, so /path/to/file/file_name.file_extension.
# view_mesh_after_computation can have two values: 0, meaning false and 1, meaning true.

#!/bin/bash

	rm -R /tmp/MeshroomCache	# delete old data in the cache

    meshroomroot="$1"
	pipe_path="$2"
	inputdir="$3"
	outputdir="$4"
    view_mesh="$5"

	if [ -d "$outputdir" ]; then
		echo "Output directory already exists. Removing old one."
		rm -R "$outputdir"
	fi
# execute the command in meshroom
	"$meshroomroot"/./meshroom_photogrammetry --pipeline "$pipe_path" --output "$outputdir"  --input "$inputdir"
# check if there were no errors in the pipeline by checking if the output directory exists. If it does not exist, Meshroom never generated data.
	if test -d "$outputdir"; then
		echo "Meshing completed successfully."
	else
		echo "Meshing failed."
		exit 1
	fi

	if (( view_mesh ))
	then
		if test -f "$outputdir/sfm.ply" # if point cloud was generated, open it
		then
			nohup meshlab "$outputdir"/sfm.ply > /dev/null 2>&1 &
		fi

		if test -f "$outputdir/texturedMesh.obj"    # if mesh was generated, open it
		then
			nohup meshlab "$outputdir"/texturedMesh.obj > /dev/null 2>&1 &
		fi
	fi
