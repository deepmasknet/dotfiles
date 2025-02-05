#!/bin/bash

# Define mount point and device
MOUNT_POINT="/mnt/ExternalStorage"
DEVICE="/dev/sda1"

# Check if the drive is already mounted
if mount | grep "$MOUNT_POINT" > /dev/null; then
	# Prompt the user to unmount the drive
	echo "The drive is already mounted. Do you want to unmount it? (y/n)"
	read -r response

	if [[ "response" =~ ^[Yy]$ ]]; then
		# If user selects 'y', unmount the drive
		sudo umount "$MOUNT_POINT" && notify-send "Drive unmounted successfully."
	else
		# If user selects 'n', abort the action
		notify-send "Unmount aborted."
	fi
else
	# If the drive is not mounted, mount it
	sudo mount "$DEVICE" "$MOUNT_POINT" && notify-send "Drive mounted successfully."
fi
