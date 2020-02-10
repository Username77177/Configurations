#!/usr/bin/env bash
# Some good links
# https://github.com/addy-dclxvi/i3-starterpack
# https://i3wm.org/docs/userguide.html
# https://wiki.archlinux.org/index.php/I3_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)#%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0

sudo apt install compton feh rofi lxappearance scrot i3
# Compton - Эффекты (тени, затемнение, прозрачность и т.д.)
# feh - выбор обоев
# Rofi - лаунчер программ (альтернатива dmenu)
# lxappearance - иконки, шрифты и многое другое

# Installing i3-gaps
mkdir $HOME/gitinstalled
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool libxcb-shape0-dev
sudo apt-get install libxcb-xrm-dev
cd ~/gitinstalled/
git clone https://www.github.com/Airblader/i3 ~/gitinstalled/i3-gaps
cd i3-gaps
git checkout gaps && git pull
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install

# Installing xwinwrap (Git animated wallpaper)
sudo apt-get install xorg-dev build-essential libx11-dev x11proto-xext-dev libxrender-dev libxext-dev
git clone https://github.com/ujjwal96/xwinwrap.git ~/gitinstalled/xwinwrap
cd xwinwrap
make
sudo make install
make clean
