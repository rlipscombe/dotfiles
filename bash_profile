[[ -r ~/.bashrc ]] && . ~/.bashrc

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# OPAM configuration
. /home/roger/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi
if [ -e $HOME/owl/owl.bashrc ]; then . $HOME/owl/owl.bashrc; fi

# vi: ft=bash
. "$HOME/.cargo/env"
