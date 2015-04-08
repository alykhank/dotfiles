" Wrapping
set textwidth=99                " Set wrap width

" Whitespace
set tabstop=4                   " Set literal tab width and display
set softtabstop=4               " Set tab width for insertion and <BS>
set shiftwidth=4                " Set CTRL-T, > (add indent) & CTRL-D, < (remove indent) widths
set expandtab                   " Ensure tabs are expanded to spaces

" Abbreviations
iabbrev <silent> <buffer> #! #!/usr/bin/env python<CR><CR><C-R>=Eatchar('\/')<CR>
iabbrev <buffer> ifmain if __name__ == "__main__":<CR>main()<esc>
