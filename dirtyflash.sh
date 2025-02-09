#!/bin/bash

echo
echo "--------------------------------------"
echo "          Dirty Flash Script          "
echo "                  by                  "
echo "              Imbroglius              "
echo "--------------------------------------"
echo

set -e
FIMAGE=$1
read -p "Please connect your phone in Fastboot-Mode via USB and press any key"
fastboot reboot fastboot
fastboot flash system "$FIMAGE"
fastboot reboot recovery

echo "Your phone will now start in recovery. Please reboot it to system."
