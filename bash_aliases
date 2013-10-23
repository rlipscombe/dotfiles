# OSX doesn't have GNU ls.
case $OSTYPE in
  darwin*)
    alias ls='ls -FGh'
    alias lsusb='system_profiler SPUSBDataType'
  ;;
  *)
    alias ls='ls -F --color=auto'
  ;;
esac

# If mvim exists, then we're probably on the Mac;
# alias gvim=mvim, to save my muscle memory.
[[ `which mvim` ]] && alias gvim=mvim

