" Wrapping
setlocal textwidth=99                " Set wrap width

" Whitespace
setlocal tabstop=4                   " Set literal tab width and display
setlocal softtabstop=4               " Set tab width for insertion and <BS>
setlocal shiftwidth=4                " Set CTRL-T, > (add indent) & CTRL-D, < (remove indent) widths
setlocal expandtab                   " Ensure tabs are expanded to spaces

" Abbreviations
iabbrev <silent> <buffer> #! #!/usr/bin/env python<CR><CR><C-R>=Eatchar('\/')<CR>
iabbrev <buffer> ifmain if __name__ == "__main__":<CR>main()<esc>
