" Whitespace
set tabstop=4                   " Set literal tab width and display
set softtabstop=4               " Set tab width for insertion and <BS>
set shiftwidth=4                " Set CTRL-T, > (add indent) & CTRL-D, < (remove indent) widths
set noexpandtab                 " Ensure tabs are not expanded to spaces

" Auto-Pairs
" Add '<' and '>' to list of automatic pairs
let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '<':'>'}
