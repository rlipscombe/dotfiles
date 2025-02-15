# Set up prompt
setopt PROMPT_SUBST
PROMPT=''
# If we're connected to this host over SSH, then show user@host
if [[ -n $SSH_CONNECTION ]]; then
  # user@host
  PROMPT+='%{%F{6}%}%n'
  PROMPT+='@%m:%{$reset_color%}'
fi
# Working directory, top 2 levels ...
PROMPT+='%{%F{14}%}%2~%f '
# git info
PROMPT+='$(git_prompt_info)'
# ... red/green by exitcode ...
PROMPT+='%(?:%{%F{green}%}:%{%F{red}%})'
# ... % or #
PROMPT+='%#%f '
