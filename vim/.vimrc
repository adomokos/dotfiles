set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fireplace'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'jiangmiao/auto-pairs'
Plugin 'fatih/vim-go'
Plugin 'ctrlp.vim'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'elixir-editors/vim-elixir'
Plugin 'ElmCast/elm-vim'
Plugin 'alx741/vim-hindent'
Plugin 'neomake/neomake'
Plugin 'parsonsmatt/intero-neovim'

call vundle#end()
filetype plugin indent on

" Enable the built-in matchit vim
" runtime macros/matchit.vim

" vim-airline is just not working without this
set laststatus=2

set relativenumber
set number

set ruler
set hidden
set history=200
syntax on

set visualbell " no beeping, thx
set autoindent

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set list listchars=tab:>-,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Load project specific .vimrc
set exrc
set secure

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Don't clutter my directories with swap files, bitch!
set nobackup
set nowritebackup
set noswapfile

" Make sure vim can read shell settings (sourced in ~/.profile)
set shell=/bin/sh

set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby
au BufRead,BufNewFile {*.liquid}    set ft=liquid

" Neovim needs this to reload file when changed
" https://github.com/neovim/neovim/issues/3326
set autoread
au FocusGained * :checktime

" Default color scheme
syntax enable
set t_Co=256
color slate

" Color the line number
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

"##" Change cursor style when entering INSERT mode (works in tmux!)
"##" This is cute, but might not work properly on OSX :-(, getting
"##" weird errors when system editor is invoked
"##if exists('$TMUX')
"##  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"##  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
"##  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"##else
"##  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"##  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"##  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"##endif

" NERDCommenter
let NERDDefaultNesting = 0
let NERDRemoveExtraSpaces = 1
let NERDSpaceDelims = 1

" hard to see the slate Search highlighted words
highlight Search ctermfg=Black ctermbg=Yellow cterm=NONE

" <C-l> to clear search result - no need for :noh
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>​

" Edit a file in the directory of the file currently being edited
nmap ,e :e <C-R>=expand("%:p:h") . "/"<CR>
nmap ,, <C-^>
nmap <C-c> <ESC>

" Include user's local vim config
if filereadable(expand("~/.vimrc.scripts"))
  source ~/.vimrc.scripts
endif

" regenerate tags for ctags
" collided with VimClojure, but I don't use this that often
" map <Leader>rt :!/usr/local/Cellar/ctags/5.8/bin/ctags --extra=+f -R *<CR>

" Edit of view files in same directory as current file
cnoremap %% <C-R>=expand('%:h').'/'<CR>
nmap <Leader>e :edit %%
nmap <Leader>v :view %%

" Open files with <leader>f
map <Leader>f :CommandTFlush<CR>\|:CommandT<CR>
" Open files, limited to the directory of the current file, with <leader>cf
map <Leader>cf :CommandTFlush<CR>\|:CommandT %%<CR>

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Use the current dir for working path if nothing defined
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/]\.(git|hg|svn)|vendor$'
    \ }

"##" for VimClojure
"##let g:vimclojure#HighlightBuiltins = 1
"##let g:vimclojure#ParenRainbow = 1

" Disable folding for vim markdown
let g:vim_markdown_folding_disabled=1

" Add bufferline to vim-airline
let g:airline_section_y = 'BN: %{bufnr("%")}'

" Modify auto-pair's <M-e> (Alt-e) to <C-e>
let g:AutoPairsShortcutFastWrap="<C-e>"

if !exists("autocmmands_loaded")
  let autocommands_loaded = 1
  au Filetype clojure source ~/.vim/scripts/clojure.vim
  " au Filetype elixir source ~/.vim/scripts/elixir.vim - don't need it just
  " yet
  au Filetype ruby source ~/.vim/scripts/ruby.vim
  au Filetype haskell source ~/.vim/scripts/haskell.vim
  au Filetype go source ~/.vim/scripts/go.vim
endif

if exists("&wildignorecase")
  set wildignorecase
endif

map <leader>= :Tabularize /=<CR>
map <leader>- :Tabularize /-><CR>
map <leader>, :Tabularize /,<CR>
map <leader># :Tabularize /#-}<CR>
