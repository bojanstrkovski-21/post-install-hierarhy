#!/bin/bash
echo "Installing Kitty..."
sudo pacman -S --needed --noconfirm kitty kitty-shell-integration libsixel lsix imagemagick
echo "Done."
