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

echo
tput setaf 3
echo "######################################################"
echo "################### Copy Default Polybar Configuration"
echo "######################################################"
tput sgr0
echo
# Copy Default Polybar Configuration
cp /etc/polybar/config.ini $HOME/.config/polybar/config.ini

echo
tput setaf 3
echo "######################################################"
echo "################### Check if we are on i3"
echo "######################################################"
tput sgr0
echo
# Check if we are on i3
if [[ $(echo $XDG_SESSION_DESKTOP) == "i3" ]]; then
echo -e "exec_always --no-startup-id $HOME/.config/polybar/launch.sh" >> $HOME/.config/i3/config
fi

mkdir -p $HOME/.config/polybar

cat <<EOF > $HOME/.config/polybar/launch.sh
#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar
echo "---" | tee -a /tmp/polybar.log 
polybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."
EOF

chmod +x $HOME/.config/polybar/launch.sh