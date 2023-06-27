# csv_open_eda
## Information 
CoAsia SEMI VN &amp; Hanoi University of Science and Technology, Installation of open-source EDA tools &amp; PDK

## Description
This repository contains 02 bash scripts, that will help you set up the basic EDA (Electronic Design Automation) tools for VLSI back-end-of-line (BEOL) process, coupled with the most simplistic build of an open source PDK (Process Design Kit): Google Skywater SKY130nm, on to Linux - Ubuntu devices. \
Basically, just get the script, activate & wait for the results.

## Provided contents
The script contains the installation of: \
| Id | Content | Sub-content | Version | Description |
| :---: | --- | :--- | --- | :--- |
| 0 | Package updates | | | Update dependencies for EDA tool installations |
| | | git | 2.17.1 | For pulling required files |
| | | gcc | | |
| | | perl | v5.26.1 | | |
| | | make | 4.1 | GNU Make for building required packages |
| | | Python3 | 3.6.9 | Python 3.6+ is required |
| | | Pip3 | 9.0.1 | Python3 Package Manager |
| | | Python Virtual Environment | | python3-venv |
| 1 | Yosys | Synthesis | 0.7 | Open-source Design Synthesis tool |
| 2 | Magic | Layout | 8.3.406 | Magic VLSI Layout tool |
| | | Dependencies | | irsim csh tcsh m4 libx11-dev tk-dev tcl-dev |
| | | | | libcairo2 libcairo2-dev  mesa-common-dev libglu1-mesa-dev |
| 3 | OpenPDKs | Library builder | 1.0.122 | Rebuild the Open-source PDK into known construct |
| | Skywater SKY130nm | PDK | 1.0 | Google's Open-source Process Design Kit SKY130nm | 
| 4 | Docker | SW Container |
