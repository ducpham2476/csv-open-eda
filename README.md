# csv_open_eda
## Information 
CoAsia SEMI VN &amp; Hanoi University of Science and Technology, Installation of open-source EDA tools &amp; PDK

## Description
This repository contains 02 bash scripts, that will help you set up:
-  Basic EDA (Electronic Design Automation) tools for VLSI back-end-of-line (BEOL) process
-  Most simplistic build of an open source PDK (Process Design Kit): Google Skywater SKY130nm
  
On to Linux - Ubuntu devices. \
Basically, just get the script, activate & wait for the results.

## How-to-use
\# Get the 2 script files from the repository: auto_eda_setup.sh & deploy_open_pdks.sh \
\# Run the following command, *super-user permission is required*\
\# Sit back and wait for the script to finish. You are good to go.
> **sudo** **sh** *auto_eda_setup.sh*

## Provided contents
The script contains the installation of:
| Id | Content | Sub-content | Version | Description |
| :---: | --- | :--- | :---: | :--- |
| 0 | Package updates | __________| | Update dependencies for EDA tool installations |
| | | git | 2.17.1 | For pulling required files |
| | | gcc | _ | |
| | | perl | v5.26.1 | | |
| | | make | 4.1 | GNU Make for building required packages |
| | | Python3 | 3.6.9 | Python 3.6+ is required |
| | | Pip3 | 9.0.1 | Python3 Package Manager |
| | | Python Virtual Environment | | python3-venv |
| 1 | Yosys | Synthesis | 0.7 | Open-source Design Synthesis tool |
| 2 | Magic | Layout | 8.3.406 | Magic VLSI Layout tool |
| | | Dependencies | _ | irsim csh tcsh m4 libx11-dev tk-dev tcl-dev |
| | | | _ | libcairo2 libcairo2-dev  mesa-common-dev libglu1-mesa-dev |
| 3 | OpenPDKs | Library builder | 1.0.122 | Rebuild the Open-source PDK into known construct |
| | Skywater SKY130nm | PDK | 1.0 | Google's Open-source Process Design Kit SKY130nm | 
| 4 | Docker | Platform | 24.0.2 | Platform for deploying OpenLane VLSI Design flow, optional
| | OpenLane | VLSI flow | _ | VLSI Design flow, from RTL to GDSII, optional

## Credits
The scripts in this repository are crafted based on these sources:
1. [*How to install OpenROAD and Other VLSI tools under Ubuntu or Linux Mint, Iain Waugh, cadhut.com*](https://cadhut.com/2022/08/07/how-to-install-openroad-and-other-vlsi-tools-under-ubuntu-22-04-or-linux-mint-21/) 
2. [*Installing Open_PDKs version 1.0 for Google/SkyWater, R. Timothy Edwards, opencircuitdesign.com*](www.opencircuitdesign.com/open_pdks/install.html)
3. *CSV internal researches*
