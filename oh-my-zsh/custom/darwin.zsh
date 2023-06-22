case "$OSTYPE" in
  darwin*)
    unalias l la ll ls lsa

    # Add Homebrew-installed things to the PATH
    export PATH="/opt/homebrew/opt/erlang@24/bin:$PATH"
    export PATH="/opt/homebrew/opt/curl/bin:$PATH"
    export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
    export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
    export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
    export PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"

    # Workaround for the fact that GNU ls got to the front of $PATH
    alias ls="/bin/ls -GF"

    # Add flutter to PATH
    export PATH="$PATH:$HOME/Applications/flutter/bin"

    # Add Android SDK to PATH
    export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
  ;;
esac
