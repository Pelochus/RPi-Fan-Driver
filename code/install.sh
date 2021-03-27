#!/bin/bash
#
# Title: ./install.sh
# Author: Pelochus
# Version: 1.0
# Brief: Installs RPi-Fan-Driver files

clear

echo
echo "--------------------------------------------------------------------------------------------"
echo "RUN THIS AS ROOT (sudo ./install.sh)"
echo "This scripts installs RPi-Fan-Driver files in your system"
echo "Before you continue make sure that previous steps mentioned in the instructions are complete"
echo "This includes calibrating minimum fan speed, GPIO pin used, fan speed, temps steps..."
echo "If you haven't done these steps do them now, else, continue"
echo "Do you want to continue? [Y/N]"
echo "--------------------------------------------------------------------------------------------"
echo

read continue

if [ $continue == 'Y' ] || [ $continue == 'y' ]; then
	sudo apt install rpi.gpio -y
	sudo cp ./rpi-fan-code/fan-control.service /lib/systemd/system
	sudo cp ./rpi-fan-code/rpi-fan-driver.py /usr/bin/rpi-fan-driver.py
	sudo systemctl enable fan-control.service
	echo "-------------------------------------------"
	echo "Finished. Changes will be applied at reboot"
	echo "-------------------------------------------"
else
	echo "-----------"
	echo "Exiting now"
	echo "-----------"
fi
