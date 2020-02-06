#!/bin/bash
sudo apt install fish vim tmux
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty
mkdir -p  ~/.config/alacritty
mv ~/.config/alacritty/{alacritty.yml,alacritty.old}
mv ~/.{vimrc,vimrc.old}
mv ~/.{tmux.conf,tmux.conf.old}
ln -sfr ./alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sfr ./.vimrc ~/
ln -sfr ./.tmux.conf ~/
