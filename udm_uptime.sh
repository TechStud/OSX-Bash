# /bin/bash
# 
# NOTE: In order for this script to work best, you need to 
# 		have your public SSH Key already on the UDM.
#
#		- If the SSH Key is missing, you will be prompted
# 			for your password, multiple times
#
# This script will... 
# 1. Display the UDM Logo
# 2. Display the current date/time (pretty)
# 3. Get the current Uptime from the UDM (pretty)
#
################################################
# Sample Output: 
#  ___ ___      .__________.__
# |   |   |____ |__\_  ____/__|							<<+ 1.
# |   |   /    \|  ||  __) |  |   (c) 2010-2019			  |
# |   |  |   |  \  ||  \   |  |   Ubiquiti Networks, Inc. |
# |______|___|  /__||__/   |__|							  |
#            |_/                  http://www.ui.com		  |
#														  |
#      Welcome to UniFi Dream Machine!					  +-----
#
# Date/Time: Mon. Apr. 20, 2020 17:18:25 EDT			<< 2.
#    Uptime: 4 days, 16 hours, 55 minutes				<< 3.
#
################################################

# Provide the local UDM/UDMP Address
udmip="10.0.0.1"

clear
ssh -q root@$udmip cat /etc/motd
echo -e "\nDate/Time: $(date +'%a. %b. %d, %Y %T %Z')\n   Uptime: $(ssh -q root@$udmip uptime | sed -E 's/^[^,]*up *//; s/, *[[:digit:]]* users.*//; s/min/minutes/; s/[[:space:]]*([[:digit:]]+):0?([[:digit:]]+)/ \1 hours, \2 minutes/' | awk -F",  " '{print $1}')\n"
