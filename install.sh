#/bin/bash

mkdir -p ~/.config/zsh
mkdir -p ~/.config/ranger/colorschemes

cp .zshrc ~/.zshrc
cp .config/zsh/*.zsh ~/.config/zsh/

cp .vimrc ~

cp .tmux.conf ~

cp .config/ranger/rc.conf ~/.config/ranger/rc.conf
cp .config/ranger/colorschemes/gruvbox.py ~/.config/ranger/colorschemes/gruvbox.py
