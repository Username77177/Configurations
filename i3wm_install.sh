#!/usr/bin/env bash
# Иконки которые нужны для нормального функционирования rofi
# https://www.pling.com/p/1210856/#files-panel
# Полезные ссылки
# https://github.com/addy-dclxvi/i3-starterpack
# https://i3wm.org/docs/userguide.html
# https://wiki.archlinux.org/index.php/I3_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)#%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0

sudo apt install compton feh rofi lxappearance scrot i3
# Compton - Эффекты (тени, затемнение, прозрачность и т.д.)
# feh - выбор обоев
# Rofi - лаунчер программ (альтернатива dmenu)
# lxappearance - иконки, шрифты и многое другое
#  ____  _  _    _             _       ____                _
# / ___|(_)| |_ | |__   _   _ | |__   |  _ \   __ _   ___ | | __  __ _   __ _   ___  ___
#| |  _ | || __|| '_ \ | | | || '_ \  | |_) | / _` | / __|| |/ / / _` | / _` | / _ \/ __|
#| |_| || || |_ | | | || |_| || |_) | |  __/ | (_| || (__ |   < | (_| || (_| ||  __/\__ \
# \____||_| \__||_| |_| \__,_||_.__/  |_|     \__,_| \___||_|\_\ \__,_| \__, | \___||___/
#                                                                       |___/


# i3-gaps Нужен для того, чтобы между окнами были отступы
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

# xwinwrap - ПО, которое позволяет ставить gif файлы на рабочий стол
sudo apt-get install xorg-dev build-essential libx11-dev x11proto-xext-dev libxrender-dev libxext-dev gifsicle
git clone https://github.com/ujjwal96/xwinwrap.git ~/gitinstalled/xwinwrap
cd ../xwinwrap
make
sudo make install
make clean
sudo apt install gifsicle

#    _            _     ____                _
#   / \    _ __  | |_  |  _ \   __ _   ___ | | __  __ _   __ _   ___  ___
#  / _ \  | '_ \ | __| | |_) | / _` | / __|| |/ / / _` | / _` | / _ \/ __|
# / ___ \ | |_) || |_  |  __/ | (_| || (__ |   < | (_| || (_| ||  __/\__ \
#/_/   \_\| .__/  \__| |_|     \__,_| \___||_|\_\ \__,_| \__, | \___||___/
#         |_|                                            |___/
sudo add-apt-repository ppa:agornostal/ulauncher

# i3status
sudo apt install fonts-noto # Noto Шрифты для топбара
sudo apt install i3status i3blocks
cd ~/Configurations/i3/
mkdir ~/.config/i3status
mkdir ~/.config/i3blocks
ln -sfr ~/Configurations/i3/config-i3blocks ~/.config/i3blocks/config
ln -sfr ~/Configurations/i3/config-i3-statusbar ~/.config/i3status/config


# __  __
#|  \/  | _   _
#| |\/| || | | |
#| |  | || |_| |
#|_|  |_| \__, |
#         |___/
#  ____                 __  _                             _    _
# / ___|  ___   _ __   / _|(_)  __ _  _   _  _ __   __ _ | |_ (_)  ___   _ __   ___
#| |     / _ \ | '_ \ | |_ | | / _` || | | || '__| / _` || __|| | / _ \ | '_ \ / __|
#| |___ | (_) || | | ||  _|| || (_| || |_| || |   | (_| || |_ | || (_) || | | |\__ \
# \____| \___/ |_| |_||_|  |_| \__, | \__,_||_|    \__,_| \__||_| \___/ |_| |_||___/
#                              |___/


# Конфигурация i3
echo "Конфигурация i3"
mkdir ~/.config/i3
ln -sfr ~/Configurations/i3/config-i3 ~/.config/i3/config
echo "Конфигурация топ-бара i3 (i3-statusbar)"
ln -sfr ~/Configurations/i3/config-i3-statusbar-version2 ~/.config/i3status/config
ln -sfr ~/Configurations/i3/compton.conf ~/.config/
ln -sfr ~/Configurations/i3/XRESOURCES-for-all ~/.Xresources


#####CLEANING FOLDER###
#####ОЧИСТКА ПАПКИ ОТ МУСОРА###

echo "Нужно очистить папку с конфигурацией от мусора? (1 - Да, 0 - Нет)"
read yon
if [[ $yon = "1" ]]
then
    rm ~/Configurations/TODO
    rm -rf ~/Configurations/img
    rm -rf ~/Configurations/fastconfig*
    rm -rf ~/Configurations/readytopush.sh
fi


####Конфигурация тачпада для ноутбука
# Линкует ваш обычный файл конфигурации тачпада, с дефолтом
sudo ln -sfr ~/Configurations/i3/40-libinput.conf.mouseconfig /etc/X11/xorg.conf.d/40-libinput.conf
sudo ln -sfr ~/Configurations/i3/40-libinput.conf.mouseconfig /usr/share/X11/xorg.conf.d/40-libinput.conf
