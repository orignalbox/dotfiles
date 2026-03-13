# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Completion
autoload -U compinit colors && colors
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Better vi mode — show cursor shape based on mode
function zle-keymap-select {
    if [[ $KEYMAP == vicmd ]]; then
        echo -ne '\e[2 q'  # block cursor in normal mode
    else
        echo -ne '\e[6 q'  # bar cursor in insert mode
    fi
}
zle -N zle-keymap-select
echo -ne '\e[6 q'  # bar cursor on startup

# Prompt
PS1="%B%{%F{242}%}[%{%F{249}%}%n@%M %{%F{cyan}%}%~%{%F{242}%}]%{$reset_color%}$%b "

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# PATH — scripts available everywhere
export PATH="$HOME/dotfiles/scripts:$HOME/.local/bin:$PATH"

# Exports
export TERMINAL="st"
export EDITOR="vim"
export VISUAL="vim"

# Aliases — navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Aliases — ls
alias ls="ls --color=auto"
alias ll="ls -lh --color=auto"
alias la="ls -lah --color=auto"
alias l="ls -CF --color=auto"

# Aliases — shortcuts
alias v="vim"
alias c="clear"
alias q="exit"
alias mkdir="mkdir -pv"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -iv"
alias grep="grep --color=auto"

# Aliases — dotfiles
alias zshrc="vim ~/dotfiles/zsh/.zshrc && source ~/dotfiles/zsh/.zshrc"
alias sxhkdrc="vim ~/dotfiles/sxhkd/sxhkdrc && pkill -USR1 -x sxhkd"

# Aliases — system
alias update="sudo pacman -Syu"
alias install="sudo pacman -S"
alias remove="sudo pacman -Rns"
alias search="pacman -Ss"

# Autosuggestions — accept with right arrow or Ctrl+e
bindkey '^e' autosuggest-accept
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
