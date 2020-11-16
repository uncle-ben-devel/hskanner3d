#!/usr/bin/env python
from sys import path, argv
from os import chdir
import configparser, subprocess, os

def exec_command(command):
    print("Executing \'", command, "\'.")
    process = subprocess.run(command, shell=True)
    print("_")

def exec_async(command):
    print("Executing \'", command, "\'.")
    process = subprocess.Popen(command, shell=True)
    print("_")

def main(argv):
    chdir("/")
    workpath = path[0]  # get absolute path of script

    config_obj = configparser.ConfigParser()
    config_obj.read(workpath + "/hskanner3d.config")
    #defaults_obj = config_obj['default']
    customs_obj = config_obj['custom']

    # load and calculate settings and constraints
    meshroomroot = customs_obj.get('meshroomroot')
    pipe_file = customs_obj.get('pipe_file')
    timestamp = argv[1]
    image_gen_out_dir = workpath + "/10_image_gen_out/" + timestamp
    image_filt_out_dir = workpath + "/11_image_filter_out/" + timestamp
    pipe_file_dir = workpath + "/03_3d_gen/" + pipe_file
    three_d_gen_out_dir = workpath + "/12_3d_gen_out/" + timestamp
    three_d_filt_out_dir = workpath + "/13_3d_filter_out/" + timestamp

    number_sensor_nodes = customs_obj.get('number_sensor_nodes')
    network_subnet = customs_obj.get('network_subnet')

    shutterspeed = customs_obj.get('shutterspeed')
    isosetting = customs_obj.get('isosetting')
    whitebalance = customs_obj.get('whitebalance')
    selftimer = customs_obj.get('selftimer')

    rotation = customs_obj.get('rotation')
    openfilebrowser = customs_obj.get('openfilebrowser')
    view_mesh = customs_obj.get('view_mesh')

    mode = argv[2] # modes: full (full high quality pipeline), capture (only take photos)
    # execute chain
    exec_command("clear")
    # turn on lights
    exec_command("python3.7 " + workpath + "/00_lighting_control/lighting_transmitter.py \"all_set.py 255 255 255 255\"")
    # take photos
    exec_command("python2 " + workpath + "/01_image_gen/cpi_capture.py " + "\"" + number_sensor_nodes + "\" \"" + image_gen_out_dir + "\" \"" + network_subnet + "\" \"" + selftimer + "\"")
    # open file browser if needed
    if openfilebrowser == '1':
        exec_async("nautilus -w \"" + image_gen_out_dir + "\" > /dev/null 2>&1 &")
    # change lights to idle mode
    exec_command("python3.7 " + workpath + "/00_lighting_control/lighting_transmitter.py \"comet_effect.py\"" )
    # filter images
    exec_command(workpath + "/02_image_filter/./image_filter_script.sh \"" + image_gen_out_dir + "\" \"" + image_filt_out_dir + "\" \"" + rotation + "\"")
    # generate mesh
    exec_command(workpath + "/03_3d_gen/./generate_3d_data_script.sh \"" + pipe_file_dir + "\" \"" + image_filt_out_dir + "\" \"" + three_d_gen_out_dir + "\"")
    # filter mesh

if __name__ == "__main__":
    main(argv)
#command = "python2 " + workpath + "/01_image_gen/cpi_apply_settings.py " + number_sensor_nodes + " " + isosetting + " " + shutterspeed + " " + whitebalance + " " + network_subnet
