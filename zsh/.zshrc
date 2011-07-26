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
set -o vi

###### Aliases

alias vim='/Applications/MacVim/mvim -v'
alias ll='/bin/ls -Gla'
alias gsp='git stash pop'
alias gf='git fetch'
alias w3='cd ~/Sites/within3/big_red'
alias gorails='cd ~/Programming/Rails'
alias goruby='cd ~/Programming/Ruby'
alias bctags='/usr/local/Cellar/ctags/5.8/bin/ctags'
alias rsu='time rspec spec/units'

###### Directory Shortcuts

big_red=~/Sites/within3/big_red
w3public=~/Sites/within3_public
code=~/Code/Active
vendor=~/Code/Vendor

###### Functions

cdk_api() {
  rspec -t cdk_api -fd spec/units/cdk/$1
}

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

rvmpass() {
  rvm $1 --passenger
  sudo apachectl restart
}

gh() {
  rvm 1.8.7 && github $* && rvm 1.9.1
}

dump_yamls() {
  if [ -d $FILE ]; then
  else
    FILE=db/development
  fi

  FILE=$FILE TABLES=$1 rake w3:db:dump
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
  time cucumber features/acceptance -t $1
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

###### rvm
if [[ -s /Users/adomokos/.rvm/scripts/rvm ]] ; then source /Users/adomokos/.rvm/scripts/rvm ; fi
