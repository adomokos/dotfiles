fpath=($fpath $HOME/.zsh/func)
export fpath
export PATH="/Users/adomokos/bin:/usr/local/git/bin:/usr/local/bin:/usr/local/sbin:/opt/homebrew/bin:$PATH"

# Adding hpack for Haskell
export PATH="$HOME/.local/bin:$PATH"
# Adding global npm executables
export PATH="/usr/local/share/npm/bin:$PATH"
export PAGER="less"
export EDITOR=vim
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export WORDCHARS="${WORDCHARS:s#/#}"

# For clojure
# export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar
# For node
# export NODE_PATH="/usr/local/lib/node_modules"

# For Elixir
# export PATH="/usr/local/Cellar/elixir/1.0.4/bin:$PATH"

# For pyenv
export PYENV_ROOT=/usr/local/var/pyenv

# For poetry Python
export PATH=$PATH:$HOME/.poetry/bin

# For gsed (gnu-sed)
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# For ES
export ES_HOME=$HOME/Documents/elasticsearch-5.4.1

# Having GOPATH will make Go(lang) Happy
export GOPATH=/Users/attila.domokos/.go
export PATH=$PATH:$GOPATH/bin

# Setting up nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Make Docker Desktop
export FR_DOCKERHOST=docker.for.mac.localhost

# Set up gcloud
export PATH=$PATH:$HOME/.google-cloud-sdk/bin

# Set up ghcup
export PATH=$PATH:$HOME/.ghcup/bin

# Set up rust
export PATH=$PATH:$HOME/.asdf/installs/rust/1.67.1/bin

# Set up psql with libpq - without postgres
export PATH=$PATH:/opt/homebrew/opt/libpq/bin
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"

export PATH="/opt/homebrew/sbin:$PATH"
