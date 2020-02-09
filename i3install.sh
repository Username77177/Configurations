#!/usr/bin/env bash
# Some good links
# https://github.com/addy-dclxvi/i3-starterpack
# https://i3wm.org/docs/userguide.html
# https://wiki.archlinux.org/index.php/I3_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)#%D0%9D%D0%B0%D1%81%D1%82%D1%80%D0%BE%D0%B9%D0%BA%D0%B0

sudo apt install compton hsetroot rofi lxappearance scrot i3
# Compton - Эффекты (тени, затемнение, прозрачность и т.д.)
# Hsetroot - выбор обоев
# Rofi - лаунчер программ (альтернатива dmenu)
mkdir ~/.config/i3
ln -sfr ./i3wm/config_i3 ~/.config/i3/config
