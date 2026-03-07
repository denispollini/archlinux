#!/bin/bash
set -e

echo
tput setaf 3
echo "######################################################"
echo "################### Install LightDM"
echo "######################################################"
tput sgr0
echo
# Install LightDM

sudo pacman -S lightdm --noconfirm --needed 
sudo pacman -S lightdm-gtk-greeter --noconfirm --needed
sudo pacman -S lightdm-gtk-greeter-settings --noconfirm --needed

echo
tput setaf 3
echo "######################################################"
echo "################### Enable Services"
echo "######################################################"
tput sgr0
echo
# Enable Services
sudo systemctl enable --now lightdm.service