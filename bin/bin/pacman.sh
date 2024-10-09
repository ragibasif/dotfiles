#!/bin/bash

# Update the System
sudo pacman -Syu

# Remove Unused Packages
sudo pacman -Rns $(pacman -Qdtq)

# Clean the Package Cache
## sudo pacman -S pacman-contrib -> to use paccache
sudo paccache -ruk0
sudo pacman -Sc

# Check for Keyring Updates
sudo pacman -Sy archlinux-keyring

# List Outdated AUR Packages
yay -Qu --aur

# Run above pacman commands for aur packages
yay -Syu
yay -Rns $(pacman -Qdtq)
yay -Sc


# Check for Failed Systemd Services
systemctl --failed
