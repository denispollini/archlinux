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
for i in package.txt
do
    sudo pacman -S --noconfirm --needed $i
done