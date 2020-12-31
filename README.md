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
## TL;DR Guide
WIP

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
## Software install
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
*   we need additional software that is not provided within the Ubuntu packages. Namely, [Meshroom](https://www.fosshub.com/Meshroom-old.html). Download it using the provided link, then move the folder named 'Meshroom-2019.2.0-linux' to /home/your-username-here/Documents/software. If the directory does not exist yet, create it. Alternatively, you can move it whereever you like and change the meshroomroot variable in the hskanner3d.config file. If you choose to use a version of Meshroom that is different from 2019.2.0-linux, make sure to correct this path in the config file as well.
*   to add the Raspberry Pi camera module to the camera database, replace the cameraSensors.db that comes with Meshroom (/aliceVision/share/aliceVision) with the one from /installation_setup.
*   if you want to be able to open the design files (CAD and simulation), you will need [Freecad WIP.WIP]() and [Blender WIP]() with the MDLab plugin and the demo assets.
*   to set up the array network, search for 'Network' and click on the one under the 'Settings' category. First, click on the gear by PCI Ethernet to get into the settings of the on-board ethernet. Under the 'IPv4' tab, select 'Manual' for IPv4 Method and enter 192.168.128.2 as Address, and 255.255.255.0 as subnet mask. Leave the gateway empty. Disable IPv6 in its tab by selecting the 'Disable' option for 'IPv6 Method'. Toggle the interface on and off to apply the new settings.
*   set up the NTP server by running
```
    echo "broadcast 192.168.128.255" | sudo tee -a /etc/ntp.conf
```
*   this will broadcast the time on the subnet 192.168.128.0/24.
*   make sure the PC has internet connection. Then, to enable PXE (booting the SNs over network) on the PC (AS) side, go to /installation_setup/pxe_setup. Afterwards, rightclick in the directory and select 'open in terminal' and execute
```
./pxe_setup_script_static.sh
```
*   this script sets up a dhcp server, a pxe server, fixes some common issues, and lays the groundwork for the SN to be able to boot from the ethernet interface. The DHCP server gives IP addresses from 192.168.128.100 to 192.168.128.200 to its clients. Make sure to change that when you have more than one hundred SN.
## Setup of the SN (and LN)
*   download [RaspiOS buster lite armhf](downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2020-12-04), then flash it to a micro SD card. I used the 2020-12-04 version, and that one works. To help making flashing using dd easier, you can use the 'Disks' utility in Ubuntu. First, unmount all partitions on the SD card by clicking on them and then on the sqare icon below the partitions. After that, you can format it by clicking on the three horizontal lines > Format Disk ... > Format ... > Format. You can also get the device lettering from here (/dev/sdX).
*   once it is flashed, open the file browser and navigate to /media/your-username-here/boot and create an empty file called 'ssh' by opening a terminal there and executing
```
    sudo touch ssh
```
*   this enables us to remote into the raspberry, omitting the use of a screen.
*   next, navigate to /media/your-username-here/rootfs/etc and execute
```
    sudo nano dhcpcd.conf
```
*   then, add the lines
```
    interface eth0
    static ip_address=192.168.128.10/24
```
*   to the end of the file to set a static IP for the pi. This makes it much easier to remote into it. Save the changes with Ctrl + S, then exit the editor using Ctrl + X.
*   navigate to /media/your-username-here/rootfs/home/pi, then copy over bootloader-flash-utils and cpi_setup from  the /installation_setup/ directory of hskanner3d.
*   then, copy over the 00_lighting_control directory from the /processing_chain of hskanner3d.
*   after the files have been copied over, you can eject the sd card and insert it into the Raspberry Pi.
*   power up the Raspberry Pi and connect it to the network.
*   open up a terminal on the PC (AS), and connect to the Pi using ssh:
```
    ssh pi@192.168.128.10
```
*   the password is raspberry.
*   first, we will flash a bootloader to the Pi that will allow it to boot over the network. To do that, go to the /bootloader-flash-utils directory using cd
```
    cd bootloader-flash-utils 
```
*   you can use tab for autocompletion.
*   then, execute
```
    sudo ./flash_bootloader.sh
```
*   the system will reboot and sever the ssh connection. Reconnect to it. If you want to flash multiple Pies, add a cron job @reboot that executes the flashing script. It will flash, do the WIP mandatory WIP reboot, then shut down.
*   once you are reconnected, you'll need internet access for the Raspberry. You can use USB tethering again. Test for internet connection using
```
    ping www.google.com
```
*   if you can't reach it, the Pi likely tries to access the internet using the ethernet interface, the local network. To circumvent this, execute
``` WIP
    sudo ip route delete default WIP
```
*   make sure you have internet access, then change directory (cd) to cpi_setup, then execute
```
    ./cpi_client_SN
```
*   then install the software required for the lighting to work using
```
    sudo apt-get install -y python3-pip python3.7
    sudo pip3 install adafruit-circuitpython-neopixel
```
*   to enable the lighting control at boot, run
```
crontab -e
```
*   and add '@reboot sudo python3.7 /home/pi/00_lighting_control/lighting_receiver.py' or equivalent, then save and exit.
*   next, we will remove the static IP we set for easy SSH. Execute
```
    sudo nano /etc/dhcpcd.conf
```
*   and delete the last two lines we added earlier.
*   enable the camera interface using
```
    sudo raspi-config
```
*   and navigating to Interfaces > Camera > enable
*   we can now shut down the Raspberry Pi using
```
    sudo shutdown now
```
*   and remove the micro SD card.
## Last steps for PXE booting
*   insert the SD card into the PC. Then, navigate to the /installation_setup/pxe_setup directory from hskanner3d and execute
```
    ./pxe_refresh_OS.sh
```
*   this script backs up the current OS setup, then takes the OS install from a SD card and copies it onto the local disk. Afterwards, it formats it in a way that wakes it compatible with network booting.
*   After the script has been executed, reboot. You can also remove the SD card now.
*   Powercycle the Raspberry Pi AFTER the PC has booted and been running for a little while. It should now boot from the network. To verify, execute
```
    cat /var/lib/misc/dnsmasq.leases
```
*   if there is no output, nothing has happened (yet). If everything goes smooth, the third field will have an IP address that was assigned to a Pi. The third field will say "raspberrypi" (the hostname of the device). The green status LED of the Pi should blink fast twice, then pause after it has booted. The first boot may take a while.
## Done!
*   now you can execute the GUI in a terminal.
```
    python3.7 $HOME/hskanner3d/processing_chain/hskanner3d_gui.py
```
