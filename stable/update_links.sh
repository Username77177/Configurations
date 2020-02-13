#!/bin/bash
echo "1: i3status or 2: i3-blocks"
echo "1 or 2"
read fos
if [[ $fos = "2" ]]
then
    mkdir ~/.config/i3status
    ln -sfr ~/Configurations/stable/GUI_configurations/i3status ~/.config/i3status/config
else
    mkdir ~/.config/i3blocks
    ln -sfr ~/Configurations/stable/GUI_configurations/i3blocks ~/.config/i3blocks/config
fi

#Compton, Xresources (Xterm, Rofi) and Dunst
ln -sfr ~/Configurations/stable/GUI_configurations/compton ~/.config/compton.conf
ln -sfr ~/Configurations/stable/GUI_configurations/XRESOURCES-for-all ~/.Xresources
mkdir ~/.config/dunst
ln -sfr ~/Configurations/stable/GUI_configurations/dunstrc ~/.config/dunst/dunstrc

# I3 configuration
mkdir ~/.config/i3
ln -sfr ~/Configurations/stable/i3conf_* ~/.config/i3/config
