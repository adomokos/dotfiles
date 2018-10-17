" Tab specific option
set tabstop=8      "A tab is 8 spaces
set expandtab      "Always uses spaces instead of tabs
set softtabstop=2  "Insert 4 spaces when tab is pressed
set shiftwidth=2   "An indent is 2 spaces
set shiftround     "Round indent to nearest shiftwidth multiple
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

let g:hindent_on_save = 0
let g:hindent_indent_size = 2
let g:hindent_line_length = 100
let g:force_trailing_newline = 1

nmap ,r :!time stack runhaskell %<CR>
