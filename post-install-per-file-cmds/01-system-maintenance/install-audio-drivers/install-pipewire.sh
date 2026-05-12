#!/bin/bash
# Install PipeWire audio

# Remove jack2 if installed (conflicts with pipewire-jack)
if pacman -Qi jack2 &>/dev/null; then
    echo "jack2 is installed. Removing it..."
    sudo pacman -Rdd jack2
    echo "jack2 successfully removed."
    sleep 2
else
    echo "jack2 is not present."
fi

echo ""
echo "Installing PipeWire..."
sudo pacman -Rdd --noconfirm pulseaudio-bluetooth pulseaudio pulseaudio-alsa \
    pulseaudio-equalizer pulseaudio-jack pulseaudio-zeroconf pavucontrol \
    alsa-firmware alsa-lib alsa-plugins alsa-utils alsa-topology-conf \
    gstreamer gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly \
    gst-libav gstreamer-vaapi cdrdao faac faad2 ffmpeg ffmpegthumbnailer flac \
    frei0r-plugins imagemagick lame libdvdcss libopenraw x265 x264 xvidcore \
    playerctl volumeicon 2>/dev/null || true

sudo pacman -Syu --noconfirm \
    alsa-utils alsa-firmware alsa-plugins alsa-lib alsa-topology-conf \
    gstreamer gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good \
    gst-plugins-ugly gstreamer-vaapi cdrdao faac faad2 ffmpeg ffmpegthumbnailer \
    flac frei0r-plugins imagemagick lame libdvdcss libopenraw x265 x264 xvidcore \
    pavucontrol pipewire pipewire-audio pipewire-docs pipewire-pulse pipewire-alsa \
    pipewire-jack pipewire-zeroconf playerctl volumeicon wireplumber

echo ""
echo "PipeWire installation complete."
