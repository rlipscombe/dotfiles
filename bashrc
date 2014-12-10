[[ -s $HOME/.bash_prompt ]] && . $HOME/.bash_prompt
[[ -f $HOME/.bash_aliases ]] && . $HOME/.bash_aliases

export GREP_OPTIONS='--color=auto'

export NVM_DIR=$HOME/.nvm
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

[[ -f $HOME/.dir_colors ]] && eval `dircolors ~/.dir_colors`

export PATH=/usr/local/bin:$PATH:$HOME/bin

# "gnome-terminal" actually supports 256 color; turn that on.
export ACTUAL_TERM=$TERM
if [ "$COLORTERM" == "gnome-terminal" ]; then
  # But note that it doesn't support all of xterm's escape codes, so weird things
  # can happen if you trust this too much.
  export TERM=xterm-256color
  export COLORTERM=xterm-256color
fi

if [ -f $HOME/bin/ei ]; then
  source $HOME/bin/ei
fi

export EDITOR=vi
export VISUAL=vi

# Slightly iffy hack to get SERVER_ID set, even when using sudo.
[[ -s /etc/profile.d/chef_vars.sh ]] && . /etc/profile.d/chef_vars.sh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

type -P direnv &>/dev/null && eval "$(direnv hook bash)"
