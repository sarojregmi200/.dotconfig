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

# terminal
export VISUAL=nvim

# configuring the history
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.config/zsh/.zsh_history

# widget to call the script to search imp files
bindkey  -s '^f'  '~/.config/.dotconfig/bin/tmux-fzf-creator^M' 

#enabaling the ls color and ll as a better ls alias
alias ll="ls -alG"
alias ls="ls --color=auto"

# pnpm
export PNPM_HOME="/home/saroj/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
