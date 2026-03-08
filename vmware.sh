#!/usr/bin/env bash
set -euo pipefail

echo
tput setaf 3
echo "######################################################"
echo "################### Install Vmware OpenTools"
echo "######################################################"
tput sgr0
echo
#Install Vmware OpenTools

sudo pacman -S --noconfirm --needed open-vm-tools gtkmm3
 

echo
tput setaf 3
echo "######################################################"
echo "################### Enable Services"
echo "######################################################"
tput sgr0
echo
# Enable Services
sudo systemctl enable --now vmtoolsd.service
sudo systemctl enable --now vmware-vmblock-fuse.service