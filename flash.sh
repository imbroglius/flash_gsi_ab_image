#!/bin/bash

echo
echo "--------------------------------------"
echo "          Flash GSI Script            "
echo "                  by                  "
echo "              Imbroglius              "
echo "--------------------------------------"
echo
echo
echo
echo
echo "--------------------------------------"
echo "           !!!ATTENTION!!!            "
echo "          use only when your          "
echo "    bootloader is already unlocked    " 
echo "         and you have already         "
echo "         a GSI ROM installed!         "
echo "--------------------------------------"
echo
echo
echo
read -p "Press any key to continue. Or exit the script with Strg+C"

set -e
FIMAGE=$1



rebootFastbootD () {
	read -p "Press any key to continue. The Image you want to flash is: $FIMAGE"
	echo "we now boot the phone into FastbootD"
	fastboot reboot fastboot
}

deletePartitions () {
	echo "Now we delete the partitions"
	fastboot delete-logical-partition product
	fastboot delete-logical-partition product_a
	fastboot delete-logical-partition product_b
}

flashSystem () {
	echo "Now the Image will be flashed to System partition."
	fastboot flash system "$FIMAGE"

}

rebootRecovery () {
	echo "Now the phone is rebooted into recovery"
	fastboot reboot recovery
}

rebootFastbootD
deletePartitions
flashSystem
rebootRecovery

echo "Your phone will now be rebooted into recovery mode"
echo "if it is no dirty flash please wipe data there"
echo "and reboot your phone."
