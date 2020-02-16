#!/bin/bash
# Bold Font
B="\e[1m"
# Normal Font
N="\e[0m"

# Green Color
R='\033[1;31m'
# Red Color
G="\033[1;32m"
# White Color
W='\033[0m'

# I3 INSTALL
##
#

#Variables
CONFIG_NAME="i3conf_`date +%d-%m-%y#%H:%M`"
export $CONFIG_NAME
#Body
## WARNING
echo -e "${B}WARNING!${N}\n\tPlease, backup your configuration files for i3, i3-gaps, compton, Xresources, dunst, rofi and another files, if they can interact with i3!"
rm -rf ~/Configurations/stable/i3conf*
## GENERATING CONF FILE FOR I3
touch ~/Configurations/stable/$CONFIG_NAME
echo "Writing variables module into $CONFIG_NAME"

cat ~/Configurations/stable/i3/variables.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"

echo -e "${W}Writing Features module into $CONFIG_NAME"
cat ~/Configurations/stable/i3/features.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"

echo -e "${W}Writing Workspaces Tweaks module into $CONFIG_NAME"
cat ~/Configurations/stable/i3/workspaces.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"

echo -e "${W}Writing Rules module into $CONFIG_NAME"
cat ~/Configurations/stable/i3/rules.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"

echo -e "${W}Writing I3-gaps module into $CONFIG_NAME"
cat ~/Configurations/stable/i3/i3gaps.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"

echo -e "${W}Writing Bar module into $CONFIG_NAME"
echo -e "${B}Which bar do you prefer?"
echo "1. i3status (Default)"
echo "2. i3-blocks"
read status

if [[ $status = "1" ]]
	#i3status
then
cat ~/Configurations/stable/i3/bar_i3status.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"
elif [[ $status = "2" ]]
	#i3blocks
then
    cat ~/Configurations/stable/i3/bar_i3blocks.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"
#elif [[ $status = "3" ]]
	#polybar
#then
#    cat ~/Configurations/stable/i3/bar_polybar.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"
fi

echo -e "${N}Writing Movement module into $CONFIG_NAME"
cat ~/Configurations/stable/i3/movement.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"

echo -e "${W}Writing Binds module into $CONFIG_NAME"
cat ~/Configurations/stable/i3/binds.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"

echo -e "${W} ${B}CONFIG GENERATING for I3 END${N}"

# Делаем файл только читаемым
chattr -i $CONFIG_NAME

## INSTALLING I3
echo "Installing i3, i3-gaps, i3blocks, i3status and another programms"

sudo apt install compton feh rofi lxappearance scrot i3 i3status i3blocks gifsicle fonts-noto-color-emoji
# Compton - Эффекты (тени, затемнение, прозрачность и т.д.)
# feh - выбор обоев
# Rofi - лаунчер программ (альтернатива dmenu)
# lxappearance - иконки, шрифты и многое другое

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
cd ~/gitinstalled/xwinwrap
make
sudo make install
make clean

## CONFIGURATION
# Status Bar
echo "CONFIGURATION (FINAL STEP)"
sleep 5 && clear
if [[ $status = "1" ]]
then
mkdir ~/.config/i3status
ln -sfr ~/Configurations/stable/GUI_configurations/i3status ~/.config/i3status/config
#elif [[ $status = "3" ]]
#then
#    ~/Configurations/stable/GUI_configurations/linkpolybar.sh
fi

# I3 configuration
mkdir ~/.config/i3
ln -sfr ~/Configurations/stable/i3conf_*  ~/.config/i3/config

#Compton, Xresources (Xterm, Rofi) and Dunst
ln -sfr ~/Configurations/stable/GUI_configurations/compton ~/.config/compton.conf
ln -sfr ~/Configurations/stable/GUI_configurations/XRESOURCES-for-all ~/.Xresources
mkdir ~/.config/dunst
ln -sfr ~/Configurations/stable/GUI_configurations/dunstrc ~/.config/dunst/dunstrc
