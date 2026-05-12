#!/bin/bash
# Install PulseAudio

echo "Installing PulseAudio..."
sudo pacman -Rdd --noconfirm alsa-utils alsa-firmware alsa-plugins alsa-lib \
    alsa-topology-conf gstreamer gst-libav gst-plugins-bad gst-plugins-base \
    gst-plugins-good gst-plugins-ugly gstreamer-vaapi cdrdao faac faad2 ffmpeg \
    ffmpegthumbnailer flac frei0r-plugins imagemagick lame libdvdcss libopenraw \
    x265 x264 xvidcore pavucontrol pipewire pipewire-audio pipewire-docs \
    pipewire-pulse pipewire-alsa pipewire-jack pipewire-zeroconf playerctl \
    volumeicon wireplumber 2>/dev/null || true

sudo pacman -Syu --noconfirm \
    pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-equalizer \
    pulseaudio-jack pulseaudio-zeroconf pavucontrol alsa-firmware alsa-lib \
    alsa-plugins alsa-utils alsa-topology-conf gstreamer gst-plugins-good \
    gst-plugins-bad gst-plugins-base gst-plugins-ugly gst-libav gstreamer-vaapi \
    cdrdao faac faad2 ffmpeg ffmpegthumbnailer flac frei0r-plugins imagemagick \
    lame libdvdcss libopenraw x265 x264 xvidcore playerctl volumeicon

echo ""
echo "PulseAudio installation complete."
