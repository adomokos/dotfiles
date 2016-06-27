" Ruby specific NerdCommenter
set commentstring=#%s

" Run rspec test on the currently edited file
nmap ,r :!time bin/rspec % --color<CR>
nmap ,d :!time bin/rspec % -fd --color<CR>
nmap ,t :execute "!time bundle exec rspec %:" . line(".")<cr>

" hook in FindSpec
nmap ,a :call FindSpec()<CR>
