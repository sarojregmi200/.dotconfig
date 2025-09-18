#!/bin/zsh

# zsh plugin manager zinit
source "$HOME/.config/.dotconfig/zsh/chunks/zinit"

# loading all the custom scripts 
custom_script_path="$HOME/.config/.dotconfig/zsh/chunks/autoload"

for script in "$custom_script_path"/*; do
    if [ -f "$script" ]; then
        source "$script"
    fi
done

# loading the keybindings
source "$HOME/.config/.dotconfig/zsh/chunks/keybinds"

# Loading all the completions
source "$HOME/.config/.dotconfig/zsh/completions/loader.zsh"

# bun completions
[ -s "/Users/bright/.bun/_bun" ] && source "/Users/bright/.bun/_bun"

. "$HOME/.local/bin/env"

source <(COMPLETE=zsh jj)
. "/Users/bright/.deno/env"
# opencode
export PATH=/Users/bright/.opencode/bin:$PATH


# Herd injected PHP binary.
export PATH="/Users/bright/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/bright/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/bright/Library/Application Support/Herd/config/php/83/"
