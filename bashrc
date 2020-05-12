[[ -s $HOME/.bash_prompt ]] && . $HOME/.bash_prompt
[[ -f $HOME/.bash_aliases ]] && . $HOME/.bash_aliases
[[ -f $HOME/.bash_functions ]] && . $HOME/.bash_functions

# "gnome-terminal" actually supports 256 color; turn that on.
export ACTUAL_TERM=$TERM
if [ "$COLORTERM" == "gnome-terminal" ]; then
  # But note that it doesn't support all of xterm's escape codes, so weird things
  # can happen if you trust this too much.
  export TERM=xterm-256color
  export COLORTERM=xterm-256color
fi

[[ "$OSTYPE" -ne "darwin" && -f $HOME/.dir_colors ]] && eval `dircolors ~/.dir_colors`

export EDITOR=vi
export VISUAL=vi

export HISTTIMEFORMAT='%F %T '

type -P direnv &>/dev/null && eval "$(direnv hook bash)"

export NVM_DIR=$HOME/.nvm
# Not macOS
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# macOS, Homebrew
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH=$HOME/bin:/usr/local/bin:$PATH

[ -s .bashrc.extra ] && \. ".bashrc.extra"

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if grep -qE '(Microsoft|WSL)' /proc/version &>/dev/null; then
    umask 0002
    export PATH="$PATH:$HOME/.local/bin"
fi

export QUOTING_STYLE=literal
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
