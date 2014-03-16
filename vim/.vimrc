set nocompatible

" pathogen configuration
call pathogen#runtime_append_all_bundles()

set nonumber
set ruler
set hidden
set history=200
syntax on
filetype plugin indent on

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
syntax enable
set t_Co=256
color slate

" To set the color with solarized
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

" hard to see the slate Search highlighted words
highlight Search ctermfg=Black ctermbg=Yellow cterm=NONE

" Edit a file in the directory of the file currently being edited
map ,e :e <C-R>=expand("%:p:h") . "/"<CR>
map ,, <C-^>
map <C-c> <ESC>

" Run rspec test on the currently edited file
map ,r :!time bin/rspec % --color<CR>
map ,d :!time bin/rspec % -fd --color<CR>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" set commentstrings
if !exists("autocmmands_loaded")
  let autocommands_loaded = 1
  autocmd FileType ruby set commentstring=#%s
endif

" regenerate tags for ctags
" collided with VimClojure, but I don't use this that often
" map <Leader>rt :!/usr/local/Cellar/ctags/5.8/bin/ctags --extra=+f -R *<CR>

" Edit of view files in same directory as current file
cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <Leader>e :edit %%
map <Leader>v :view %%

" Open files with <leader>f
" map <Leader>f :CommandTFlush<CR>\|:CommandT<CR>
" Open files, limited to the directory of the current file, with <leader>cf
" map <Leader>cf :CommandTFlush<CR>\|:CommandT %%<CR>

" Settings for ctrlp - a replacement for CommandT
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Use the current dir for working path if nothing defined
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/]\.(git|hg|svn)|vendor$'
      \ }

" for VimClojure
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

" Disable folding for vim markdown
let g:vim_markdown_folding_disabled=1

" hook in FindSpec
nmap ,a :call FindSpec()<CR>
