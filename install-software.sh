#!/usr/bin/env bash
set -e

echo
tput setaf 3
echo "######################################################"
echo "################### Install Software"
echo "######################################################"
tput sgr0
echo
# Install Software
for i in $(cat package.txt);
do
    sudo pacman -S --noconfirm --needed "$i"
done
