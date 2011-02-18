function git-need-to-push() {
  if pushtime=$(echo $1 | grep 'Your branch is ahead' 2> /dev/null); then
    echo "↑ "
  fi
}

function git-prompt() {
  gstatus=$(git status 2> /dev/null)
  branch=$(echo $gstatus | head -1 | sed 's/^# On branch //')
  dirty=$(echo $gstatus | sed 's/^#.*$//' | tail -2 | grep 'nothing to commit (working directory clean)'; echo $?)
  if [[ x$branch != x ]]; then
    dirty_color=$fg[green]
    if [[ $dirty = 1 ]] { dirty_color=$fg[red] }
    [ x$branch != x ] && echo " %{$dirty_color%}$branch%{$reset_color%} "
  fi
}
