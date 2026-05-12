Hi i need you to go through the arch-boki-post-install-dev/03.arch-boki-post-install-gum.sh and anything this script is using and in the post-install-per-file-cmds folder do the following:
I. create folders per main categories: 
first category 01-system-maintenace instead of update-and-refresh, 
second category will be 02-install-apps-utilities, 
third category 03-install-desktops,

II. In category 01-system-maintenance will be:
  1. update-system script for updating the system which will detect if the machine has aur
    helpers installed(yay,paru),flatpak,snapd or only pacman, this script will have options: 
    a) update system - pacman(sudo pacman -Syyu); 
    b) full system update using aur helper by default yay or paru if detected only it so yay/paru -Syyu) and if detected add chain for updating flatpak (what ever the command is) and same for snaps.
  2. refresh-pacman-db script to refresh databases for pacman repos with sudo pacman -Syyv
  3. refresh-mirrors script that will check if reflector or rate mirrors are installed or both and: 
    a) if reflector is installed ony it will run sudo reflector --country AT,BE,BG,HR,CZ,DK,EE,FI,FR,DE,GR,HU,IT,MD,NL,MK,NO,PL,PT,RO,RS,SK,SI,ES,SE,CH,UA,GB --age 6 --fastest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist --verbose
    b) if rate-mirrors is installed only it will run rate-mirrors --allow-root --save=/etc/pacman.d/mirrorlist --protocol=https --max-mirrors-to-output=20 --top-mirrors-number-to-retest=20 --country-neighbors-per-country=5 --entry-country=DE --exclude-countries=AM,AU,AZ,BD,BR,CA,CL,CN,CO,EC,HK,ID,IN,IR,IS,JP,KE,KR,KZ,LT,LV,MU,MX,MY,NC,NZ,PY,RU,SA,SG,TH,TR,TW,US,UZ,VN,ZA,ZZ --disable-comments-in-file arch --max-delay=21600, 
    c) if both found installed ask which one to use with a or b to automaticly choose
  4. add-chaotic-repo script for adding chaotic-aur (just copy my script add-repos/install_and_append_chaotic_repo_and_keyrings.sh)
  5. add-arch-boki-repo script for adding arch-boki repos (just copy my script add-repos/append_archboki_repo.sh)
  6. add-nemesis-repo script for adiing nemesis-repo (just copy my script add-repos/install_arcolinux_apps.sh)
  7. script for Fix pacman_db_and_keys (just copy my script add-repos/fix-pacman-databases-and-keys.sh)
  8. install-audio-drivers sub-category for installing audio drivers with two scripts: one for  pipewire and one for pulse audio, pipwire script will have that check for jack2 from my script that will remove it if installed, and after copying from my script core-utils/audio-drivers.sh to create them. 
  9. script for install gpu drivers that will check: 1. if i have aur-helper yay/paru and give options to choose one and than with pacman -Sy <helper> install it 2. detect my gpu (i have that in my script core-utils/gpu-drivers.sh) and throw a message that show the gpu model and what driver/drivers are compatible and give me list form which i type number of few options and install it with yay -Sy <driver_name>.
 10. install-microcode script for installing microcode that detects cpu and install apropriate microde with --needed --noconfirm flags (just copy my script core-utils/microcode.sh)
 11. install-bluetooth script for installing bluetooth drivers (just copy my script install-scripts/123-bluetooth.sh)
    l) install-printers-drivers script for printers (just copy my script install-scripts/124-printers.sh)
 12. install-network-drivers script for network drivers (just copy my script install-scripts/126-network.sh)
 13. sub-categoty/folder for fonts (put 125-installfont-new.sh and whatever script it uses ill work on it some time after all this hierarhy thing is done)
 14. system-tools sub-category/folder for core and system utils and tools: 
    a) install-core-utils script for 118-core.sh (i cleaned it up and its ready i have it in my pc so i can put it where it needs to go you just tell me when it is time to put it in there); 
    b) app-launchers subcategory for: 
     1. Bemenu
     2. Bemenu-Wayland
     3. Dmenu(it is better to clone and build)
     4. Fuzzel
     5. Rofi
     6. Rofi-Wayland
     7. Tofi
     8. Walker
     9. Wofi 
    c) calculators sub-category for:
     1. Galculator
     2. Gnome Calculator
     3. Qalculate-Gtk
     4. Qalculate-Qt
    d) partition-tools sub-category for:
     1. Kde Partition Manager
     2. Gnome Disks Utility
     3. Gparted
    e) screen-shooters sub-category for:
     1. Flameshot
     2. Kazam
     3. Ksnip
     4. Shutter
     5. Spectacle
     6. Xfce4-screenshooter
    f) screen-resolution-setters sub category for:
     1. Arandr(gui x11)
     2. nwg-displays(hyprland-sway-nwg-shell only)
     3. wdisplays(gui wayland)
     4. wlr-randr(cli wayland)
     5. xorg-xrandr(cli x11)
    g) system-info-and-monitoring sub-category for:
     1. Bashtop
     2. Btop
     3. Countryfetch
     4. Cpufetch
     5. Fastfetch
     6. Glances
     7. Gtop
     8. Htop
     9. Hyfetch
     10. Mission Center
     11. Nvtop
     12. Resources
     13. Stacer
     14. Xfce4-Taskmanager
III. In 02-install-apps categoty that will be:
    a) file-managers sub-category for file managers (copy function from 130-archboki-install-apps.sh and make it a menu with all the options it has there)
    b) terminal-emulators sub-category for terminal emulators (copy function from 130-archboki-install-apps.sh and make it a menu with all the options it has there)
    c) sub-category/folder for text-editors-pdf-office-dev-tools for: 
     1. text-editors
      a. Nemo file manager
      b. PcmanFM-gtk3
      c. PcmanFM-qt
      d. Thunar file manager
      e. Nautilus - gnome files
      f. Dolphin - Kde Plasma
      g. Yazi-Terminal
      h. Ranger-Terminal
     2. pdf
      a. Evince
      b. Okular
      c. Xpdf
      d. Xreader
      e. Zathura
     3. office
      a. LibreOffice
      b. OnlyOffice
     4. Markdown-edit
      a. Affine
      b. Obsidian
      c. Qownnotes
     5. dev_tools
    d) sub-category/folder for internet for:
     1. Communication/Social
      a. Discord
      b. Signal
      c. Telegram
     2. Web browsers
      a. Brave
      b. Chromium
      c. Firefox
      d. Firefox-esr
      e. Google Chrome
      f. Librewolf
      g. Qutebrowser
      h. Vivaldi
     3. Downloaders
      a. Deluge-Gtk
      b. Ktorrent
      c. Qbittorrent
      d. Transmission-Gtk
      e. Transmission-Qt
     4. Recorders
      a. Gpu-screen-recorder-gtk
      b. Hyprshot (hyprland-onmly)
      c. Kazam
      d. Obs-studio
      e. Peek
      f. Simplescreenrecorder
    e) category/folder for multimedia for:
     1. Audio Players
      a. Amberol
      b. Audacious
      c. Deadbeef
      d. Elisa
      e. G4music
      f. juk
      g. lollypop
      h. Pragha
      i. Rhythmbox
      j. Sayonara Player
      k. Strawberry
     2. Video Players
      a. Celluloid
      b. Clapper
      c. Kodi
      d. Mpv
      e. Smplayer
      f. Vlc media player
     3. Audio Editors
      a. Ardour
      b. Audacity
      c. Kwave
      d. Lmms
      e. Openshot
      f. soundconverter
      g. reaper
      h. tenacity
     4. Video Editors
      a. flowblade
      b. handbrake
      c. kdenlive
      d. losslesscut
      e. makemkv
      f. Openshot
      g. Shotcut
      h. Subtitle Editors
    f) category/folder for graphics for:
     1. Photo/Image Viewers
      a. Darktable
      b. Ephoto
      c. GPicView
      d. Gwenview
      e. Nomacs
      f. Nsxiv
      g. Qimgv
      h. Ristretto
     2. Photo/Image Editors
      a. Gimp
      b. Gpick
      c. Inkscape
      d. Krita
      e. Pinta
      f. RawTherapee
      g. Upscayl
     3. Wallpaper/Backround Changer
      a. Azote(nwg creators)
      b. Feh(terminal)
      c. Hyprpaper(hyprland)
      d. Nitrogen
      e. Swaybg(terminal-wayland
      f. Swww(terminal)
      g. Variety
      h. Waypaper(wayland-x11-gui)
      i. Xwallpaper(terminal)
    g) category/folder for installing arch-boki-packages (folder with scripts per pkg)
     01. archboki-shells
     02. archboki-xfce
     03. archboki-fuzzel-config
     04. archboki-ghostty-config
     05. arch-boki-fasfetch
     06. arch-boki-kitty-git
     07. arch-boki-logout
     08. arch-boki-sddm-simplicity
     09. arch-boki-viper-grub-theme-main
     10. arch-boki-wezterm
     11. arch-boki-tilix-git
     12. sparklines-git
    h) category/folder for installing nemesis-repo packages (folder with scripts per pkg)
     1. neo-candy-icons-git
     2. cpuid
     3. sysz
     4. volctl
     5. arcolinux-arc-aqua-git 
     6. arcolinux-arc-archlinux-blue-git 
     7. arcolinux-arc-arcolinux-blue-git 
     8. arcolinux-arc-azul-git 
     9. arcolinux-arc-azure-dodger-blue-git 
     10. arcolinux-arc-azure-git 
     11. arcolinux-arc-blood-git 
     12. arcolinux-arc-blue-sky-git 
     13. arcolinux-arc-blueberry-git
     14. arcolinux-arc-botticelli-git 
     15. arcolinux-arc-bright-lilac-git 
     16. arcolinux-arc-carnation-git 
     17. arcolinux-arc-carolina-blue-git 
     18. arcolinux-arc-casablanca-git 
     19. arcolinux-arc-cornflower-blue-git 
     20. arcolinux-arc-crimson-git 
     21. arcolinux-arc-darkish-git 
     22. arcolinux-arc-dawn-git 
     23. arcolinux-arc-dodger-blue-git 
     24. arcolinux-arc-dracul-git 
     25. arcolinux-arc-emerald-git 
     26. arcolinux-arc-evopop-git 
     27. arcolinux-arc-fern-git 
     28. arcolinux-arc-fire-git 
     29. arcolinux-arc-froly-git 
     30. arcolinux-arc-havelock-git 
     31. arcolinux-arc-hibiscus-git 
     32. arcolinux-arc-kde 202
     33. arcolinux-arc-light-blue-grey-git 
     34. arcolinux-arc-light-blue-surfn-git 
     35. arcolinux-arc-light-salmon-git 
     36. arcolinux-arc-mandy-git 
     37. arcolinux-arc-mantis-git 
     38. arcolinux-arc-medium-blue-git 
     39. arcolinux-arc-niagara-git 
     40. arcolinux-arc-nice-blue-git 
     41. arcolinux-arc-numix-git 
     42. arcolinux-arc-orchid-git 
     43. arcolinux-arc-pale-grey-git 
     44. arcolinux-arc-paper-git 
     45. arcolinux-arc-pink-git 
     46. arcolinux-arc-polo-git 
     47. arcolinux-arc-punch-git 
     48. arcolinux-arc-purpley-git 
     49. arcolinux-arc-red-orange-git 
     50. arcolinux-arc-red-violet-git 
     51. arcolinux-arc-rusty-orange-git 
     52. arcolinux-arc-sky-blue-git 
     53. arcolinux-arc-slate-grey-git 
     54. arcolinux-arc-smoke-git 
     55. arcolinux-arc-soft-blue-git 
     56. arcolinux-arc-tacao-git 
     57. arcolinux-arc-tangerine-git 
     58. arcolinux-arc-tory-git 
     59. arcolinux-arc-twilight-git 
     60. arcolinux-arc-vampire-git 
     61. arcolinux-arc-warm-pink-git
     62. arc-gtk-theme
     63. hardcode-fixer-git
IV. In 03-install-desktops/window managers - lets create this part as a category with theese sub categories an worrie about adding scripts for them in a later time so i have the hierarhy and add what to launch when this part is done  
    I. Category/folder for desktop environments
        a) Xfce-DE
        b) Cinnamon-DE
        c) Kde-plasma-DE
        d) Lxqt-DE
        e) Mate-DE
        f) Cosmic-DE
        g) Enlightment-DE
        h) Budgie-DE
        i) Gnome-DE
    II. Window Managers - X11
        j) Openbox-SWM
        k) Icewm-jwm-fluxbox-SWM
        l) Dwm-Chadwm-Boki-WM
        m) Awesomewm-WM
        n) Bspwm-WM
        o) I3-WM
        p) Dkwm-WM
        q) Qtile-WM
        r) Xmonad-WM
    III. Window Managers - Wayland    
        s) Hyprland
        t) Niri
        u) Labwc
        v) Mangowm
        w) Sway
        x) River
        y) Wayfire
    (one very important thing i will narrow down this list) 


