# The git prompt's git commands are read-only and should not interfere with
# other processes. This environment variable is equivalent to running with `git
# --no-optional-locks`, but falls back gracefully for older versions of git.
# See git(1) for and git-status(1) for a description of that flag.
#
# We wrap in a local function instead of exporting the variable directly in
# order to avoid interfering with manually-run git commands by the user.
function __git_prompt_git() {
  GIT_OPTIONAL_LOCKS=0 command git "$@"
}

function git_prompt_info() {
  # If we are on a folder not tracked by git, get out.
  # Otherwise, check for hide-info at global and local repository level
  if ! __git_prompt_git rev-parse --git-dir &> /dev/null \
     || [[ "$(__git_prompt_git config --get oh-my-zsh.hide-info 2>/dev/null)" == 1 ]]; then
    return 0
  fi

  local ref
  ref=$(__git_prompt_git symbolic-ref --short HEAD 2> /dev/null) \
  || ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) \
  || return 0

  echo "${ZSH_THEME_GIT_PROMPT_PREFIX}$(git_remote_status)${ref}%{$reset_color%}$(git_prompt_status)${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

# Checks if working tree is dirty
function parse_git_dirty() {
  local STATUS
  local -a FLAGS
  FLAGS=('--porcelain')
  if [[ "$(__git_prompt_git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ "${DISABLE_UNTRACKED_FILES_DIRTY:-}" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    case "${GIT_STATUS_IGNORE_SUBMODULES:-}" in
      git)
        # let git decide (this respects per-repo config in .gitmodules)
        ;;
      *)
        # if unset: ignore dirty submodules
        # other values are passed to --ignore-submodules
        FLAGS+="--ignore-submodules=${GIT_STATUS_IGNORE_SUBMODULES:-dirty}"
        ;;
    esac
    STATUS=$(__git_prompt_git status ${FLAGS} 2> /dev/null | tail -n 1)
  fi
  if [[ -n $STATUS ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
}

# Gets the difference between the local and remote branches
function git_remote_status() {
    local remote ahead behind git_remote_status git_remote_status_detailed
    remote=${$(__git_prompt_git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]]; then
        ahead=$(__git_prompt_git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        behind=$(__git_prompt_git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

        if [[ $ahead -eq 0 ]] && [[ $behind -eq 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE"
        elif [[ $ahead -gt 0 ]] && [[ $behind -eq 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE"
        elif [[ $behind -gt 0 ]] && [[ $ahead -eq 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE"
        elif [[ $ahead -gt 0 ]] && [[ $behind -gt 0 ]]; then
            git_remote_status="$ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE"
        fi

        echo "$git_remote_status"
    else
        git_remote_status="$ZSH_THEME_GIT_PROMPT_NO_REMOTE"
        echo "$git_remote_status"
    fi
}

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

function git_prompt_status() {
  [[ "$(__git_prompt_git config --get oh-my-zsh.hide-status 2>/dev/null)" = 1 ]] && return

  local status_text
  status_text="$(__git_prompt_git status --porcelain 2> /dev/null)"

  # Don't continue on a catastrophic failure
  if [[ $? -eq 128 ]]; then
    return 1
  fi

  local status_lines
  status_lines=("${(@f)${status_text}}")

  for status_line in ${status_lines}; do
    index_status="${status_line[1]}"
    working_status="${status_line[2]}"

    case "$index_status" in
      A) (( index_added+=1 )) ;;
      M) (( index_modified+=1 )) ;;
      R) (( index_modified+=1 )) ;;
      C) (( index_modified+=1 )) ;;
      D) (( index_deleted+=1 )) ;;
      U) (( index_unmerged+=1 )) ;;
      *) ;;
    esac

    case "$working_status" in
      \?) (( working_unknown+=1 )) ;;
      A) (( working_added+=1 )) ;;
      M) (( working_modified+=1 )) ;;
      D) (( working_deleted+=1 )) ;;
      U) (( working_unmerged+=1 )) ;;
      *) ;;
    esac
  done

  echo -n "$ZSH_THEME_GIT_PROMPT_INDEX_PREFIX"
  [[ -v index_added ]] && echo -n " +$index_added"
  [[ -v index_modified ]] && echo -n " ~$index_modified"
  [[ -v index_deleted ]] && echo -n " -$index_deleted"
  [[ -v index_unmerged ]] && echo -n " !$index_unmerged"
  echo -n "$ZSH_THEME_GIT_PROMPT_INDEX_SUFFIX"

  echo -n "$ZSH_THEME_GIT_PROMPT_WORKING_PREFIX"
  [[ -v working_unknown ]] && echo -n " ?$working_unknown"
  [[ -v working_added ]] && echo -n " +$working_added"
  [[ -v working_modified ]] && echo -n " ~$working_modified"
  [[ -v working_deleted ]] && echo -n " -$working_deleted"
  [[ -v working_unmerged ]] && echo -n " !$working_unmerged"
  echo -n "$ZSH_THEME_GIT_PROMPT_WORKING_SUFFIX"

  echo "%{$reset_color%}"
}
