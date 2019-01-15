[[ -r ~/.bashrc ]] && . ~/.bashrc


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$HOME/.cargo/bin:$PATH"

# OPAM configuration
. /home/roger/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
