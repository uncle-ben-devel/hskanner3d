# HSkanner3D
3D scanning using a network of Raspberry Pies with camera modules and photogrammetry. This project is funded and overseen by Hochschule Karlsruhe - Technik und Wirtschaft and developed by Benedikt Reinberger. This project involves the design and assembly of a complete 3D scanner. If you want to build your own, this may be a good starting point.

# this project is still a WIP, and documentation will follow once finished.

# Installation Of Development Setup
## Hardware
To run your own instance of HSkanner3D or to set it up from scratch, first gather the required hardware.

*   PC with NVidia graphics card (needed for photogrammetry software Meshroom, uses CUDA exclusively)
*   keyboard, mouse, monitor for interfacing with the PC
*   one or more Raspberry Pi 4, Model B
*   one SD card, 16GB is plenty
*   one or more ethernet cable(s)
*   an ethernet switch with at least one interface for each Raspberry Pi and the PC (unmanaged is fine)

## Naming Conventions
First, some naming conventions.

*   the PC will run computation of the 3D model, so it is the compute node (**CN**)
*   the PC will run networking and camera array control, so it also is the array server (**AS**)
*   the Raspberry Pies will be connected to the camera sensors and are used to interface the cameras to the network, so they are sensor nodes (**SN**)
*   the SN are attached to metal structures to keep them suspended at a calculated height and angle. The metal structures are called **tower**s.
*   for each tower, there is one SN controlling the RGBW led strip for lighting and light effects. That one also is a lighting node (**LN**).

## Operating System Setup
The HSkanner3D software is designed around the linux family of operating systems, thus we will be installing a linux distro on our PC to turn it into the CN and AS.

*   go to [the download page for Ubuntu 18.04](releases.ubuntu.com/18.04) and download the Ubuntu 18.04 .iso (HSkanner3D is known to work with Ubuntu 18.04 - other distros or versions may work, but 18.04 has all the required software in the repositories). I recommend Ubuntu because it has the option to easily install and run the proprietary NVidia driver, which is needed for smooth operation. The checksum of the .iso I used is WIP WIP.
*   on windows, download [Rufus](https://rufus.ie/downloads/) or a similar tool and use it to flash the .iso to a USB medium from which we'll boot and install the OS.
*   on linux, you can use dd to flash the .iso to an external installation medium using
```
    sudo dd if=/path/to/iso/name_of_iso.iso  of=/dev/sdx status=progress conv=sync
    #    /dev/sdx should be subsituted for the drive you want to flash the .iso to. Note that all partitions from that drive have to be unmounted first for dd to work.
```
*   insert the newly created usb installation medium into the PC and boot from it (you can look up the function key for the boot menu of your motherboard in the manual, or go into the BIOS and use boot override if available).
*   follow the instructions of the installation.
*   you will likely want to make a clean install, erasing everything on the OS disk before flashing the new OS. Make sure you backed up any important files or partitions you want to keep beforehand, using a tool like WIPclonezilla WIP for partitions and OS installs, or just copying the files to external media. I chose the minimal install, but either one should be fine. You can leave the boxes for third parties and updates unticked, we will deal with those manually.
*   to make networking easier, I recommend getting internet into the PC by using a different network interface than the one connected to the scanning array. The easiest way to do this is to use a smartphone connected to the PC using USB tethering. To do that, go to Settings > Network and Internet > Hotspot and tethering and toggle the USB tethering option while the phone is connected to the internet by the means of WiFi. Note that you have to toggle it every time the PC is rebooted.
*   if you chose Ubuntu 18.04, you will have to manually enable the proprietary NVidia drivers after the first boot. Press the Windows (Super) key on the keyboard and type "Software & Updates" to search for it. Click on the first result and navigate to the "Additional drivers" tab, then select the latest proprietary driver and install it.
*   now that we have internet access on the PC, it is time to install the software.
*   open a terminal by pressing the Windows (Super) key and typing "terminal", then clicking on the icon or pressing enter.
*   first, we will install git, a version control system I used when I developed the software. This will be used to download all the project files to the target machine. To do that, type
```
    sudo apt-get install -y git
```
*   and press enter.
*   now that git is installed, we will download the project files by execution of
```
    git clone https://github.com/uncle-ben-devel/hskanner3d.git
```
*   this will create the development folder of the project on the PC at the home directory root. (/home/your-username-here/)
*   now you can open this file (README.md) in a text editor of your choice and copy the commands directly instead of typing them out. You can do that by selecting the text with the mouse, then mousewheel clicking inside the terminal.
*   install the required software by execution of the following line:
```
    sudo add-apt-repository -y ppa:waveform/ppa && sudo apt-get update && sudo apt-get install -y meshlab python3-tk ntp python-pip python3-pip python3.7 compoundpi-client && pip install setuptools 
    # meshlab: used as 3D data visualizer
    # python3-tk: python3 library for GUI development
    # ntp: service for time sync over the network
    # python-pip: source for python2.x software
    # python3-pip: source for python3.x software
    # python3.7: the version of python that is verified to work with all the involved software and scripts. Other versions may work, but are not tested.
    # compoundpi-client: part of the image capture software running on the AS.
```
*   enter the password if WIP prompted. WIP
*   we need additional software that is not provided within the Ubuntu packages. Namely, [Meshroom](WIP). Download it using the provided link, then move the folder named 'Meshroom-2019.2.0-linux' to /home/your-username-here/Documents/software. If the directory does not exist yet, create it. Alternatively, you can move it whereever you like and change the meshroomroot variable in the hskanner3d.config file. If you choose to use a version of Meshroom that is different from 2019.2.0-linux, make sure to correct this path in the config file as well.
*   if you want to be able to open the design files (CAD and simulation), you will need [Freecad WIP.WIP]() and [Blender WIP]() with the MDLab plugin and the demo assets.
*   to set up the array network, search for 'Network' and click on the one under the 'Settings' category. First, click on the gear by PCI Ethernet to get into the settings of the on-board ethernet. Under the 'IPv4' tab, select 'Manual' for IPv4 Method and enter 192.168.128.2 as Address, and 255.255.255.0 as subnet mask. Leave the gateway empty. Disable IPv6 in its tab by selecting the 'Disable' option for 'IPv6 Method'. Toggle the interface on and off to apply the new settings.
*   set up the NTP server by running
```
    echo "broadcast 192.168.128.255" | sudo tee -a /etc/ntp.conf
```
*   this will broadcast the time on the subnet 192.168.128.0/24.

