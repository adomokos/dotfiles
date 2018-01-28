fpath=($fpath $HOME/.zsh/func)
export fpath
export PATH="/Users/adomokos/bin:/usr/local/git/bin:/usr/local/bin:/usr/local/sbin:$PATH"

# Adding rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/shims:$PATH"
# Adding hpack for Haskell
export PATH="$HOME/.local/bin:$PATH"
# Adding global npm executables
export PATH="/usr/local/share/npm/bin:$PATH"
export PAGER="less"
export EDITOR=nvim
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export WORDCHARS="${WORDCHARS:s#/#}"

# For clojure
# export CLASSPATH=$CLASSPATH:/usr/local/Cellar/clojure-contrib/1.2.0/clojure-contrib.jar
# For node
# export NODE_PATH="/usr/local/lib/node_modules"

# For Elixir
export PATH="/usr/local/Cellar/elixir/1.0.4/bin:$PATH"

# For pyenv
export PYENV_ROOT=/usr/local/var/pyenv

# For ES
export ES_HOME=$HOME/Documents/elasticsearch-5.4.1

# Having GOPATH will make Go(lang) Happy
export GOPATH=~/Programming/Go/projects/
