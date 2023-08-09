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
./configure 	--enable-sky130-pdk=${skywater_dir} --with-sky130-variants=A
### The following steps will take a while to complete, be patience
### Use GNU make to create the target before the PDK installation
make -j$(nproc)
### If make process encountered an error, use this command to clean the directory & start over
# make distclean
sudo make install
# 
cd ~

### 
# ***
# ------------------------------------------------------------------------------------

# Proceed to make the test by viewing sky130A GDS file in Magic VLSI tools
# ***
# If Magic VLSI's console return the error below
# Error: Don't know how to read GDS-II. Nothing in "cifinput" section of tech file.
# 
# This error is caused by either:
## Magic VLSI invoke command is incorrect. The correct command for invoking & test a specific PDK is:
# magic -T sky130A; # With sky130A is the name of the PDK you want to test
#
## Or the .tech file of the PDK was not inserted to Magic VLSI's sys start-up directory. Execute these command to fix:
# sudo cp ~/open_pdks/sky130/sky130A/libs.tech/magic/sky130A*.tech /opt/magic-8.3/lib/magic/sys/
# sudo cp ~/open_pdks/sky130/sky130B/libs.tech/magic/sky130B*.tech /opt/magic-8.3/lib/magic/sys/
## Then try the invoke command again. You should be good to go

# ------------------------------------------------------------------------------------
