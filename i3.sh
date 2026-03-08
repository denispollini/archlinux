#!/usr/bin/env bash
set -euo pipefail

echo
tput setaf 3
echo "######################################################"
echo "################### Install i3"
echo "######################################################"
tput sgr0
echo
# Install i3
sudo pacman -S --noconfirm --needed i3-wm