# OSX doesn't have GNU ls.
case $OSTYPE in
  darwin*)
    alias ls='ls -FGh'
    # muscle memory: lsusb: do something vaguely similar
    alias lsusb='system_profiler SPUSBDataType'
  ;;
  *)
    alias ls='ls -F --color=auto'
  ;;
esac

# mv's default of overwriting the output file is annoying.
alias mv='mv -n'

# If mvim exists, then we're probably on the Mac;
# alias gvim=mvim, to save my muscle memory.
[[ `which mvim` ]] && alias gvim=mvim

# grep: use colors
export GREP_OPTIONS='--color=auto'
alias grep="$(which grep) $GREP_OPTIONS"
unset GREP_OPTIONS
