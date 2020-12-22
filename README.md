# HSkAnner 3D
3D scanning using a network of Raspberry Pies with camera modules and photogrammetry. This project is funded and overseen by Hochschule Karlsruhe - Technik und Wirtschaft and developed by Benedikt Reinberger. This project involves the design and assembly of a complete 3D scanner. If you want to build your own, this may be a good starting point.

# this project is still a WIP, and documentation will follow once finished.

# Installation Of Development Setup
## Hardware
To run your own instance of HSkanner3D or to set it up again from scratch, first gather the required hardware.

-   PC with NVidia GPU
-   keyboard, mouse, monitor for interfacing with the PC
-   1+ Raspberry Pi 4, Model B
-   one SD card, 16GB is plenty
-   1+ ethernet cable
-   an ethernet switch with at least one interface for each Raspberry Pi and the PC (unmanaged is fine)

## Naming
First, some naming conventions.
-   the PC will run computation of the 3D model, so it is the compute node (CN)
-   the PC will run networking and camera array control, so it is also the array server (AS)
-   the Raspberry Pies will be connected to the camera sensors and are used to interface the cameras to the network, so they are sensor nodes (SN)
-   for each bundle of SN that is part of a tower, there is one SN controlling the RGBW led strip for lighting and light effects, so it is also a lighting node (LN)

## Operating System Setup
The HSkanner3D software is designed around the linux family of operating systems, thus we will be installing a linux distro on our PC.
-   go to WIP ubuntu website / popos website WIP and download the latest .iso (HSkanner3D is known to work with Ubuntu 18.04 WIP and popos WIP)
-   on windows, download Rufus WIP link WIP and use it to flash the .iso to a USB medium from which we'll boot and install the OS
-   on linux, you can use dd to flash the .iso to an external installation medium
-   insert the newly created usb installation medium into the PC and boot from it (you can look up the function key for the boot menu of your motherboard in the manual, or go into the BIOS and use boot override if available)
-   follow the instructions of the installation and WIP
