#!/bin/bash

# Open-source Electronic Design Automation (EDA) software installation
# Written by ducpm, CoAsia SEMI
#
# ------------------------------------------------------------------------------------
# This should be the wrapper for OpenEDA tool installation
# Copy the deploy scripts to Home directory
sudo cp ./auto_eda_setup.sh ./deploy_open_pdks.sh ~
# Return to home directory & Start working from there
cd ~
# Start auto_eda_setup.sh bash script
sudo sh auto_eda_setup.sh
# ------------------------------------------------------------------------------------

