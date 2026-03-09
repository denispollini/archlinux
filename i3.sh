#!/usr/bin/env bash
set -e

echo
tput setaf 3
echo "######################################################"
echo "################### Install i3"
echo "######################################################"
tput sgr0
echo
# Install i3
sudo pacman -S --noconfirm --needed i3-wm

if [[ $(systemd-detect-virt) == "vmware" ]]; then
echo -e "exec --no-startup-id /usr/bin/vmware-user" >> $HOME/.config/i3/config
fi