set nocompatible

set nonumber
set ruler
syntax on

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Status bar
set laststatus=2

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" Default color scheme
color wombat
set t_Co=256

" Ignore arrow keys in vim
:map <Left> <Nop>
:map <Right> <Nop>
:map <Up> <Nop>
:map <Down> <Nop>
:map <PageUp> <Nop>
:map <PageDown> <Nop>
:map <Home> <Nop>
:map <End> <Nop>

:map! <Left> <Nop>
:map! <Right> <Nop>
:map! <Up> <Nop>
:map! <Down> <Nop>
:map! <PageUp> <Nop>
:map! <PageDown> <Nop>
:map! <Home> <Nop>
:map! <End> <Nop>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" ctags settings
let Tlist_Ctags_Cmd = "/usr/local/Cellar/ctags/5.8/bin"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

" set commentstrings
if !exists("autocmmands_loaded")
  let autocommands_loaded = 1
  autocmd FileType ruby set commentstring=#%s
endif
