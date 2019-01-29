[[ -r ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"

# OPAM configuration
. /home/roger/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
