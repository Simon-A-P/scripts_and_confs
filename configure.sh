#!/bin/bash
set -e

cd $HOME/dotfiles

# Use local or remote state for configuration
echo "Do you wish to discard local changes, checkout master, and pull from remote before running configuration?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) git reset HEAD --hard && git checkout master && git reset HEAD --hard && git pull; break;;
        No ) break;;
    esac
done

# Start configuration script based on device
read -p "Enter device name (hp14s, spfaus-honor, simon-desktop): " DEVICE_NAME
type $HOME/dotfiles/devices/$DEVICE_NAME/configure.sh && $HOME/dotfiles/devices/$DEVICE_NAME/configure.sh

# Optional reboot
echo "Reboot now?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) reboot; break;;
        No ) break;;
    esac
done