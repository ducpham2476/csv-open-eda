# Open-source Electronic Design Automation (EDA) software installation
# Script written by ducpm, CoAsia SEMI
#
## Information:
## The deploration of OpenPDKs toolkit, used for re-arranging the pulled Skywater SKY130nm PDK into familiar formats, based on R. Timothy Edwards OpenPDKs work
## For more about OpenPDKs, please visit: http://www.opencircuitdesign.com/open_pdks/install.html
# ------------------------------------------------------------------------------------
# ***
# Directories jumping baloney
cd ~/skywater-pdk
skywater_dir=`pwd`
cd ~
# ***
## Deploy open_pdks for compiling PDK
### Get the required files for open_pdks
git clone https://github.com/RTimothyEdwards/open_pdks && cd open_pdks
### Configure Skywater SKY130nm PDK installation
./configure 	--enable-sky130-pdk=${skywater_dir}	\
		--enable-sram-sky130			\
		--enable-alpha-sky130
### The following steps will take a while to complete, be patience
### Use GNU make to create the target before the PDK installation
make -j$(nproc)
### If make process encountered an error, use this command to clean the directory & start over
# make distclean
sudo make install
# ***
# ------------------------------------------------------------------------------------

