# Add krew to path
export PATH=$HOME/.krew/bin:/bin:$HOME/bin:$HOME/.local/bin:/usr/local/bin:/opt/local/bin:/bin:$PATH

# ensure UTF-8 is set as character encoding
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# set default text editor
export EDITOR=nvim
export VISUAL=nvim

# tmux
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_UNICODE=true

# Make Docker config available to Helm (auth stuff)
DOCKER_CONFIG="~/.docker/config.json"

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
plugins=(git tmux kubectl asdf terraform gcloud)

# Completions
source $ZSH/oh-my-zsh.sh
source <(kubectl completion zsh)

# misc
#unalias ts  # tmux plugin alias, replaced by function
RPROMPT='$(tf_prompt_info)'
eval "$(direnv hook zsh)"

# Add GOPATH/bin to path (from nvim plugin)
export PATH=$PATH:"$(go env GOPATH || "")/bin"

