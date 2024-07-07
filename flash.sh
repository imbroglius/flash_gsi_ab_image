#!/bin/bash

echo
echo "--------------------------------------"
echo "          Flash ImbrogliOS Script     "
echo "                  by                  "
echo "              Imbroglius            "
echo "--------------------------------------"
echo

set -e
FIMAGE=$1


rebootFastbootD () {
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
