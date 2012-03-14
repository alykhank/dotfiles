" ==============================
" Vim configuration file
" Alykhan Kanji
" Homepage: http://alykhan.com
" ~/.vimrc
" ==============================

set nocompatible        " Don't force vi compatibility

set autoindent          " Enable autoindentation
set cindent             " Enable indenting for C-style source code (including C++ and Java)
set tabstop=4           " Set tab width to 4 characters
set softtabstop=4       " Set tab width to 4 characters
set shiftwidth=4        " Set CTRL-T (add indent) & CTRL-D (remove indent) widths to 4 characters
set expandtab           " Set tab to expand to spaces

set number              " Show line numbers
set ruler               " Show the current row and column

set hlsearch            " Highlight searches
set ignorecase          " Ignore case when searching
set smartcase           " no ignorecase if Uppercase character present

syntax on               " Enable syntax colouring
filetype on             " Detect filetype
" filetype indent on      " Load indent file for specific file type
