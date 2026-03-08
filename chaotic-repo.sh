#!/usr/bin/env bash
set -e

echo
tput setaf 3
echo "######################################################"
echo "################### Install Chaotic Repo"
echo "######################################################"
tput sgr0
echo
# Install Chaotic Repo
yes | sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
yes | sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U --noconfirm --needed 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 
sudo pacman -U --noconfirm --needed 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' 
echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf
yes | sudo pacman -Syu --noconfirm