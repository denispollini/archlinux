#!/usr/bin/env bash
set -euo pipefail

echo
tput setaf 3
echo "######################################################"
echo "################### Install Polybar"
echo "######################################################"
tput sgr0
echo
# Install Polybar
sudo pacman -S --noconfirm --needed polybar