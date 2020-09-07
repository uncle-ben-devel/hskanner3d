#!/bin/bash
clear

# paths
	workpath="$(dirname "$(readlink -f "$0")")"	#gets the current path of this script as a reference. see https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself#59916
	# directories for processing
	take_photos_script_dir="01_image_gen"	# path in reference to this script. absolute path will be generated automatically.
	image_filter_dir="02_image_filter"
	three_d_gen_dir="03_3d_gen"
	three_d_filter_dir="04_3d_filter"
	meshroomroot="$HOME/Documents/software/Meshroom-2019.2.0-linux/Meshroom-2019.2.0" # install directory of meshroom"
	#pipeline_file="compute_pointcloud.mg"
	pipeline_file="compute_tex_model.mg"
	pipeline_dir="03_3d_gen"
		tps_path="$workpath/$take_photos_script_dir"	# absolute path for take_photos_script.sh
		ifs_path="$workpath/$image_filter_dir"	# ... for image_filter_script.sh
		tdgs_path="$workpath/$three_d_gen_dir"	# ... for generate_3d_data_script.sh. td for three D.
		tdfs_path="$workpath/$three_d_filter_dir"	# ... for generate_3d_filter_script.sh
		pipe_path="$workpath/$pipeline_dir"	# ... for the meshroom pipeline file

	# directories for i/o
	timestamp=$(date "+%d-%h-%Y-%T")	# name for the folder where the images will be stored
	input_dir="10_input_dir"
	output_dir="11_output_dir"
		i_path="$workpath/$input_dir/$timestamp"	# image source directory
		o_path="$workpath/$output_dir/$timestamp"	# mesh output directory	
# settings
	# taking photos
		shutterspeed="16.67"	# shutter speed in ms. equals about 1/60s.
		isosetting="100"	# ISO. Max is 1600, Min is 50.
		whitebalance="auto"	# auto cloudy flash fluorescent horizon incandescent shade sunlight tungsten or red / blue gain in floating point (typical between 1.0 and 2.0)
		selftimer="10"	# waiting time before capture in seconds
		rotation="180"	#Rotate the output images by 0, 90, 180 or 270 degrees.
		openfilebrowser="1"	# bool if the filebrowser should be opened after the shots are taken
	# processing photos
		
	# generating 3d data
		view_mesh="1"	# if 0, will not open meshlab to view the generated mesh
	# processing 3d data

# execution
	mkdir -p $i_path # output path will be created by meshroom, if it succeeds.
	$tps_path/take_photos_script.sh -s $shutterspeed -i $isosetting -b $whitebalance -o $i_path -t $selftimer -f $openfilebrowser -r $rotation
	$tdgs_path/generate_3d_data_script.sh -i $i_path -o $o_path -p $pipeline_file -d $pipe_path -v $view_mesh
