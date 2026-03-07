#!/bin/bash
set -e

echo
tput setaf 3
echo "######################################################"
echo "################### Install Cinnamon"
echo "######################################################"
tput sgr0
echo
# Install DE Cinnamon
sudo pacman -S cinnamon  --noconfirm --needed