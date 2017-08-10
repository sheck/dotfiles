# modify the prompt to contain git branch name if applicable
dirty_branch_marker() {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo " %{$fg_bold[red]%}✗%{$reset_color%}"
}
git_prompt_info() {
  current_branch=$(git current-branch 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}$(dirty_branch_marker)"
  fi
}
setopt promptsubst
PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '
