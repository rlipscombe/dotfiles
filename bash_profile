[[ -r ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# OPAM configuration
. /home/roger/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# vi: ft=bash
