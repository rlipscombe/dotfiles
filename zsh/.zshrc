# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation. This isn't managed by 'stow'.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="rlipscombe"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

zstyle ':omz:plugins:ssh-agent' identities id_rsa id_work

# See https://github.com/ohmyzsh/ohmyzsh/issues/11789
zstyle ':omz:plugins:docker' legacy-completion yes

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.omz/custom

SHOW_AWS_PROMPT=false

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    aws
    brew
    direnv
    docker
    git
    helm
    kubectl
#    kube-ps1
    mix
    nvm
    ssh-agent
    rlipscombe-git
)

export KUBECONFIG="$HOME/.kube/config"

source $ZSH/oh-my-zsh.sh

# OMZ plugins are *obsessed* with adding aliases; delete them.
unalias afind &>/dev/null
unalias ${(k)aliases[(R)brew *]} &>/dev/null
unalias bubu &>/dev/null
unalias ${(k)aliases[(R)docker *]} &>/dev/null
unalias ${(k)aliases[(R)git *]} &>/dev/null
unalias g ggpur gk gke glp grt gstu gtl &>/dev/null
unalias ${(k)aliases[(R)kubectl *]} &>/dev/null
unalias k kca kgdsw kgdw kgdwide kgpl kgpn kgpvcw kgpw kgpwide kgssw kgsswide kgsw kgswide &>/dev/null

#if ! _kube_ps1_binary_check "${KUBE_PS1_BINARY}"; then
#  KUBE_PS1_ENABLED=off
#fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Add mix escripts to the PATH
export PATH="$PATH:$HOME/.mix/escripts"

# Add kubectl plugins managed by krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Prevent less from scrolling if the output would fit on one page;
# honour colour codes.
export LESS="--no-init --quit-if-one-screen -R"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Turn off Auto CD
unsetopt AUTO_CD

# Set open file limit to something a bit more usable
ulimit -n 524288

# Don't remove trailing slash on tab completion
setopt no_auto_remove_slash

# Preferred editor
export EDITOR=vi
export VISUAL=vi
