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
let g:hindent_line_length = 80
let g:force_trailing_newline = 1

nmap ,r :!time stack exec -- runhaskell --ghc-arg=-isrc/ %<CR>
map <leader>i :Tabularize /\C[A-Z].*/<CR>

augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  " au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  " au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  " au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  au BufWritePost *.hs InteroReload
  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  " au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  " au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  " au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  " au FileType haskell map <silent> <leader>T <Plug>InteroType
  " au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  " au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  " au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

" Needed for faster Intero reload - https://github.com/parsonsmatt/intero-neovim/issues/150

" Intero starts automatically. Set this if you'd like to prevent that.
" let g:intero_start_immediately = 0

" Change the intero window size; default is 10.
let g:intero_window_size = 85

" Sets the intero window to split vertically; default is horizontal
let g:intero_vertical_split = 1


" set -fobject-code
setlocal formatprg=hindent
