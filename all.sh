#!/bin/bash
set -e

echo
tput setaf 3
echo "######################################################"
echo "################### All.sh"
echo "######################################################"
tput sgr0
echo

read -p "Do you want to install Chaotic Repo? (y/n): " chaotic_repo
if [[ "$chaotic_repo" == "y" ]]; then
    sh chaotic-repo.sh
fi

read -p "Do you want to install BlackArch Repo? (y/n): " blackarch_repo
if [[ "$blackarch_repo" == "y" ]]; then
    sh blackarch-repo.sh
fi

sh cpu-microcode-gpu-driver.sh
sh fish.sh
sh install-software.sh
sh lightdm.sh
sh yay.sh
