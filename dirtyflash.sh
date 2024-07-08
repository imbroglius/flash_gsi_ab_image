#!/bin/bash

echo
echo "--------------------------------------"
echo "          Dirty Flash Script          "
echo "                  by                  "
echo "              Imbroglius              "
echo "--------------------------------------"
echo

set -e
read -p "Please connect your phone in Fastboot-Mode via USB and press any key"
fastboot reboot fastboot
fastboot flash system
fastboot reboot recovery

echo "Your phone will now start in recovery. Please reboot it to system."
