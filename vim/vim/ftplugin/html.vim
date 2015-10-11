" Whitespace
setlocal tabstop=2                   " Set literal tab width and display
setlocal softtabstop=2               " Set tab width for insertion and <BS>
setlocal shiftwidth=2                " Set CTRL-T, > (add indent) & CTRL-D, < (remove indent) widths
setlocal expandtab                   " Ensure tabs are expanded to spaces

" Auto-Pairs
" Add '<' and '>' to list of automatic pairs
let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '<':'>'}
