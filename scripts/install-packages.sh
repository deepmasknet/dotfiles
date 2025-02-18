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
	"mpv" # CLI audio player
	"pulseaudio-utils" # volume control in i3
	"ranger" # file viewer
	"texlive-pdftex" # LaTeX package
	"texlive-latex" # LaTeX package
	"texlive-collection-latexrecommended" # LaTeX package
	"texline-titling" # LaTeX package
	"thunderbird" # Mozilla Thunderbird
	"chromium" # Chromium Browser
	"gnupg" # PGP key manager
	"transmission-cli" # Transmission BitTorrent CLI client
)

# Install packages
echo "Installing packages..."
sudo dnf install -y "${packages[@]}"

# Other custom installation steps, if needed


echo "Packages installed!"
