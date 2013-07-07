###### Autoloads
autoload -U promptinit
autoload colors         # named color arrays
colors
autoload -U compinit       # tab completion
compinit

###### Options
setopt auto_cd          # auto cd when dir name is typed
setopt cdablevars       # cd into named vars
setopt prompt_subst     # enable var expansion in prompt
setopt complete_in_word # when completing, keep cursor inline
setopt always_to_end    # move cursor to end of word if match inserted

source ~/.zsh/title.zsh

# Force it into vi mode
set -o emacs

###### Aliases
source ~/.zsh/.zsh_aliases

###### Directory Shortcuts
code=~/Code/Active
vendor=~/Code/Vendor

###### Functions
pless() {
  pygmentize $1 | less -r
}

e() {
  vim $*
}

reload() {
  source ~/.zshenv
  source ~/.zshrc
}

vpn() {
  osascript ~/bin/vpn_connector.scpt
}

gh() {
  rvm 1.8.7 && github $* && rvm 1.9.1
}

hi() {
  cd ~/Projects/Hireology/Code/$1
}

whodoneit() {
  for x in $(git grep --name-only $1); do
    git blame -f -- $x | grep $1;
  done
}

color-my-code() {
  pygmentize -f rtf -O style=colorful $1 | pbcopy
}

# make meta+bksp kill path components
function backward-kill-partial-word {
        local WORDCHARS="${WORDCHARS//[\/.]/}"
        zle backward-kill-word "$@"
}

vack () {
  vim $(ack -g $@)
}

runcuke() {
  time cucumber features -t $1
}

kill_it() {
  for X in `ps acx | grep -i $1 | awk {'print $1'}`; do
    kill -9 $X;
  done
}

zle -N backward-kill-partial-word
bindkey '^Xw' backward-kill-partial-word

source ~/.zsh/history.zsh
source ~/.zsh/completions.zsh
source ~/.zsh/git.zsh
source ~/.zsh/title.zsh

###### Prompt

PS1="%n@%m:%~%# "
PROMPT='%{$fg_bold[red]%}%m%{$fg[white]%}:%{$fg[blue]%}%~ %{$fg_bold[yellow]%}$(git-prompt) %{$fg_bold[white]%}✈ %{$reset_color%}'
PROMPT='$(git-prompt)%{$fg_bold[white]%}✈ %{$reset_color%}'
promptinit
prompt jaf

# Adding for rbenv, enable shims and autocompletion
eval "$(rbenv init -)"
