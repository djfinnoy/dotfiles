export PATH=$HOME/bin:/usr/local/bin:/opt/local/bin:/usr/local/go/bin/:$PATH

# Ensure UTF-8 is set as character encoding
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set default text editor
export EDITOR=nvim

# tmux
ZSH_TMUX_AUTOSTART=true

# Inline completions
zstyle ':completion:*:*:git:*' script ~/.config/zsh/functions/completion-git.zsh
zstyle ':completion:*:*:k:*' script ~/.config/zsh/functions/completion-k.zsh

# Path to your zsh functions
fpath=(~/.config/zsh/functions $fpath)
autoload -Uz \
  bbc bw bw-noi flushdns gcloud \
  gcurl gh-update gsutil helm \
  k k-noi kcc kcdelete kcls kcow \
  kcrename kdow kiow know kns knsd \
  kpow kpull kset ksow ktail lint-tf \
  lint-yaml printcolors tf tg tflogin tfvalidate \
  compinit && compinit

# Alias
alias R='R --no-save'


# oh-my-zsh
export ZSH="/home/df/.oh-my-zsh"
ZSH_THEME="awesomepanda"
plugins=(git tmux)
source $ZSH/oh-my-zsh.sh

