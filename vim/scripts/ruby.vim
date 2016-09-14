" Ruby specific NerdCommenter
set commentstring=#%s

nmap ,r :!time bin/rspec % --color<CR>
nmap ,d :!time bin/rspec % -fd --color<CR>
" Run rspec test on the currently edited file
nmap ,t :execute "!time bundle exec rspec %\:" . line(".")<CR>

" hook in FindSpec
nmap ,a :call FindSpec()<CR>
