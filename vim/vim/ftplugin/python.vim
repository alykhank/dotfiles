" Wrapping
setlocal textwidth=99                " Set wrap width

"" Whitespace
runtime! ftplugin/fourspaces.vim

" Abbreviations
iabbrev <silent> <buffer> #! #!/usr/bin/env python<CR><CR><C-R>=Eatchar('\/')<CR>
iabbrev <buffer> ifmain if __name__ == "__main__":<CR>main()<esc>
