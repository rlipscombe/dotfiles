[[ -r ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# OPAM configuration
. /home/roger/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

if [ -e /Users/rlipscombe/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/rlipscombe/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# vi: ft=bash
