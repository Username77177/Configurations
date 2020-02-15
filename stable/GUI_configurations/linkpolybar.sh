#!/bin/bash

mkdir ~/.config/polybar
ln -sfr ./polybar $HOME/.config/polybar/launch.sh
ln -sfr ./polybar_config.conf ~/.config/polybar/config
