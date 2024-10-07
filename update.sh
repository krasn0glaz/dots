#/bin/bash

cp ~/.zshrc .
cp -r ~/.config/zsh/*.zsh .config/zsh/

cp ~/.vimrc .

cp ~/.tmux.conf .

cp ~/.config/ranger/rc.conf .config/ranger/rc.conf
cp ~/.config/ranger/colorschemes/gruvbox.py .config/ranger/colorschemes/gruvbox.py

sed -e '/eza/ s/^#*/#/' -i .config/zsh/aliases.zsh
