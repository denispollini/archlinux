#!/usr/bin/env bash
set -euo pipefail

echo
tput setaf 3
echo "######################################################"
echo "################### Install Software"
echo "######################################################"
tput sgr0
echo
# Install Software
while IFS= read -r i; do
    sudo pacman -S --noconfirm --needed "$i"
done < package.txt