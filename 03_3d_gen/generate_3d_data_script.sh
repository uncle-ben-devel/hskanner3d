#!/bin/bash

# this script will call meshroom functions to generate 3d data depending on the pipeline file used, and then open the generated model in meshlab (you need Meshlab installed for that to work)
clear
rm -R /tmp/MeshroomCache	# delete old data in the cache

printf "This script generates 3D data from photos. Command line flag options:
	[-i] Input directory
	[-o] Output directory
	[-p] Pipeline file name
	[-d] Pipeline directory
	[-v] Open the created .obj file in Meshlab after computing it
"
# default config
	timestamp=$(date "+%d-%h-%Y-%T")	# name for the folder where the output will be stored
	meshroomroot="$HOME/Documents/software/Meshroom-2019.2.0-linux/Meshroom-2019.2.0" # install directory of meshroom"
	#pipeline_file="compute_pointcloud.mg"
	pipeline_file="compute_tex_model.mg"
	pipeline_dir="$HOME/Documents/meshroom-workspace/00_settings_output"
	output_dir="$HOME/Documents/meshroom-workspace/00_settings_output/$timestamp"
	input_dir="$HOME/Pictures/$(ls -t -- $HOME/Pictures | head -n 1)"	# this gets the newest folder from the Pictures directory of the user. Link to tutorial: https://unix.stackexchange.com/questions/136976/get-the-latest-directory-not-the-latest-file

# config via flags, to overwrite default settings
# tutorial at https://www.lifewire.com/pass-arguments-to-bash-script-2200571
	openobj=0	# will open meshlab and the created .obj if true
	while getopts i:o:p:d:v: option
	do
		case "${option}"
		in
			i) input_dir="${OPTARG}";;	# override input directory
			o) output_dir="${OPTARG}";;	# override output directory
			p) pipeline_file="${OPTARG}";;	# override pipeline file name
			d) pipeline_dir="${OPTARG}";;	# override pipeline directory
			v) openobj="${OPTARG}";;
		esac
	done

	pipeline_full="$pipeline_dir/$pipeline_file"


# execute the command in meshroom
	$meshroomroot/./meshroom_photogrammetry --pipeline "$pipeline_full" --output "$output_dir"  --input "$input_dir"
# check if there were no errors in the pipeline by checking if the output directory exists
	if test -d "$output_dir"; then
		echo "Task completed successfully."
	else
		echo "Task failed."
		exit 1
	fi


	if (( openobj ))
	then
		if test -f "sfm.ply"
		then
			nohup meshlab $output_dir/sfm.ply > /dev/null 2>&1 &
		fi

		if test -f "texturedMesh.obj"
		then
			nohup meshlab $output_dir/texturedMesh.obj > /dev/null 2>&1 &
		fi
	fi
