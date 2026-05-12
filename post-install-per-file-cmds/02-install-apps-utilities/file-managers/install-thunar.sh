#!/bin/bash
echo "Installing Thunar..."
sudo pacman -S --needed --noconfirm thunar thunar-archive-plugin thunar-shares-plugin thunar-volman tumbler file-roller
echo "Done."
