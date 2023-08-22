autoload -Uz  add-zsh-hook vcs_info

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
PS1=' %B%F{202}%~%f%b ${vcs_info_msg_0_}: ' 

# setting vs code shortcut
alias code="flatpak run com.visualstudio.code"

# setting the shell defaults and environment variables

# terminal
export VISUAL=nvim

# XDG
export XDG_CONFIG_HOME=~/.dotconfig
