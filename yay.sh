#!/usr/bin/env bash
set -e

echo
tput setaf 3
echo "######################################################"
echo "###################  Install the prerequisite packages"
echo "######################################################"
tput sgr0
echo
#  Install the prerequisite packages
sudo pacman -Syu
sudo pacman -S --needed --noconfirm base-devel git

echo
tput setaf 3
echo "######################################################"
echo "################### Clone the Yay git repo and switch to it"
echo "######################################################"
tput sgr0
echo
# Clone the Yay git repo and switch to it
git clone https://aur.archlinux.org/yay.git
cd yay

echo
tput setaf 3
echo "######################################################"
echo "################### Install yay"
echo "######################################################"
tput sgr0
echo
# Install yay
makepkg -si

echo
tput setaf 3
echo "######################################################"
echo "################### Script completed"
echo "######################################################"
tput sgr0
echo