#!/usr/bin/env bash
set -euo pipefail

# --- Output colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log()  { echo -e "${GREEN}[+]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
err()  { echo -e "${RED}[✗]${NC} $*"; exit 1; }

# --- Check root permissions ---
if [[ "$EUID" -ne 0 ]]; then
  err "This script must be run as root (use: sudo $0)"
fi

# --- 1. Download strap.sh ---
log "Downloading strap.sh from blackarch.org..."
curl -fsSL -O https://blackarch.org/strap.sh || err "Failed to download strap.sh"

# --- 2. Verify SHA1 checksum ---
log "Verifying SHA1 checksum..."
echo "00688950aaf5e5804d2abebb8d3d3ea1d28525ed  strap.sh" | sha1sum -c - \
  || err "Invalid SHA1 checksum! File may be corrupted or tampered with."
log "Checksum OK"

# --- 3. Set execute bit ---
log "Setting execute permissions..."
chmod +x strap.sh

# --- 4. Run strap.sh in non-interactive mode ---
log "Running strap.sh..."
# DEBIAN_FRONTEND=noninteractive is not needed on Arch, but yes | handles
# any remaining prompts from pacman or the script itself
yes "" | bash ./strap.sh || err "strap.sh exited with an error"

# --- 5. Enable multilib in /etc/pacman.conf (if not already enabled) ---
log "Enabling multilib repository in /etc/pacman.conf..."
PACMAN_CONF="/etc/pacman.conf"

if grep -q "^\[multilib\]" "$PACMAN_CONF"; then
  warn "multilib is already enabled, skipping this step."
else
  # Uncomment existing [multilib] and its Include line if present,
  # then append a clean section at the end as fallback
  sed -i '/^#\[multilib\]/,/^#Include = \/etc\/pacman\.d\/mirrorlist/{
    s/^#\[multilib\]/[multilib]/
    s/^#Include = \/etc\/pacman\.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/
  }' "$PACMAN_CONF"

  # Fallback: if the commented lines were not found, append the section
  if ! grep -q "^\[multilib\]" "$PACMAN_CONF"; then
    printf '\n[multilib]\nInclude = /etc/pacman.d/mirrorlist\n' >> "$PACMAN_CONF"
  fi
  log "multilib enabled."
fi

# --- 6. Update the system (non-interactive) ---
log "Updating the system with pacman -Syu..."
pacman -Syu --noconfirm --needed || err "pacman -Syu failed"

log "=============================="
log " Installation complete! ✓"
log "=============================="