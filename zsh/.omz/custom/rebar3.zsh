# Add rebar3 to the PATH
export PATH="$PATH:$HOME/.cache/rebar3/bin"

# see https://github.com/erlang/rebar3/issues/644#issuecomment-1148809618
# (be explicit, to avoid using gnubin/stty on macOS)
rebar3() {
    set -o localoptions -o localtraps
    trap '/bin/stty sane' INT
    command rebar3 "$@"
}
