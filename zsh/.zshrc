autoload -Uz  add-zsh-hook vcs_info

# for auto/tab completion
autoload -U compinit 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' menu select # matcher-list enables the case insensitivity.
setopt MENU_COMPLETE # to automatically show the results regardless of the case soon after the tab is pressed.
compinit

# for autosuggestions
source ~/.config/.dotconfig/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# enabaling the '${var}' option for string formatting.
setopt prompt_subst

# configuring the git command
add-zsh-hook precmd vcs_info	
zstyle ':vcs_info:*' check-for-changes true

#styling the git command
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '%c%u(%b)'

# setting the prompt string
PS1=' %B%F{202}%20<~/...<%~%<<%f%b ${vcs_info_msg_0_}: ' 

# Editor
export PATH="$PATH:/opt/nvim-linux64/bin"
export VISUAL=nvim

# Alias for terminal 
alias wezterm='flatpak run org.wezfurlong.wezterm'

# configuring the history
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.config/.dotconfig/zsh/.zshhist

# adding the fzf keybindings
eval "$(fzf --zsh)"

# shortcut to call the script to search imp files
bindkey  -s '^f'  '~/.config/.dotconfig/bin/tmux-fzf-creator^M' 

# shortcut to open notes folder when pressing ctrl + n
bindkey  -s '^n'  '~/.config/.dotconfig/bin/NotesOppener^M' 

#enabaling the ls color and ll as a better ls alias
alias ll="ls -alG"
alias ls="ls --color=auto"

# pnpm
export PNPM_HOME="/home/saroj/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac


export PATH="$PATH:/home/saroj/.local/bin"


# Android studio PATH
export ANDROID_HOME=$HOME/Android/Sdk/
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Adding rust tool chain to PATH
export PATH=$PATH:$HOME/.cargo/bin/

# bun completions
[ -s "/home/saroj/.bun/_bun" ] && source "/home/saroj/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# adding go to the path
export GO_PATH="/usr/local/go/"


# addind the zoxide configuration
eval "$(zoxide init zsh)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

# adding fnm
zinit light "dominik-schwabe/zsh-fnm"
export ZSH_FNM_NODE_VERSION="18.20.2"
