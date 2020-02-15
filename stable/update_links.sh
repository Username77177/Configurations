#!/bin/bash
echo "1: i3status or 2: i3-blocks"
echo "1 or 2"
read fos
if [[ $fos = "1" ]]
then
    mkdir ~/.config/i3status
    ln -sfr ~/Configurations/stable/GUI_configurations/i3status ~/.config/i3status/config
fi

#Compton, Xresources (Xterm, Rofi) and Dunst
ln -sfr ~/Configurations/stable/GUI_configurations/compton ~/.config/compton.conf
ln -sfr ~/Configurations/stable/GUI_configurations/XRESOURCES-for-all ~/.Xresources
mkdir ~/.config/dunst
ln -sfr ~/Configurations/stable/GUI_configurations/dunstrc ~/.config/dunst/dunstrc

# From buildfile
####################
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
# I3 configuration
mkdir ~/.config/i3
rm -rf ~/Configurations/stabl/i3conf_*
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

if [[ $status = "2" ]]
then
    cat ~/Configurations/stable/i3/bar_i3blocks.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"
else
    cat ~/Configurations/stable/i3/bar_i3status.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"
fi

echo -e "${N}Writing Movement module into $CONFIG_NAME"
cat ~/Configurations/stable/i3/movement.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"

echo -e "${W}Writing Binds module into $CONFIG_NAME"
cat ~/Configurations/stable/i3/binds.partofconfig_i3 >> $CONFIG_NAME && echo -e "${G}Succesfull!" || echo -e "${R}Fail!"

echo -e "${W} ${B}CONFIG GENERATING for I3 END${N}"

# Делаем файл только читаемым
chattr -i $CONFIG_NAME
###
ln -sfr ~/Configurations/stable/i3conf_* ~/.config/i3/config
