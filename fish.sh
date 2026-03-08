#!/usr/bin/env bash
set -euo pipefail

echo
tput setaf 3
echo "######################################################"
echo "################### Install and Change Shell to Fish"
echo "######################################################"
tput sgr0
echo
# Install and Change Shell to Fish
sudo pacman -S --noconfirm --needed fish
chsh -s /usr/bin/fish $USER