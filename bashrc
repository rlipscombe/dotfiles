[[ -s $HOME/.bash_prompt ]] && . $HOME/.bash_prompt
[[ -f $HOME/.bash_aliases ]] && . $HOME/.bash_aliases

export GREP_OPTIONS='--color=auto'

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

export PATH=/usr/local/bin:$PATH:$HOME/bin

# "gnome-terminal" actually supports 256 color; turn that on.
if [ "$COLORTERM" == "gnome-terminal" ]; then
  export TERM=xterm-256color
  export COLORTERM=xterm-256color
fi

if [ -f $HOME/bin/ei ]; then
  source $HOME/bin/ei
fi

