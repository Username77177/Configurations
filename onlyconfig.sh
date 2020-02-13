#!/bin/bash
#TMUX
mv ~/.{tmux.conf,tmux.conf.old}
ln -sfr ./tmux.conf ~/.tmux.conf
#SPACEMACS
echo "If you do not have Spacemacs, error - normal situation with mv"
mv ~/.{spacemacs,spacemacs.old}
ln -sfr ./editors/spacemacs ~/.spacemacs
#DOOM EMACS
echo "If you do not have Doom Emacs, error - normal situation with mv and ~/.doom.d/bin/doom refresh"
mv ~/.doom.d/ ~/.doom.d.old
ln -sfr ./editors/doom.d ~/.doom.d
~/.emacs.d/bin/doom refresh
#VIM
mv ~/.{vimrc,vimrc.old}
ln -sfr ./editors/vimrc ~/.vimrc
#NEOVIM
mv ~/.config/nvim/init.vim ~/.config/nvim/init.old
ln -sfr ./editors/neovimrc ~/.config/nvim/init.vim
