#!/bin/bash
sudo pacman -Sy vim tmux wget fuse
# Env
echo "Zsh or Fish?"
echo "[Z] or [F] (0 for nothing): "
read value1
if [[ $value1 == "Z" || $value1 == "z" ]]
then
	sudo pacman -Sy zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	ln -sfr ./zshrc ~/.zshrc
elif [[ $value1 == "F" || $value1 == "f" ]]
then
	sudo pacman -Sy fish
	curl -L https://get.oh-my.fish
fi
# Terminal
echo "[A]lacritty, [H]yper, [X]term, x[F]ce4-terminal (0 for nothing): "
read value1
if [[ $value1 == "A" || $value1 == "a" ]]
then
	sudo pacman -Sy alacritty
	mkdir -p  ~/.config/alacritty
	mv ~/.config/alacritty/{alacritty.yml,alacritty.old}
	ln -sfr ./terminals/alacritty.yml ~/.config/alacritty/alacritty.yml
elif [[ $value1 == "H" || $value1 == "h" ]]
then
	wget https://releases.hyper.is/download/AppImage
	mv AppImage hyper.appimage
	chmod +x hyper.appimage
	mv ~/.{hyper.js,hyper.js.old}
	ln -sfr ./terminals/hyper.js ~/.hyper.js
elif [[ $value1 == "X" || $value1 == "x" ]]
then
	sudo pacman -Sy xterm
	mv ~/.Xresources ~/.Xresources.old
	ln -sfr ./terminals/Xresources-xterm ~/.Xresources
	xrdb ~/.Xresources
elif [[ $value1 == "F" || $value1 == "f" ]]
then
	sudo pacman -Sy xfce4-terminal
	mkdir -p ~/.config/xfce4/terminal/
	mv ~/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc.old
	ln -sfr ./terminals/xfce4-terminalrc ~/.config/xfce4/terminal/terminalrc
fi
mv ~/.{vimrc,vimrc.old}
mv ~/.{tmux.conf,tmux.conf.old}
ln -sfr ./editors/vimrc ~/.vimrc
ln -sfr ./tmux.conf ~/.tmux.conf
