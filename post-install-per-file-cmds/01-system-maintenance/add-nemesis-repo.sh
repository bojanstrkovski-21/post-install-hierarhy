#!/usr/bin/env bash

echo -e "\n[nemesis_repo]\nSigLevel = Never\nServer = https://erikdubois.github.io/\$repo/\$arch" | sudo tee -a /etc/pacman.conf
# echo -e "\n[arcolinux_repo]\nSigLevel = Never\nServer = https://arcolinux.github.io/\$repo/\$arch" | sudo tee -a /etc/pacman.conf
# echo -e "\n[arcolinux_repo_3party]\nSigLevel = Never\nServer = https://arcolinux.github.io/\$repo/\$arch" | sudo tee -a /etc/pacman.conf
sudo pacman -Syy
