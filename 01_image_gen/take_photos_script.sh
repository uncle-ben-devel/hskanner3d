#!/bin/bash
# cleanup
clear

# this uses compound pi to capture the images. Change directories and number of nodes as fit.
# settings available can be taken from https://compoundpi.readthedocs.io/en/release-0.4/commands.html
printf "This script captures photos. Command line flag options:
	[-s] Override default shutter speed. Floating point, capture time in ms.
	[-i] ISO override. Values from 50 to 1600 are valid.
	[-b] White balance override. Default is automatic. Options:
		auto cloudy flash fluorescent horizon incandescent shade sunlight tungsten or red / blue gain in floating point (typical between 1.0 and 2.0)
	[-o] Output directory, absolute path
	[-t] Time in seconds to wait before capture.
	[-f] Open the file browser after taking the photos.
	[-r] Rotate the output images by 0, 90, 180 or 270 degrees.
"

# default settings
	number_sensor_nodes="9"		# amount of sensor nodes in the system
	subnet="192.168.128.0/24"	
	timestamp=$(date "+%d-%h-%Y-%T")	# name for the folder where the images will be stored
	image_dir=$HOME/Pictures/$timestamp	# rest of the path for the image storage
	# camera settings
	series_image_capture="1"	# the amount of images captured seqentially
	shutterspeed="16.67"		# shutter speed in ms. equals about 1/60s.
	isosetting="50"		# ISO. Max is 1600, Min is 50.
	imagesres="3280x2464"		# max res for camera module v2. see https://www.raspberrypi.org/documentation/hardware/camera/
	whitebalance="auto"	# auto cloudy flash fluorescent horizon incandescent shade sunlight tungsten or red / blue gain in floating point (typical between 1.0 and 2.0)

# config via flags, to overwrite default settings
# tutorial at https://www.lifewire.com/pass-arguments-to-bash-script-2200571
	sleepvar=0		# timer, waiting time in seconds
	rotatevar=0		# rotation of images after capture in degrees
	openfilebrowser=0	# bool if the filebrowser should be opened after the shots are taken
	while getopts o:s:i:b:t:f:r: option
	do
		case "${option}"
		in
			o) image_dir=${OPTARG};;	# part of the name for the folder where the images will reside
			s) shutterspeed=${OPTARG};;	# shutterspeed override
			i) isosetting=${OPTARG};;	# ISO override
			b) whitebalance=${OPTARG};; # whitebalance override
			t) sleepvar=${OPTARG};;	# timer for when you want to take selfies or something
			f) openfilebrowser=${OPTARG};;
			r) rotatevar=${OPTARG};; # rotation for images. first is a flag, second the degrees.
		esac
	done

	echo "Timer will wait for $sleepvar seconds before taking the shot."
	sleep $sleepvar

# fire at will!
	mkdir -p $image_dir
	printf "find $number_sensor_nodes \n exposure $shutterspeed \n iso $isosetting \n awb $whitebalance \n resolution $imagesres \n capture \n download \n quit" | cpi -n $subnet -o $image_dir --capture-count $series_image_capture	# this command basically enters all the config into the cpi console as a user would, with \n as enter between commands.

	echo "Capture done."

# optional processing & convenience
	if (( rotatevar ))	# if it's anything but zero degrees, we rotate.
	then
		echo "Rotating all images by $rotatevar degrees."
		cd $image_dir/
		# source for this line: https://askubuntu.com/questions/591733/rotate-images-from-terminal#593517
		for file in *.jpg; do convert $file -rotate $rotatevar $file; done
		cd
	fi

	if (( openfilebrowser ))
	then
		echo "Opening file browser."
		nohup nautilus -w $image_dir > /dev/null 2>&1 & # nohup will execute nautilus async, and disconnected from the terminal. see https://stackoverflow.com/questions/2368137/asynchronous-shell-commands
	fi
	exit 0
