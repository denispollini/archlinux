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

if [[ $(echo $XDG_SESSION_DESKTOP) == "i3" ]]; then
echo -e "exec_always --no-startup-id $HOME/.config/polybar/launch.sh" >> $HOME/.config/i3/config
fi