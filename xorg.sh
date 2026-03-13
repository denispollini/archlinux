#!/usr/bin/env bash
set -e
echo
tput setaf 3
echo "######################################################"
echo "################### Install Xorg"
echo "######################################################"
tput sgr0
echo
# Install Xorg
sudo pacman -S xorg  --noconfirm --needed

echo
tput setaf 3
echo "######################################################"
echo "################### Script completed"
echo "######################################################"
tput sgr0
echo