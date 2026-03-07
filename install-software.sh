#!/bin/bash
set -e

echo
tput setaf 3
echo "######################################################"
echo "################### Install Software"
echo "######################################################"
tput sgr0
echo
# Install Software
sudo pacman -S linux-headers --noconfirm --needed
sudo pacman -S anydesk-bin --noconfirm --needed
sudo pacman -S rustdesk-bin --noconfirm --needed
sudo pacman -S base-devel --noconfirm --needed
sudo pacman -S bash-completion --noconfirm --needed
sudo pacman -S git --noconfirm --needed
sudo pacman -S go --noconfirm --needed
sudo pacman -S terminator --noconfirm --needed
sudo pacman -S vim --noconfirm --needed
sudo pacman -S yay-git --noconfirm --needed
sudo pacman -S brave-bin --noconfirm --needed
sudo pacman -S thunderbird --noconfirm --needed
sudo pacman -S cryptomator --noconfirm --needed
sudo pacman -S openvpn --noconfirm --needed
sudo pacman -S keepassxc --noconfirm --needed
sudo pacman -S htop --noconfirm --needed
sudo pacman -S btop --noconfirm --needed
sudo pacman -S sublime-text-4 --noconfirm --needed
sudo pacman -S insync --noconfirm --needed
sudo pacman -S nextcloud-client --noconfirm --needed
sudo pacman -S libreoffice-still --noconfirm --needed
sudo pacman -S onlyoffice-bin --noconfirm --needed
sudo pacman -S spotify --noconfirm --needed
sudo pacman -S discord --noconfirm --needed
sudo pacman -S neofetch --noconfirm --needed
sudo pacman -S fastfetch --noconfirm --needed
sudo pacman -S arc-gtk-theme --noconfirm --needed
sudo pacman -S archlinux-wallpaper --noconfirm --needed
sudo pacman -S papirus-icon-theme --noconfirm --needed