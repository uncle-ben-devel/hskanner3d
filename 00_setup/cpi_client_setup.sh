#!/bin/bash

# this script is for installing the compound pi program (remote image taking software) on the compute node.
# link to tutorial: https://compoundpi.readthedocs.io/en/release-0.4/quickstart.html
sudo add-apt-repository -y ppa:waveform/ppa
sudo apt-get update
sudo apt-get install -y compoundpi-client ntp

# needed dependency of cpi
sudo apt install -y python-pip
pip install setuptools
