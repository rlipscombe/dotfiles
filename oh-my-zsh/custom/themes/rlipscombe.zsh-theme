# Working directory, top 2 levels...
PROMPT='%{%F{14}%}%2~%{$reset_color%} '
PROMPT+='$(aws_prompt_info)'
PROMPT+='$(git_prompt_info)'
# ... % or #, red/green by exitcode
PROMPT+='%(?:%{$fg[green]%}:%{$fg[red]%})%#%{$reset_color%} '

ZSH_THEME_AWS_PREFIX="%{%F{214}%}<"
ZSH_THEME_AWS_SUFFIX=">%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%}]%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="%{%F{12}%}"      # blue
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%{%F{10}%}"      # green
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%{%F{9}%}"      # red
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%{%F{11}%}"   # yellow

ZSH_THEME_GIT_PROMPT_INDEX_PREFIX="%{%F{10}%}"
ZSH_THEME_GIT_PROMPT_INDEX_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_WORKING_PREFIX="%{%F{9}%}"
ZSH_THEME_GIT_PROMPT_WORKING_SUFFIX="%{$reset_color%}"
