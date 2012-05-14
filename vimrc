set nocompatible

" pathogen configuration
call pathogen#runtime_append_all_bundles()

set nonumber
set ruler
set hidden
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
map ,r :!time rspec % --color<CR>
map ,d :!time rspec % -fd --color<CR>

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
map <Leader>f :CommandTFlush<CR>\|:CommandT<CR>
" Open files, limited to the directory of the current file, with <leader>gf
map <Leader>gf :CommandTFlush<CR>\|:CommandT %%<CR>

" for VimClojure
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1

"function! FindSpec()
  "let l:cwd=getcwd()
  "let l:file_path=expand("%:p")
  "let l:split_path=split(l:file_path, "/")

  "let l:big_red_index = index(l:split_path, "big_red")

  "if l:big_red_index == -1
    "echo "No big_red folder was found"
    "return
  "endif

  "" Inject the spec/units folders after big_red
  "call insert(l:split_path, "spec/units", l:big_red_index+1)

  "let l:file_name = l:split_path[len(l:split_path)-1]
  "let l:spec_file_name = strpart(l:file_name, 0, strlen(l:file_name)-3)."_spec.rb"

  ""replace the file name with the spec file name
  "let l:split_path[len(l:split_path)-1] = l:spec_file_name

  "let l:spec_file_path = join(l:split_path, "/")

  "echo l:spec_file_path
  "execute ":vsplit /".l:spec_file_path
"endfunction

"nmap ,a :call FindSpec()<CR>
