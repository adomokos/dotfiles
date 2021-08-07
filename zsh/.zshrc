###### Autoloads
autoload -U promptinit
autoload colors # named color arrays
colors
autoload -U compinit # tab completion
compinit

###### Options
setopt auto_cd # auto cd when dir name is typed
setopt cdablevars # cd into named vars
setopt prompt_subst # enable var expansion in prompt
setopt complete_in_word # when completing, keep cursor inline
setopt always_to_end # move cursor to end of word if match inserted

source ~/.zsh/title.zsh

# Force it into vi mode
set -o emacs

###### Aliases
source ~/.zsh/.zsh_aliases

###### Directory Shortcuts
code=~/Code/Active
vendor=~/Code/Vendor

###### Functions
source ~/.zsh/func/ghci

e() {
  nvim $*
}

reload() {
  source ~/.zshenv
  source ~/.zshrc
}

make-init() {
  curl https://gist.githubusercontent.com/adomokos/2fd95840d59b19bbb3f4/raw/d884a0562ea508e6027844e289388736fe2eefac/Makefile > Makefile
}

vpn() {
  osascript ~/bin/vpn_connector.scpt
}

gsa() {
  git stash apply stash@{$1}
}

whodoneit() {
  for x in $(git grep --name-only $1); do
    git blame -f -- $x | grep $1;
  done
}

color-my-code() {
  bundle exec pygmentize -f rtf -O style=colorful $1 | pbcopy
}

# Haskell related functions
stack-ghcid() {
  local execute test project
  project=$(basename "$(pwd)")

  # build dependencies with --fast
  stack build "$project" --fast --pedantic --dependencies-only

  if [ -z "$1" ]; then
      test="main"
  else
      test="Test.Hspec.hspec $1.spec"
  fi
  execute="stack ghci $project\:lib $project\:spec --no-build --interleaved-output --ghci-options '+RTS -N'"

  stack exec -- ghcid --command "$execute" --test "$test"
}

# Docker functions
rm-exited() {
  # docker system prune -a
  docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm
}

# make meta+bksp kill path components
function backward-kill-partial-word {
        local WORDCHARS="${WORDCHARS//[\/.]/}"
        zle backward-kill-word "$@"
}

vack () {
  vim $(ack -g $@)
}

mkcd() {
  mkdir -p "$@" && cd "$_";
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
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# Make nix happy
# . /Users/adomokos/.nix-profile/etc/profile.d/nix.sh

# Run Kotlin programs
function kotlinr() {
  echo "Compiling >$1<, please wait..."
  kotlinc $1 -include-runtime -d out.jar
  java -jar out.jar
}

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/attila.domokos/.sdkman"
[[ -s "/Users/attila.domokos/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/attila.domokos/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/.google-cloud-sdk/path.zsh.inc' ]; then . '~/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/.google-cloud-sdk/completion.zsh.inc' ]; then . '~/.google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Configure asdf - https://asdf-vm.com/#/core-manage-asdf
. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
