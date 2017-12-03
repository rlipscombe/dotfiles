[[ -s $HOME/.bash_prompt ]] && . $HOME/.bash_prompt
[[ -f $HOME/.bash_aliases ]] && . $HOME/.bash_aliases

# "gnome-terminal" actually supports 256 color; turn that on.
export ACTUAL_TERM=$TERM
if [ "$COLORTERM" == "gnome-terminal" ]; then
  # But note that it doesn't support all of xterm's escape codes, so weird things
  # can happen if you trust this too much.
  export TERM=xterm-256color
  export COLORTERM=xterm-256color
fi

[[ -f $HOME/.dir_colors ]] && eval `dircolors ~/.dir_colors`

export EDITOR=vi
export VISUAL=vi

export HISTTIMEFORMAT='%F %T '

export GREP_OPTIONS='--color=auto'
alias grep="$(which grep) $GREP_OPTIONS"
unset GREP_OPTIONS

type -P direnv &>/dev/null && eval "$(direnv hook bash)"

export NVM_DIR=$HOME/.nvm
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

export PATH=/usr/local/bin:$PATH:$HOME/bin
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

if [ -f $HOME/bin/ei ]; then
  source $HOME/bin/ei
fi
