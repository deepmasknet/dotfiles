#!/bin/bash

# List of essential packages (with dependencies)
packages=(
	"newsboat" # terminal rss reader
	"electrum" # bitcoin wallet
	"keepassxc" # offline password manager
	"balena-etcher" # live UBS flashing
	"firefox" # browser
	"feh" # image viewer
	"evince" # pdf reader
	"bleachbit" # secure file deletion
	"chkrootkit" # rootkit scanner
	"clamscan" # anti-virus scanner (need to verify)
	"clamav" # anti-virus scanner (need to verify)
	"freshclam" # anti-virus scanner (need to verify)
	"ffmpeg" # image converter
	"i3lock" # i3 screen lock
	"picom" # necessary for i3 config
	"protonvpn" # VPN client
	"rsync" # file syncing
	"veracrypt" # file/device encryption
	"yt-dlp" # video/audio downloader
)

# Install packages
echo "Installing packages..."
sudo dnf install -y "${packages[@]}"

# Other custom installation steps, if needed


echo "Packages installed!"
