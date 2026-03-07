#!/bin/bash
set -e

echo
tput setaf 3
echo "######################################################"
echo "################### Install and Change Shell to Fish"
echo "######################################################"
tput sgr0
echo
# Install and Change Shell to Fish
sudo pacman -S fish --noconfirm --needed
chsh -s /usr/bin/fish $USER