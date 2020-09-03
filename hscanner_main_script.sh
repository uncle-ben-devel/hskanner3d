#!/bin/bash
clear
workpath="`pwd`/`dirname $0`"

$workpath/take_photos_script.sh -r 0 -t 10 -i 200
$workpath/generate_3d_data.sh -v
