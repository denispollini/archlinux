#!/usr/bin/env bash
set -e

echo
tput setaf 3
echo "######################################################"
echo "################### Install CPU Microcode and GPU Driver if is a Bare-metal system."
echo "######################################################"
tput sgr0
echo
# Install additional packages

# Function to check if the system is a virtual machine
is_virtual_machine() {
  # Use systemd-detect-virt to check if it's a virtual system
  if [[ $(systemd-detect-virt) != "none" ]]; then
    echo "Virtual machine detected. CPU ucode and GPU drivers will not be installed."
    return 0  # Confirm that it's a VM
  else
    echo "Bare-metal system detected. Proceeding with the appropriate package installation."
    return 1  # Confirm that it's bare-metal
  fi
}

# Function to detect CPU and install the appropriate ucode package
install_cpu_ucode() {
  CPU_VENDOR=$(lscpu | grep "Vendor ID:" | awk '{print $3}')
  if [[ $CPU_VENDOR == "GenuineIntel" ]]; then
    echo "Intel CPU detected. Installing intel-ucode."
    pacman -S --noconfirm --needed intel-ucode 
  elif [[ $CPU_VENDOR == "AuthenticAMD" ]]; then
    echo "AMD CPU detected. Installing amd-ucode."
    pacman -S --noconfirm --needed amd-ucode 
  else
    echo "Unrecognized CPU. No ucode package installed."
  fi
}

# Function to detect the GPU and install the appropriate drivers
install_gpu_drivers() {
  # Use lspci to detect the GPU
  GPU_VENDOR=$(lspci | grep -E "VGA|3D" | grep -oP "(Intel|AMD|NVIDIA)")
  
  if [[ $GPU_VENDOR == "AMD" ]]; then
    echo "AMD GPU detected. Installing xf86-video-amdgpu."
    pacman -S --noconfirm --needed xf86-video-amdgpu 
  elif [[ $GPU_VENDOR == "NVIDIA" ]]; then
    echo "Nvidia GPU detected. Installing Nvidia drivers."
    pacman -S --noconfirm --needed nvidia nvidia-utils nvidia-settings 
  else
    echo "No supported GPU detected or Intel GPU (no action needed)."
  fi
}

# Start of the script
echo "Starting installation process."

# Check if the system is a virtual machine
if is_virtual_machine; then
  echo "Proceeding without installing ucode or GPU packages for the VM."
else
  # If it's not a VM, install CPU and GPU packages
  install_cpu_ucode
  install_gpu_drivers
fi

echo
tput setaf 3
echo "######################################################"
echo "################### Script completed"
echo "######################################################"
tput sgr0
echo