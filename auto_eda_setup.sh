#!/bin/bash

# Open-source Electronic Design Automation (EDA) software installation
# Written by ducpm, CoAsia SEMI
#
## Information:
## - OS: Linux, Ubuntu distro
## - Version: Bionic Beaver - 18.04 LTS, clean minimum installation
## - Requirements: Based on the running machine. Keep the disk storage as large as possible.

# ------------------------------------------------------------------------------------
#
# These tools/PDK will be deployed on your home directory. Make sure to keep a modest storage space for this
cd ~

# ***
# Update essential tools
# The following tools/packages are needed for the installation of the EDA tools
# - Git, for cloning required repositories
# - GCC
# - GNU make
# - perl
# - tree, useful to display the information of working directory(ies)
# - vim, an powerful text-editor. You will need this for interacting with files.
# - Python 3.6+, Python Package-management system (pip), Python Virtual Environment (venv)
sudo apt-get update		-y
sudo apt-get install git 	-y
sudo apt-get install tree 	-y
sudo apt-get install gcc	-y
sudo apt-get install perl	-y
# Install GNU make
sudo apt-get install make	-y
# Install/Update Python3 (Python 3.6+) and PIP (Python Package-Management system)
sudo apt-get install python3		-y
sudo apt-get install pip3		-y
sudo apt-get install python3-venv	-y
# ***

# ------------------------------------------------------------------------------------
#
# For deploying OpenLane VLSI design flow
# Install Docker
## Cleaning before a fresh install
# for pkg in docker.io docker-doc docker-compose podman-docker containerd runc;
# do sudo apt-get remove $pkg; 
# done
# ## Docker installation
# ### Update & Install dependencies
# sudo apt-get update				-y
# sudo apt-get install ca-certificates curl gnupg	-y
# ###  Repository setup
# sudo install -m 0755 -d /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/ubuntu.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# sudo chmod a+r /etc/apt/keyrings/docker.gpg
# echo \
# "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
# "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
# sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# ### Install Docker Engine
# # sudo apt-get update
# sudo apt-get install 	docker-ce \
# 			docker-ce-cli \
# 			containerd.io \
# 			docker-buildx-plugin \
# 			docker-compose-plugin
# ### Verify that Docker installation is working properly
# # sudo docker run hello-world
# # ------------------------------------------------------------------------------------
# # Installation: OpenLane VLSI flow & tools
# git clone --depth 1 https://github.com/The-OpenROAD-Project/OpenLane.git
# cd ./OpenLane && make
# ### Verify that OpenLane flow is running properly
# # make test
# ### Return to home directory for later steps
# # cd ~
### If the console/terminal return "Basic test passed", then the tools are installed successfully
# ------------------------------------------------------------------------------------
#
# For the basics of Design Synthesis, you will need
# EDA Tool for the job: Yosys
# Process Design Kit (PDK), required for mapping the design into a specific technology: Skywater SKY130nm PDK
# Installation of the above tool/PDK:

# ***
## Install Yosys for Design Synthesis
sudo apt-get install	yosys 	-y

# ***
## Deploy Skywater SKY130nm PDK
### Skywater SKY130nm PDK is deployed using OpenPDKs, developed by R. Timothy Edwards.
### For more information, please refer to his web blog: http://www.opencircuitdesign.com/open_pdks/install.html
## PDK Manual Installation (For minimum usage)
git clone https://github.com/google/skywater-pdk && cd skywater-pdk
skywater_dir=`pwd`
### Use Git submodule to limit the database's target to latest files only
git submodule init libraries/sky130_fd_io/latest
git submodule init libraries/sky130_fd_pr/latest
git submodule init libraries/sky130_fd_sc_hd/latest
git submodule init libraries/sky130_fd_sc_hvl/latest
### The following commands are not required, but you can enable them for a much complex & diverse set of devices that can be used
### But enabling these also costs a lot of disk space, make sure that you have >100GB of storage before enabling these
# git submodule init libraries/sky130_fd_sc_hdll/latest
# git submodule init libraries/sky130_fd_sc_hs/latest
# git submodule init libraries/sky130_fd_sc_ms/latest
# git submodule init libraries/sky130_fd_sc_ls/latest
# git submodule init libraries/sky130_fd_sc_lp/latest
### Get the required files 
git submodule update
### Use GNU make to create target files
make timing
### Return to home directory
cd ~

# ***
## Install Magic tool for generating cell views
### Install dependencies, listed by R. Timothy Edwards
sudo apt-get install 	irsim	\
			csh	\
			m4	\
			libx11-dev	\
			tk-dev		\
			tcsh	\
			tcl-dev	\
			libcairo2 libcairo2-dev	\
			mesa-common-dev		\
			libglu1-mesa-dev	\
			-y
### Get the required files
git clone https://github.com/RTimothyEdwards/magic && cd magic
### Configure the installation
./configure	--prefix=/opt/magic-8.3
### Make target & Install
make
### If make process encountered any error, use this command to clean the directory & start over after fix the issue
# make distclean
sudo make install
### Add Magic executable path to shell start-up command file
printf '\n# Add magic to the path\nPATH=/opt/magic-8.3/bin:$PATH\n' >> ~/.bashrc

# ***
# OpenPDKs deploration
# Commands for deploying open_pdks
# Since the newly installed Magic tool will require a new Terminal to start working (Settings in ~/.bashrc need to be reload)
# A new Terminal will be invoked to execute the below commands using a separate script file instead
gnome-terminal -- sh -c "bash -c \". ~/.bashrc; sh ./deploy_open_pdks.sh; exec bash\""
## The content of deploy_open_pdks.sh is listed below
# ---
# ## Deploy open_pdks for compiling PDK
# ### Get the required files for open_pdks
# git clone https://github.com/RTimothyEdwards/open_pdks && cd open_pdks
# ### Configure Skywater SKY130nm PDK installation
# ./configure 	--enable-sky130-pdk=${skywater_dir}	\
# 		--enable-sram-sky130			\
# 		--enable-alpha-sky130
# ### The following steps will take a while to complete, be patience
# ### Use GNU make to create the target before the PDK installation
# make -j$(nproc)
# ### If make process encountered an error, use this command to clean the directory & start over
# # make distclean
# sudo make install
# ---
# ***

# ------------------------------------------------------------------------------------
