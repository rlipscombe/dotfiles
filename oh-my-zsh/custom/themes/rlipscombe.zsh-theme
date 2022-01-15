# Working directory, top 2 levels...
PROMPT='%{$fg[cyan]%}%2~%{$reset_color%} '
# ...git prompt info
PROMPT+='$(git_prompt_info)'
# ... % or #, red/green by exitcode
PROMPT+='%(?:%{$fg[green]%}:%{$fg[red]%})%#%{$reset_color%} '

# git_prompt_info settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[white]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"

# is the local repo ahead/behind/whatever w.r.t. the remote?
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{$fg[yellow]%}"
