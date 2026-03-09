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