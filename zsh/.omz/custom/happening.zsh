betssm() {
    case $1 in
        creds|eks|clear)
            eval $(command betssm "$@") ;;
        *)
            command betssm "$@" ;;
    esac
}
