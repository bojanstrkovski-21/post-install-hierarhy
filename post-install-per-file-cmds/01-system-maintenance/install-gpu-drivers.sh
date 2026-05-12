#!/bin/bash
# GPU Driver installer - detects GPU, offers driver options, installs with yay/paru or pacman

# Detect AUR helper
detect_aur_helper() {
    if command -v yay &>/dev/null; then
        echo "yay"
    elif command -v paru &>/dev/null; then
        echo "paru"
    else
        echo ""
    fi
}

AUR_HELPER=$(detect_aur_helper)

echo "========================================"
echo "  GPU Driver Installer"
echo "========================================"
echo ""

if [[ -z "$AUR_HELPER" ]]; then
    echo "No AUR helper (yay/paru) detected."
    echo "Options to install one:"
    echo "  1) Install yay  (sudo pacman -Sy yay)"
    echo "  2) Install paru (sudo pacman -Sy paru)"
    echo "  3) Continue without AUR helper (pacman only)"
    echo ""
    read -rp "Choose (1/2/3): " aur_choice
    case "$aur_choice" in
        1) sudo pacman -Sy --needed --noconfirm yay; AUR_HELPER="yay" ;;
        2) sudo pacman -Sy --needed --noconfirm paru; AUR_HELPER="paru" ;;
        3) AUR_HELPER="pacman" ;;
        *) echo "Invalid. Using pacman."; AUR_HELPER="pacman" ;;
    esac
fi

echo ""

# Detect GPU
GPU_INFO=$(lspci | grep -E "VGA|3D|Display")
echo "Detected GPU(s):"
echo "$GPU_INFO"
echo ""

GPU_VENDOR=""
if echo "$GPU_INFO" | grep -qi "nvidia"; then
    GPU_VENDOR="nvidia"
elif echo "$GPU_INFO" | grep -qi "amd\|radeon"; then
    GPU_VENDOR="amd"
elif echo "$GPU_INFO" | grep -qi "intel"; then
    GPU_VENDOR="intel"
else
    GPU_VENDOR="unknown"
fi

echo "GPU vendor detected: $GPU_VENDOR"
echo ""

case "$GPU_VENDOR" in
    nvidia)
        echo "Compatible NVIDIA drivers:"
        echo "  1) nvidia-dkms + nvidia-utils + nvidia-settings  (proprietary, recommended)"
        echo "  2) nvidia + nvidia-utils + nvidia-settings        (proprietary, non-DKMS)"
        echo "  3) nvidia-open-dkms + nvidia-utils               (open-source kernel module, RTX 20xx+)"
        echo "  4) xf86-video-nouveau                            (open-source, basic)"
        echo ""
        read -rp "Choose driver option (1-4): " drv_choice
        case "$drv_choice" in
            1) PKGS="nvidia-dkms nvidia-utils nvidia-settings" ;;
            2) PKGS="nvidia nvidia-utils nvidia-settings" ;;
            3) PKGS="nvidia-open-dkms nvidia-utils nvidia-settings" ;;
            4) PKGS="xf86-video-nouveau" ;;
            *) echo "Invalid."; exit 1 ;;
        esac
        ;;
    amd)
        echo "Compatible AMD drivers:"
        echo "  1) xf86-video-amdgpu + mesa + vulkan-radeon  (open-source, recommended)"
        echo "  2) xf86-video-ati + mesa                     (older cards, r300-r600)"
        echo "  3) mesa + vulkan-radeon only                  (no Xorg DDX driver)"
        echo ""
        read -rp "Choose driver option (1-3): " drv_choice
        case "$drv_choice" in
            1) PKGS="xf86-video-amdgpu mesa vulkan-radeon libva-mesa-driver mesa-vdpau" ;;
            2) PKGS="xf86-video-ati mesa" ;;
            3) PKGS="mesa vulkan-radeon libva-mesa-driver mesa-vdpau" ;;
            *) echo "Invalid."; exit 1 ;;
        esac
        ;;
    intel)
        echo "Compatible Intel drivers:"
        echo "  1) xf86-video-intel + mesa + vulkan-intel  (DDX + Vulkan)"
        echo "  2) mesa + vulkan-intel only                 (modesetting, no DDX)"
        echo ""
        read -rp "Choose driver option (1-2): " drv_choice
        case "$drv_choice" in
            1) PKGS="xf86-video-intel mesa vulkan-intel libva-intel-driver intel-media-driver" ;;
            2) PKGS="mesa vulkan-intel libva-intel-driver intel-media-driver" ;;
            *) echo "Invalid."; exit 1 ;;
        esac
        ;;
    *)
        echo "GPU vendor not recognized. Please install drivers manually."
        exit 1
        ;;
esac

echo ""
echo "Installing: $PKGS"
echo "Using: $AUR_HELPER"
echo ""

if [[ "$AUR_HELPER" == "pacman" ]]; then
    sudo pacman -Sy --needed --noconfirm $PKGS
else
    $AUR_HELPER -Sy --needed --noconfirm $PKGS
fi

echo ""
echo "GPU driver installation complete."
