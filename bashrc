[[ -s $HOME/.bash_prompt ]] && . $HOME/.bash_prompt
[[ -f $HOME/.bash_aliases ]] && . $HOME/.bash_aliases

export GREP_OPTIONS='--color=auto'

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM

export PATH=$PATH:$HOME/imp/toolchain/bin

case $OSTYPE in
  darwin*)
    # Put homebrew at the start of the PATH.
    export PATH=/usr/local/bin:$PATH

    # imp build process wants to use homebrew compiler, rather than the built-in one.
    export IMP_CC=/usr/local/bin/gcc-4.7
    export IMP_CXX=/usr/local/bin/g++-4.7
    ;;

  *)
    ;;
esac

