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
color desert

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
