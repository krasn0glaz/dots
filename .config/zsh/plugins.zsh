# Terraform autocomplete
autoload -U +X bashcompinit && bashcompinit
if [[ "$OSTYPE" == "darwin"* ]]; then
		complete -o nospace -C /opt/homebrew/bin/terraform terraform
fi

if ! [ -d ~/.atuin/bin ]; then
		curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
		source $HOME/.atuin/bin/env
fi

eval "$(~/.atuin/bin/atuin init zsh --disable-up-arrow)"
