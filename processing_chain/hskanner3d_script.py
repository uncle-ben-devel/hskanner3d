# Purpose
#   This script controls the generation and filtering of 2D as well as 3D data. For that, it calls all the other scripts required and passes them the arguments it reads from the configuration file.
####
# Usage
#   python3.7 hskanner3d_script.py
# this script has no additional arguments.

#!/usr/bin/env python
from sys import path
from os import chdir
from time import localtime, strftime, sleep
import configparser, subprocess, os

class hska3d:
    # constructor, gets called whenever a hska3d object is created. Is used to initialize the LED strip as well as loading all variables from the configuration file.
    def __init__(self):
        chdir("/")
        self.workpath = path[0]  # get absolute path of script
        self.config_obj = configparser.ConfigParser()
        self.config_obj.read(self.workpath + "/hskanner3d.config")
        self.customs_obj = self.config_obj['custom']

        # load and calculate settings and constraints
        self.meshroomroot = self.customs_obj.get('meshroomroot')
        self.pipe_file_hq = self.customs_obj.get('pipe_file_hq')
        self.pipe_file_fast = self.customs_obj.get('pipe_file_fast')
        self.timestamp = strftime("%d-%m-%Y_%H:%M:%S", localtime())
        self.image_gen_out_dir = self.workpath + "/10_image_gen_out/" + self.timestamp
        self.image_filt_out_dir = self.workpath + "/11_image_filter_out/" + self.timestamp
        self.pipe_file_dir_hq = self.workpath + "/03_3d_gen/" + self.pipe_file_hq
        self.pipe_file_dir_fast = self.workpath + "/03_3d_gen/" + self.pipe_file_fast
        self.three_d_gen_out_dir = self.workpath + "/12_3d_gen_out/" + self.timestamp
        self.three_d_filt_out_dir = self.workpath + "/13_3d_filter_out/" + self.timestamp

        self.number_sensor_nodes = self.customs_obj.get('number_sensor_nodes')
        self.network_subnet = self.customs_obj.get('network_subnet')

        self.shutterspeed = self.customs_obj.get('shutterspeed')
        self.isosetting = self.customs_obj.get('isosetting')
        self.whitebalance = self.customs_obj.get('whitebalance')
        self.selftimer = self.customs_obj.get('selftimer')

        self.rotation = self.customs_obj.get('rotation')
        self.scaling = self.customs_obj.get('scaling')
        self.openfilebrowser = self.customs_obj.get('openfilebrowser')
        self.view_mesh = self.customs_obj.get('view_mesh')

        self.strip_length = self.customs_obj.get('strip_length')
        self.comet_tail_length = self.customs_obj.get('comet_tail_length')
        self.comet_brightness = self.customs_obj.get('comet_brightness')
        self.comet_r = self.customs_obj.get('comet_r')
        self.comet_g = self.customs_obj.get('comet_g')
        self.comet_b = self.customs_obj.get('comet_b')
        self.comet_w = self.customs_obj.get('comet_w')
        self.comet_sleeptime = self.customs_obj.get('comet_sleeptime')

        # finished loading variables. now putting led strips in idle mode.
        self.idle_led_strip()

    # this function executes a command in sync, meaning whatever command you use will have to be finished for the next command to be executed.
    def exec_command(self, command):
        print("Executing \'", command, "\'.")
        process = subprocess.run(command, shell=True)
        print("_")

    # this function executes a command in async, meaning the command will run in the background.
    def exec_async(self, command):
        print("Executing \'", command, "\'.")
        process = subprocess.Popen(command, shell=True)
        print("_")

    def test_led_strip(self):
        self.exec_command("python3.7 " + self.workpath + "/00_lighting_control/lighting_transmitter.py \"strip_test.py\"")

    def idle_led_strip(self):
        self.exec_command("python3.7 " + self.workpath + "/00_lighting_control/lighting_transmitter.py \"comet_effect.py " + self.strip_length + " " + self.comet_tail_length + " " + self.comet_brightness + " " + self.comet_r + " " + self.comet_g + " " + self.comet_b + " " + self.comet_w + " " + self.comet_sleeptime + "\"")

    def cycle_lights(self):
        # turns lights on, waits, then turns them off. For taking photos mainly.
        # turn on lights async after the selftimer, so that they are not on full blast during waiting.
        self.exec_async("sleep "+ self.selftimer + " && " + "python3.7 " + self.workpath + "/00_lighting_control/lighting_transmitter.py \"all_set.py 255 255 255 255 " + self.strip_length + "\"")
        sleep(0.5)
        # change lights back to idle mode
        self.idle_led_strip()
                
    def apply_settings(self):
        # applies settings from config to compound pi
        self.exec_command("python2 " + self.workpath + "/01_image_gen/cpi_apply_settings.py \"" + self.number_sensor_nodes + "\" \"" + self.isosetting + "\" \"" + self.shutterspeed + "\" \"" + self.whitebalance + "\" \"" + self.network_subnet + "\"")

    # function for taking images and everything needed for that to go smoothly, e.g. turning the LED strip to full brigtness for illumination.
    def gen_2d(self):
        self.exec_command("clear")
        # turn the lighting on and off async for the shots. Ideally, you would turn them on synced right before the capture, then idle them right after. However, since CPi is slow, the lighting always goes first, even if executed async.
        self.cycle_lights()
        # take photos
        self.exec_command("python2 " + self.workpath + "/01_image_gen/cpi_capture.py " + "\"" + self.number_sensor_nodes + "\" \"" + self.image_gen_out_dir + "\" \"" + self.network_subnet + "\" \"" + self.selftimer + "\"")
        # open file browser if needed
        if self.openfilebrowser == '1':
            self.exec_async("nautilus -w \"" + self.image_gen_out_dir + "\" > /dev/null 2>&1 &")  

    def filter_2d(self):
        # filter images
        self.exec_command(self.workpath + "/02_image_filter/./image_filter_script.sh \"" + self.image_gen_out_dir + "\" \"" + self.image_filt_out_dir + "\" \"" + self.rotation + "\" \"" + self.scaling + "\"")
      
    def gen_3d(self, hq_or_fast):
        if hq_or_fast == "hq":
            self.exec_command(self.workpath + "/03_3d_gen/./generate_3d_data_script.sh \"" + self.meshroomroot + "\" \"" + self.pipe_file_dir_hq + "\" \"" + self.image_filt_out_dir + "\" \"" + self.three_d_gen_out_dir + "\" \"" + self.view_mesh + "\"" )
        else:
            self.exec_command(self.workpath + "/03_3d_gen/./generate_3d_data_script.sh \"" + self.meshroomroot + "\" \"" + self.pipe_file_dir_fast + "\" \"" + self.image_filt_out_dir + "\" \"" + self.three_d_gen_out_dir + "\" \"" + self.view_mesh + "\"" )

    def filter_3d(self):
        pass # doesn't do anything yet.
    
    def run(self, hq_or_fast):
        self.gen_2d()
        self.filter_2d()
        self.gen_3d(hq_or_fast)
        self.filter_3d()

def main():
    hs = hska3d() # create an object of the hska3d class, which will load some of its variables from the defined config file, and calculate the rest of them.
    hs.run("fast")

if __name__ == "__main__":
    main()
