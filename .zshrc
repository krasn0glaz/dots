# ~/.zshrc

if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
		test -e "~/.config/iterm2/iterm2_shell_integration.zsh" && source "~/.config/iterm2/iterm2_shell_integration.zsh"
		export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

test -d ~/.config/zsh/geometry || git clone https://gitlab.com/krasn0glaz/geometry.git ~/.config/zsh/geometry
source ~/.config/zsh/geometry/geometry.zsh

test -d ~/.config/zsh/zsh-syntax-highlighting || git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/zsh/zsh-syntax-highlighting
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

test -d ~/.config/zsh/zsh-autosuggestions || git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.config/zsh/zsh-autosuggestions
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

test -d ~/.config/zsh/zsh-completions || git clone https://github.com/zsh-users/zsh-completions ~/.config/zsh/zsh-completions
fpath=(~/.config/zsh/zsh-completions/src $fpath)

test -d ~/.config/zsh/substring || git clone https://github.com/zsh-users/zsh-history-substring-search ~/.config/zsh/substring
source ~/.config/zsh/substring

test -d ~/.config/zsh/zsh-history-substring-search || git clone https://github.com/zsh-users/zsh-history-substring-search ~/.config/zsh/zsh-history-substring-search
source ~/.config/zsh/zsh-history-substring-search

# source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
# source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

source ~/.config/zsh/variables.zsh
source ~/.config/zsh/geometry-config.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/plugins.zsh

test -e ~/.dots || install-dotfiles

# on login
onlogin
