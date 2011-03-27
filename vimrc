set nocompatible

set nonumber
set ruler
set hidden
syntax on
filetype plugin on
set visualbell " no beeping, thx
set autoindent

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

" Don't clutter my directories with swap files, bitch!
set nobackup
set nowritebackup
set noswapfile

" Status bar
set laststatus=2

" Make sure vim can read shell settings (sourced in ~/.profile)
set shell=/bin/sh

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile {*.liquid}    set ft=liquid

" Default color scheme
color slate
set t_Co=256

" Edit a file in the directory of the file currently being edited
map ,e :e <C-R>=expand("%:p:h") . "/"<CR>

map ,, <C-^>

map <C-c> <ESC>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" ctags settings
"let Tlist_Ctags_Cmd = "/usr/local/Cellar/ctags/5.8/bin"
"let Tlist_WinWidth = 50
"map <F4> :TlistToggle<cr>

" set commentstrings
if !exists("autocmmands_loaded")
  let autocommands_loaded = 1
  autocmd FileType ruby set commentstring=#%s
endif

" pathogen configuration
call pathogen#runtime_append_all_bundles()
