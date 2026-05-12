#!/bin/bash
# Update system - detects pacman, yay/paru, flatpak, snapd

detect_aur_helper() {
    if command -v yay &>/dev/null; then
        echo "yay"
    elif command -v paru &>/dev/null; then
        echo "paru"
    else
        echo ""
    fi
}

HAS_FLATPAK=false
HAS_SNAP=false
AUR_HELPER=""

command -v flatpak &>/dev/null && HAS_FLATPAK=true
command -v snap &>/dev/null && HAS_SNAP=false
AUR_HELPER=$(detect_aur_helper)

echo "========================================"
echo "  Arch-Boki System Update"
echo "========================================"
echo ""
echo "Detected on this system:"
echo "  pacman : yes (always)"
if [[ -n "$AUR_HELPER" ]]; then
    echo "  AUR helper : $AUR_HELPER"
else
    echo "  AUR helper : none"
fi
$HAS_FLATPAK && echo "  flatpak : yes" || echo "  flatpak : no"
$HAS_SNAP  && echo "  snapd   : yes" || echo "  snapd   : no"
echo ""
echo "Options:"
echo "  a) Update system with pacman only  (sudo pacman -Syyu)"
if [[ -n "$AUR_HELPER" ]]; then
    echo "  b) Full update with $AUR_HELPER + extras"
fi
echo "  q) Quit"
echo ""
read -rp "Choose option: " choice

case "$choice" in
    a|A)
        echo "Running: sudo pacman -Syyu"
        sudo pacman -Syyu
        ;;
    b|B)
        if [[ -z "$AUR_HELPER" ]]; then
            echo "No AUR helper detected. Falling back to pacman."
            sudo pacman -Syyu
        else
            echo "Running: $AUR_HELPER -Syyu"
            $AUR_HELPER -Syyu
            if $HAS_FLATPAK; then
                echo ""
                echo "Running: flatpak update"
                flatpak update -y
            fi
            if $HAS_SNAP; then
                echo ""
                echo "Running: sudo snap refresh"
                sudo snap refresh
            fi
        fi
        ;;
    q|Q)
        echo "Quit."
        exit 0
        ;;
    *)
        echo "Invalid option."
        exit 1
        ;;
esac

echo ""
echo "Update complete."
