#!/bin/bash
# Refresh mirrors - detects reflector and/or rate-mirrors

HAS_REFLECTOR=false
HAS_RATE_MIRRORS=false

command -v reflector &>/dev/null && HAS_REFLECTOR=true
command -v rate-mirrors &>/dev/null && HAS_RATE_MIRRORS=true

run_reflector() {
    echo "Running reflector..."
    sudo reflector \
        --country AT,BE,BG,HR,CZ,DK,EE,FI,FR,DE,GR,HU,IT,MD,NL,MK,NO,PL,PT,RO,RS,SK,SI,ES,SE,CH,UA,GB \
        --age 6 \
        --fastest 20 \
        --protocol https \
        --sort rate \
        --save /etc/pacman.d/mirrorlist \
        --verbose
}

run_rate_mirrors() {
    echo "Running rate-mirrors..."
    rate-mirrors \
        --allow-root \
        --save=/etc/pacman.d/mirrorlist \
        --protocol=https \
        --max-mirrors-to-output=20 \
        --top-mirrors-number-to-retest=20 \
        --country-neighbors-per-country=5 \
        --entry-country=DE \
        --exclude-countries=AM,AU,AZ,BD,BR,CA,CL,CN,CO,EC,HK,ID,IN,IR,IS,JP,KE,KR,KZ,LT,LV,MU,MX,MY,NC,NZ,PY,RU,SA,SG,TH,TR,TW,US,UZ,VN,ZA,ZZ \
        --disable-comments-in-file arch \
        --max-delay=21600
}

echo "========================================"
echo "  Refresh Mirrors"
echo "========================================"
echo ""

if $HAS_REFLECTOR && $HAS_RATE_MIRRORS; then
    echo "Both reflector and rate-mirrors are installed."
    echo "  a) Use reflector"
    echo "  b) Use rate-mirrors"
    echo ""
    read -rp "Choose (a/b): " choice
    case "$choice" in
        a|A) run_reflector ;;
        b|B) run_rate_mirrors ;;
        *)   echo "Invalid choice. Exiting."; exit 1 ;;
    esac
elif $HAS_REFLECTOR; then
    run_reflector
elif $HAS_RATE_MIRRORS; then
    run_rate_mirrors
else
    echo "Neither reflector nor rate-mirrors is installed."
    echo "Install one with:"
    echo "  sudo pacman -S reflector"
    echo "  sudo pacman -S rate-mirrors"
    exit 1
fi

echo ""
echo "Mirrors updated. Running pacman -Syy to refresh databases..."
sudo pacman -Syy
echo "Done."
