#!/bin/bash
sudo pacman -Sy vim tmux 
# Env
echo "Zsh or Fish?"
echo "[Z] or [F] (0 for nothing): "
read value1
if [[ $value1 == "Z" || $value1 == "z" ]]
then
	sudo pacman -Sy zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	ln -sfr ./.zshrc ~/
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
	ln -sfr ./alacritty.yml ~/.config/alacritty/alacritty.yml
	sudo update-alternatives --config x-terminal-emulator
elif [[ $value1 == "H" || $value1 == "h" ]]
then
	wget https://releases.hyper.is/download/deb
	mv deb hyper.deb
        sudo dpkg -i hyper.deb
	rm hyper.deb
	mv ~/.{hyper.js,hyper.js.old}
	ln -sfr ./.hyper.js ~/
	sudo update-alternatives --config x-terminal-emulator
elif [[ $value1 == "X" || $value1 == "x" ]]
then
	sudo pacman -Sy xterm
	mv ~/.Xresources ~/.Xresources.old
	ln -sfr ./Xresources-xterm ~/.Xresources
	xrdb ~/.Xresources
	sudo update-alternatives --config x-terminal-emulator
elif [[ $value1 == "F" || $value1 == "f" ]]
then
	sudo pacman -Sy xfce4-terminal
	mkdir -p ~/.config/xfce4/terminal/
	mv ~/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc.old
	sudo update-alternatives --config x-terminal-emulator
	ln -sfr ./xfce4-terminalrc ~/.config/xfce4/terminal/terminalrc
fi
mv ~/.{vimrc,vimrc.old}
mv ~/.{tmux.conf,tmux.conf.old}
ln -sfr ./.vimrc ~/
ln -sfr ./.tmux.conf ~/
