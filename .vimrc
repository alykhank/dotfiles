" ==============================
" Vim configuration file
" Alykhan Kanji
" Homepage: http://alykhan.com
" ~/.vimrc
" ==============================

set nocompatible                " Don't force vi compatibility

"" Plugins
call pathogen#infect()

"" View
syntax enable                   " Enable syntax highlighting
set encoding=utf-8              " Set encoding to UTF-8
set showcmd                     " Display incomplete commands
set number                      " Show line numbers
set ruler                       " Show the current row and column
set cursorline                  " Highlight the current row
filetype plugin indent on       " Detect filetype and load indent file for specific filetype
if has("gui_running")           " GUI is running or is about to start
  set lines=40 columns=160      " Maximize gvim window
  set linespace=4               " Set line spacing to 4
  set background=light
  colorscheme solarized
  " set guifont=Consolas:h13
  " set guifont=Inconsolata:h11
  set guioptions-=T             " No toolbar
  " set guioptions-=r             " No scrollbars
endif
set visualbell                  " Flash instead of beeping

"" Whitespace
set softtabstop=4               " Set tab width to 4 characters
set shiftwidth=4                " Set CTRL-T (add indent) & CTRL-D (remove indent) widths to 4 characters
set expandtab                   " Set tab to expand to spaces
set autoindent                  " Enable autoindentation
set cindent                     " Enable indenting for C-style source code (including C++ and Java)
set backspace=indent,eol,start  " Backspace through everything in insert mode

"" Searching
set hlsearch                    " Highlight search terms...
set incsearch                   " ...dynamically as they are typed
set ignorecase                  " Ignore case when searching...
set smartcase                   " ...except when at least one uppercase letter is included

"" Clipboard
set clipboard=unnamed           " Use system clipboard for yank and put
" set go+=a                       " Automatically copy visual selection to the clipboard

"" Disable cursor keys in normal mode
map <Left>  :echo "Cursor Keys Disabled."<cr>
map <Right> :echo "Cursor Keys Disabled."<cr>
map <Up>    :echo "Cursor Keys Disabled."<cr>
map <Down>  :echo "Cursor Keys Disabled."<cr>
