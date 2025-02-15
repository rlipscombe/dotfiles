# Set up colours
autoload -U colors && colors

# Set up prompt
PROMPT=''
# If we're connected to this host over SSH, then show user@host
if [[ -n $SSH_CONNECTION ]]; then
  # user@host
  PROMPT+='%{%F{6}%}%n'
  PROMPT+='@%m:%{$reset_color%}'
fi
# Working directory, top 2 levels ...
PROMPT+='%{%F{14}%}%2~%f '
# ... red/green by exitcode ...
PROMPT+='%(?:%{%F{green}%}:%{%F{red}%})'
# ... % or #
PROMPT+='%#%f '
