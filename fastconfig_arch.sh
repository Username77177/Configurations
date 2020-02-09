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
	ln -sfr ./zshrc ~/zshrc
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

echo "[V]im, [D]oom Emacs, [S]pace Emacs, S[p]aceVim, [N]eoVim 0 - nothing"
read editor
editor=$(echo "$editor" | sed 's/.*/\L&/')
# Installing Editor
echo "Installing editors"
if [[ $editor = "v" ]]
then
	sudo pacman -Sy vim
elif [[ $editor = "d" ]]
then
	sudo pacman -Sy emacs26
	git clone https://github.com/hlissner/doom-emacs ~/.emacs.d && ~/.emacs.d/bin/doom install
elif [[ $editor = "s" ]]
then
	sudo pacman -Sy emacs26
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
elif [[ $editor = "p" ]]
then
	sudo pacman -Sy vim
	curl -sLf https://spacevim.org/install.sh
	bash ./install.sh
elif [[ $editor = "n" ]]
then
	sudo pacman -Sy neovim

#Configs for editors
echo "Move editors configs"
if [[ $editor = "v" || $editor = "n" || $editor = "p" ]]
then
	mv ~/.{vimrc,vimrc.old}
	ln -sfr ./editors/vimrc ~/.vimrc
elif [[ $editor = "d" || $editor = "s" ]]
then
	echo "If you do not have Spacemacs, error - normal situation with mv"
	mv ~/.{spacemacs,spacemacs.old}
	ln -sfr ./editors/spacemacs ~/.spacemacs
	echo "If you do not have Doom Emacs, error - normal situation with mv and ~/.doom.d/bin/doom refresh"
	mv ~/.doom.d/ ~/.doom.d.old
	ln -sfr ./editors/doom.d ~/.doom.d
	~/.emacs.d/bin/doom refresh
fi
echo "Move tmux configs"
mv ~/.{tmux.conf,tmux.conf.old}
ln -sfr ./tmux.conf ~/.tmux.conf
