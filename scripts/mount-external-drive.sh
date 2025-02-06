#!/bin/bash

# Define mount point and device
MOUNT_POINT="/mnt/ExternalStorage"
DEVICE_UUID="DF9B-A78A"

# Check if the drive is already mounted
if mount | grep -q "$MOUNT_POINT"; then
	# Prompt the user to unmount the drive
	echo "The drive is already mounted at $MOUNT_POINT."
	
	# Ask if the user wants to unmount
	read -p "Do you want to unmount it? (y/n):" choice
	if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
		# If user selects 'y', unmount the drive
		sudo umount "$MOUNT_POINT"
		echo "Drive unmounted successfully."
	else
		# If user selects 'n', abort the action
		echo "Drive remains mounted to $MOUNT_POINT."
	fi
else
	echo "The drive is not currently mounted."

	# Attempt to mount the drive
	sudo mount UUID="$DEVICE_UUID" "$MOUNT_POINT"

	# Verify if mounting was successful
	if mount | grep -q "$MOUNT_POINT"; then
		echo "Drive mounted successfully at $MOUNT_POINT."
	else
		echo "Failed to mount the drive. Check logs for errors."
	fi
fi
