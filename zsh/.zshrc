autoload -Uz  add-zsh-hook vcs_info

# for auto/tab completion
autoload -U compinit 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' menu select # matcher-list enables the case insensitivity.
setopt MENU_COMPLETE # to automatically show the results regardless of the case soon after the tab is pressed.
compinit

# configuring the vi mode
# bindkey -v
# export KEYTIMEOUT=1

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

# terminal
export VISUAL=nvim

# configuring the history
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.config/zsh/.zsh_history

# pnpm
export PNPM_HOME="/home/saroj/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#

# for the bun to run
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# adding deno to the PATH
export DENO_INSTALL="/home/saroj/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# widget to call the script to search imp files
bindkey  -s '^f'  '~/.config/.dotfiles/bin/tmux-fzf-creator^M' 

# this is for loading nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


#adding go the path
GO_PATH='/usr/local/go'
export PATH="$GO_PATH/bin:$PATH"
