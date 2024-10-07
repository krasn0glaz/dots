# add to .zshrc to load stuff from here
wtr() {
	curl "wttr.in/$CITY?0nQ"
}

wttr() {
	curl "wttr.in/$1?$2"
}

v2.wttr() {
	curl "v2.wttr.in/$1?$2"
}

v3.wttr() {
	curl "v3.wttr.in/$1?$2"
}

# wttr.in autodectect ssh session
wttr_autodetect() {
    CLIENT_LOCATION=$(echo $SSH_CLIENT | awk '{print $1}')
    ARGS='0n'
    curl "wttr.in/@$CLIENT_LOCATION?$ARGS"
}

termsize() {
		echo "$(tput cols)x$(tput lines)"
}
# TODO: any reason to implement all of these as a script?
onlogin() {
if [ -n "$SSH_CONNECTION" ]; then
	printf "User $USER logged in on $SSH_TTY.\n"
	echo "You are on $HOST."
	echo "Welcome home, $USER!"
	wttr_autodetect
else
    #source  ~/.zkbd/xterm-256color-apple-darwin18.0
fi
}

zz() {
    file=$(fzf)
    if [ $? -eq 0 ]; then
	open $file
    fi
}

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi
