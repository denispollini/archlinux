#!/usr/bin/env bash
set -e

echo
tput setaf 3
echo "######################################################"
echo "################### Install LightDM"
echo "######################################################"
tput sgr0
echo
# Install LightDM

sudo pacman -S --noconfirm --needed lightdm 
sudo pacman -S --noconfirm --needed lightdm-gtk-greeter 
sudo pacman -S --noconfirm --needed lightdm-gtk-greeter-settings 

echo
tput setaf 3
echo "######################################################"
echo "################### Enable Services"
echo "######################################################"
tput sgr0
echo
# Enable Services
sudo systemctl enable lightdm.service