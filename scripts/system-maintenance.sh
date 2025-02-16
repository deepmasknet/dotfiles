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

# Update ClamAV virus database
echo "Updating virus database..."
sudo freshclam

# Run virus scan of vulnerable locations
echo "Running targeted virus scan..."
sudo clamscan -r ~/Downloads ~/Documents ~/Desktop ~/.local/bin ~/.config ~/.cache
sudo clamscan -r /tmp /var/tmp
grep "FOUND" /var/log/clamav/clamscan.log

echo "System maintenance completed!"
