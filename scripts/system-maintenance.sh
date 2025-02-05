#!/bin/bash

echo "Starting system maintenance..."

# Update system packages
echo "Updating system packages..."
sudo dnf update && sudo dnf upgrade -y

# Clean package cache
echo "Cleaning package cache..."
sudo dnf autoremove -y && sudo dnf clean all

# Update firmware
echo "Updating firmware..."
sudo fwupdmgr refresh && sudo fwupdmgr update -y

# Update Flatpaks
echo "Updating Flatpaks..."
flatpak update -y

# Run chkrootkit scan
echo "Running chkrootkit scan..."
sudo chkrootkit | tee ~/chkrootkit_scan.log

echo "System maintenance completed!"
