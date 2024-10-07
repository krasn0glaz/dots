# Terraform autocomplete
autoload -U +X bashcompinit && bashcompinit
if [[ "$OSTYPE" == "darwin"* ]]; then
		complete -o nospace -C /opt/homebrew/bin/terraform terraform
fi
eval "$(atuin init zsh --disable-up-arrow)"
