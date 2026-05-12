# Arch-Boki Post-Install Scripts

Per-file script hierarchy for post-installation setup on Arch Linux.  
Each script is standalone and executable — run the one you need.

---

## Structure

```
post-install-per-file-cmds/
├── 01-system-maintenance/
├── 02-install-apps-utilities/
└── 03-install-desktops/
```

---

## 01 — System Maintenance

| Script | Description |
|--------|-------------|
| `update-system.sh` | Detects yay/paru/flatpak/snapd and offers: a) pacman only, b) full update with AUR helper + flatpak + snap |
| `refresh-pacman-db.sh` | Refreshes pacman databases (`pacman -Syyv`) |
| `refresh-mirrors.sh` | Detects reflector/rate-mirrors; if both found asks which to use |
| `add-chaotic-repo.sh` | Adds the Chaotic-AUR repository and keyrings |
| `add-arch-boki-repo.sh` | Adds the arch-boki custom repositories |
| `add-nemesis-repo.sh` | Adds nemesis repo packages (archlinux-tweak-tool, sofirem, etc.) |
| `fix-pacman-db-and-keys.sh` | Fixes broken pacman databases and GPG keys |
| `install-microcode.sh` | Detects CPU (Intel/AMD) and installs the correct microcode |
| `install-bluetooth.sh` | Installs Bluetooth drivers and enables the service |
| `install-printers-drivers.sh` | Installs CUPS and printer support packages |
| `install-network-drivers.sh` | Installs NetworkManager, nftables, iptables-nft, Samba, gvfs and friends |
| `install-gpu-drivers.sh` | Detects GPU (NVIDIA/AMD/Intel), shows compatible driver options, installs with yay/paru/pacman |

### install-audio-drivers/

| Script | Description |
|--------|-------------|
| `install-pipewire.sh` | Removes jack2 if present, removes PulseAudio, installs PipeWire stack |
| `install-pulseaudio.sh` | Removes PipeWire stack, installs PulseAudio stack |

### fonts/

| Script | Description |
|--------|-------------|
| `install-fonts.sh` | Interactive font installer — regular fonts and Nerd Fonts with selection menu |

### system-tools/

| Script | Description |
|--------|-------------|
| `install-core-utils.sh` | Core system utilities and tools (118-core content) |

#### app-launchers/
`bemenu` · `bemenu-wayland` · `dmenu` · `fuzzel` · `rofi` · `rofi-wayland` · `tofi` · `walker` · `wofi`

#### calculators/
`galculator` · `gnome-calculator` · `qalculate-gtk` · `qalculate-qt`

#### partition-tools/
`kde-partition-manager` · `gnome-disks` · `gparted`

#### screen-shooters/
`flameshot` · `kazam` · `ksnip` · `shutter` · `spectacle` · `xfce4-screenshooter`

#### screen-resolution-setters/
`arandr` (GUI X11) · `nwg-displays` (Hyprland/Sway/nwg-shell) · `wdisplays` (GUI Wayland) · `wlr-randr` (CLI Wayland) · `xorg-xrandr` (CLI X11)

#### system-info-and-monitoring/
`bashtop` · `btop` · `countryfetch` · `cpufetch` · `fastfetch` · `glances` · `gtop` · `htop` · `hyfetch` · `mission-center` · `nvtop` · `resources` · `stacer` · `xfce4-taskmanager`

---

## 02 — Install Apps & Utilities

### file-managers/
`nemo` · `pcmanfm-gtk3` · `pcmanfm-qt` · `thunar` · `nautilus` · `dolphin` · `yazi` · `ranger`

### terminal-emulators/
`alacritty` · `ghostty` · `kitty` · `tilix` · `wezterm` · `xfce4-terminal`

### text-editors-pdf-office-dev-tools/

#### text-editors/
`emacs` · `geany` · `leafpad` · `mousepad` · `sublime-text-4` · `xed`

#### pdf/
`evince` · `okular` · `xpdf` · `xreader` · `zathura`

#### office/
`libreoffice-fresh` · `onlyoffice`

#### markdown-edit/
`affine` · `obsidian` · `qownnotes`

#### dev-tools/
`code` · `meld` · `notepadqq` · `pycharm-community-edition` · `vscodium` · `visual-studio-code-bin` · `zed`

### internet/

#### communication-social/
`discord` · `signal-desktop` · `telegram-desktop`

#### web-browsers/
`brave` · `chromium` · `firefox` · `firefox-esr` · `google-chrome` · `librewolf` · `qutebrowser` · `vivaldi`

#### downloaders/
`deluge-gtk` · `ktorrent` · `qbittorrent` · `transmission-gtk` · `transmission-qt`

#### recorders/
`gpu-screen-recorder` · `hyprshot` · `kazam` · `obs-studio` · `peek` · `simplescreenrecorder`

### multimedia/

#### audio-players/
`amberol` · `audacious` · `deadbeef` · `elisa` · `g4music` · `juk` · `lollypop` · `pragha` · `rhythmbox` · `sayonara-player` · `strawberry`

#### video-players/
`celluloid` · `clapper` · `kodi` · `mpv` · `smplayer` · `vlc`

#### audio-editors/
`ardour` · `audacity` · `kwave` · `lmms` · `openshot` · `soundconverter` · `reaper` · `tenacity`

#### video-editors/
`flowblade` · `handbrake` · `kdenlive` · `losslesscut` · `makemkv` · `openshot` · `shotcut`

#### subtitle-editors/
`aegisub` · `subtitleedit` · `subtitlecomposer`

### graphics/

#### photo-image-viewers/
`darktable` · `ephoto` · `gpicview` · `gwenview` · `nomacs` · `nsxiv` · `qimgv` · `ristretto`

#### photo-image-editors/
`gimp` · `gpick` · `inkscape` · `krita` · `pinta` · `rawtherapee` · `upscayl`

#### wallpaper-background-changer/
`azote` · `feh` · `hyprpaper` · `nitrogen` · `swaybg` · `swww` · `variety` · `waypaper` · `xwallpaper`

### arch-boki-packages/

Scripts to install custom arch-boki repository packages:

| # | Package |
|---|---------|
| 01 | archboki-shells |
| 02 | archboki-xfce |
| 03 | archboki-fuzzel-config |
| 04 | archboki-ghostty-config |
| 05 | arch-boki-fastfetch |
| 06 | arch-boki-kitty-git |
| 07 | arch-boki-logout |
| 08 | arch-boki-sddm-simplicity |
| 09 | arch-boki-viper-grub-theme-main |
| 10 | arch-boki-wezterm |
| 11 | arch-boki-tilix-git |
| 12 | sparklines-git |

### nemesis-repo-packages/

| Script | Package |
|--------|---------|
| `install-neo-candy-icons.sh` | neo-candy-icons-git |
| `install-cpuid.sh` | cpuid |
| `install-sysz.sh` | sysz |
| `install-volctl.sh` | volctl |
| `install-hardcode-fixer.sh` | hardcode-fixer-git |
| `install-arc-gtk-theme.sh` | arc-gtk-theme |
| `install-all-arcolinux-arc-themes.sh` | All 62 arcolinux-arc-\* color theme variants |

---

## 03 — Install Desktops / Window Managers

> Scripts will be added per environment. The folder hierarchy is in place.

### desktop-environments/

| Folder | Environment |
|--------|-------------|
| `xfce-de/` | Xfce |
| `cinnamon-de/` | Cinnamon |
| `kde-plasma-de/` | KDE Plasma |
| `lxqt-de/` | LXQt |
| `mate-de/` | MATE |
| `cosmic-de/` | Cosmic |
| `enlightenment-de/` | Enlightenment |
| `budgie-de/` | Budgie |
| `gnome-de/` | GNOME |

### window-managers/x11/

| Folder | WM |
|--------|----|
| `openbox-swm/` | Openbox |
| `icewm-jwm-fluxbox-swm/` | IceWM / JWM / Fluxbox |
| `dwm-chadwm-boki-wm/` | Dwm / Chadwm / Boki |
| `awesomewm-wm/` | AwesomeWM |
| `bspwm-wm/` | Bspwm |
| `i3-wm/` | i3 |
| `dkwm-wm/` | Dkwm |
| `qtile-wm/` | Qtile |
| `xmonad-wm/` | Xmonad |

### window-managers/wayland/

| Folder | Compositor |
|--------|------------|
| `hyprland/` | Hyprland |
| `niri/` | Niri |
| `labwc/` | Labwc |
| `mangowm/` | MangoWM |
| `sway/` | Sway |
| `river/` | River |
| `wayfire/` | Wayfire |

---

## Notes

- All scripts require `sudo` access.
- AUR packages are installed via `yay` or `paru` — install one first if not present.
- The **nemesis repo** and **arch-boki repo** must be added before installing packages from those repos.
- The **core-utils** script (`install-core-utils.sh`) contains your cleaned-up `118-core.sh` — place it there when ready.
- The `03-install-desktops/` hierarchy is structure-only for now — desktop/WM install scripts will be added in a later phase.
