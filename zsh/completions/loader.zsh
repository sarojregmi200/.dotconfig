# Loads all the completions
for script in "$HOME/.config/.dotconfig/zsh/completions/"*; do
    if [[ -f "$script" && $(basename "$script") != "loader.zsh" ]];then
        source "$script"
    fi
done
