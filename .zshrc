export PATH=$HOME/.krew/bin:$HOME/bin:/usr/local/bin:/opt/local/bin:/usr/local/go/bin/:$PATH

# ensure UTF-8 is set as character encoding
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# set default text editor
export EDITOR=nvim

# tmux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_UNICODE=true

# Path to zsh functions
fpath=(~/.config/zsh/functions $fpath)
autoload -U $fpath[1]/*(.:t)

# Path to custom stuff
ZSH_CUSTOM="$HOME/.config/zsh/custom/"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
DEFAULT_USER=df
prompt_context(){}
plugins=(git tmux kubectl)
source $ZSH/oh-my-zsh.sh

# misc startup
unalias ts  # tmux plugin alias, replaced by function

# `gvm` for managing Golang version
[[ -s "/home/df/.gvm/scripts/gvm" ]] && source "/home/df/.gvm/scripts/gvm"

