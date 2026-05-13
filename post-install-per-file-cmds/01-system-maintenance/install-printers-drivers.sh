#!/bin/bash

sudo pacman -S --noconfirm --needed pacutils

sudo pacinstall --resolve-conflicts=all --no-confirm \
brscan4 \
brscan5 \
brscan-skey \
capt-src \
cnijfilter2 \
cups \
cups-pdf \
cups-browsed \
cups-filters \
cups-pk-helper \
epson-inkjet-printer-escpr \
epson-inkjet-printer-escpr2 \
bluez-cups \
foomatic-db \
foomatic-db-engin \
foomatic-db-gutenprint-ppds \
ghostscript \
gsfonts \
gutenprint \
hplip \
hplip-plugin \
python-pillow 
python-pip 
python-reportlab
libcups \
simple-scan \
splix \
system-config-printer




sudo systemctl enable --now cups.service
