" Tab specific option
set tabstop=8      "A tab is 8 spaces
set expandtab      "Always uses spaces instead of tabs
set softtabstop=2  "Insert 2 spaces when tab is pressed
set shiftwidth=2   "An indent is 2 spaces
set shiftround     "Round indent to nearest shiftwidth multiple
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" Running Haskell files as scripts
nmap ,r :!time stack exec -- runhaskell --ghc-arg=-isrc/ %<CR>

" Reload on save
" autocmd BufWritePost *.hs execute ':1T :r'

" ale configs
let g:ale_fixers = {
  \ 'haskell': ['brittany', 'hlint', 'stylish-haskell'],
  \ 'javascript': ['eslint', 'prettier'],
  \ 'sh': ['shfmt'],
  \ }

let g:ale_linters = {
  \ 'haskell': ['hlint']
  \ }

let g:ale_fix_on_save = 1
let g:ale_haskell_brittany_executable='stack'
let g:ale_haskell_hlint_executable='stack'
let g:ale_haskell_stylish_haskell_executable='stack'
