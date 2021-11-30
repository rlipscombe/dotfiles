PROMPT='%{$fg[cyan]%}%2~%{$reset_color%} '
PROMPT+='$(git_prompt_info)'
PROMPT+='%(?:%{$fg[green]%}:%{$fg[red]%})%#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[white]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
