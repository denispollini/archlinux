#!/usr/bin/env bash
set -e

echo
tput setaf 3
echo "######################################################"
echo "################### Install VirtualBOX"
echo "######################################################"
tput sgr0
echo
# VirtualBOX

sudo pacman -S --noconfirm --needed virtualbox 
sudo pacman -S --noconfirm --needed virtualbox-host-dkms 
sudo pacman -S --noconfirm --needed virtualbox-guest-utils 

echo
tput setaf 3
echo "######################################################"
echo "################### Enable Services"
echo "######################################################"
tput sgr0
echo
# Enable Services
sudo systemctl enable vboxservice
sudo systemctl start vboxservice
