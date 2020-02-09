#!/bin/bash
sudo apt install vim tmux wget
			# Env
echo "Zsh or Fish?"
echo "[Z] or [F] (0 for nothing): "
read value1
if [[ $value1 == "Z" || $value1 == "z" ]]
then
	sudo apt install zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	ln -sfr ./zshrc ~/.zshrc
elif [[ $value1 == "F" || $value1 == "f" ]]
then
	sudo apt install fish
	curl -L https://get.oh-my.fish
fi
			# Terminals
echo "[A]lacritty, [H]yper, [X]term, x[F]ce4-terminal (0 for nothing): "
read value1
if [[ $value1 == "A" || $value1 == "a" ]]
then
	sudo add-apt-repository ppa:mmstick76/alacritty
	sudo apt install alacritty
	mkdir -p  ~/.config/alacritty
	mv ~/.config/alacritty/{alacritty.yml,alacritty.old}
	ln -sfr ./terminals/alacritty.yml ~/.config/alacritty/alacritty.yml
	sudo update-alternatives --config x-terminal-emulator
elif [[ $value1 == "H" || $value1 == "h" ]]
then
	wget https://releases.hyper.is/download/deb
	mv deb hyper.deb
        sudo dpkg -i hyper.deb
	rm hyper.deb
	mv ~/.{hyper.js,hyper.js.old}
	ln -sfr ./terminals/hyper.js ~/.hyper.js
	sudo update-alternatives --config x-terminal-emulator
elif [[ $value1 == "X" || $value1 == "x" ]]
then
	sudo apt install xterm
	mv ~/.Xresources ~/.Xresources.old
	ln -sfr ./terminals/Xresources-xterm ~/.Xresources
	xrdb ~/.Xresources
	sudo update-alternatives --config x-terminal-emulator
elif [[ $value1 == "F" || $value1 == "f" ]]
then
	sudo apt install xfce4-terminal
	mkdir -p ~/.config/xfce4/terminal/
	mv ~/.config/xfce4/terminal/terminalrc ~/.config/xfce4/terminal/terminalrc.old
	sudo update-alternatives --config x-terminal-emulator
	ln -sfr ./terminals/xfce4-terminalrc ~/.config/xfce4/terminal/terminalrc
fi

echo "[V]im, [D]oom Emacs, [S]pace Emacs, S[p]aceVim, [N]eoVim 0 - nothing"
read editor
editor=$(echo "$editor" | sed 's/.*/\L&/')
			# Installing Editor
echo "Installing editors"
if [[ $editor = "v" ]]
then
	sudo apt install vim
	export VISUAL=vim
	export EDITOR="$VISUAL"
elif [[ $editor = "d" ]]
then
	sudo add-apt-repository ppa:kelleyk/emacs
	sudo apt install emacs26
	git clone https://github.com/hlissner/doom-emacs ~/.emacs.d && ~/.emacs.d/bin/doom install
	echo "Emacs GUI or Emacs in terminal emulator? (G - gui, t - terminal): "
	read em
	em=$(echo "$em" | sed 's/.*/\L&/')
	if [[ $em = "g" ]]
	then
		export VISUAL=emacs
	    export EDITOR="$VISUAL"
	else
		export VISUAL="emacs -nw"
	    export EDITOR="$VISUAL"
	fi
elif [[ $editor = "s" ]]
then
	sudo add-apt-repository ppa:kelleyk/emacs
	sudo apt install emacs26
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
	echo "Emacs GUI or Emacs in terminal emulator? (G - gui, t - terminal): "
	read em
	em=$(echo "$em" | sed 's/.*/\L&/')
	if [[ $em = "g" ]]
	then
	    export VISUAL=emacs
		export EDITOR="$VISUAL"
	else
		export VISUAL="emacs -nw"
	    export EDITOR="$VISUAL"
	fi
elif [[ $editor = "p" ]]
then
	sudo apt install vim
	curl -sLf https://spacevim.org/install.sh
	bash ./install.sh
	export VISUAL=vim
	export EDITOR="$VISUAL"
elif [[ $editor = "n" ]]
then
	sudo apt install neovim
	export VISUAL=nvim
	export EDITOR="$VISUAL"
fi
			#Configs for editors
echo "Move editors configs"
if [[ $editor = "v" || $editor = "n" || $editor = "p" ]]
then
	#VIM
	mv ~/.{vimrc,vimrc.old}
	ln -sfr ./editors/vimrc ~/.vimrc
	#NEOVIM
	mv ~/.config/nvim/init.vim ~/.config/nvim/init.old
	ln -sfr ./editors/neovimrc ~/.config/nvim/init.vim
elif [[ $editor = "d" || $editor = "s" ]]
then
	#SPACEMACS
	echo "If you do not have Spacemacs, error - normal situation with mv"
	mv ~/.{spacemacs,spacemacs.old}
	ln -sfr ./editors/spacemacs ~/.spacemacs
	#DOOM EMACS
	echo "If you do not have Doom Emacs, error - normal situation with mv and ~/.doom.d/bin/doom refresh"
	mv ~/.doom.d/ ~/.doom.d.old
	ln -sfr ./editors/doom.d ~/.doom.d
	~/.emacs.d/bin/doom refresh
fi
echo "Move tmux configs"
mv ~/.{tmux.conf,tmux.conf.old}
ln -sfr ./tmux.conf ~/.tmux.conf
if [[ $editor = "d" || $editor = "s" ]]
then
	echo "Make alias emacs-gui (emacs) and emacs (emacs -nw)? (1 - yes, 0 - no): "
	read yon
	if [[ $yon = "1" ]]
	then
		alias emacs-gui="emacs"
		alias emacs="emacs -nw"
	fi
fi
echo "Maybe install some languages? [1 - yes or 0 - no]: "
read yon
if [[ $yon = "1" ]]
then
	sudo apt install python3
	python3 -c "from ProgrammerTweaker-modules import *; p = package_man(); install_programming_languages(p)"
fi
