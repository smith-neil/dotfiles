# load custom functions
_load_functions() {
	_dir="$1"
	if [ -d "$_dir" ]; then
		for function in "$_dir"/**/*(N-.); do
			source $function;
		done
	fi	
}

# load config files
_load_configs() {
	_dir="$1"
	if [ -d "$_dir" ]; then
		if [ -d "$_dir/pre" ]; then
			for config in "$_dir"/pre/**/*(N-.); do
				source $config
			done	
		fi

		for config in "$_dir"/**/*(N-.); do
			case "$config" in
				"$_dir"/pre/*)
					:
					;;
				"$_dir"/post/*)
					:
					;;
				*)
					[[ -f $config ]] && source $config
			esac
		done

		if [ -d "$_dir/post" ]; then
			for config in "$_dir"/post/**/*(N-.); do
				source $config
			done
		fi
	fi
}

_load_functions "$HOME/.zsh/functions"
_load_configs "$HOME/.zsh/configs"

# load local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# set path (this would usually be set in zshenv but arch
# sources /etc/zprofile after ~/.zshenv and resets path
typeset -U path=(~/bin $path[@])

