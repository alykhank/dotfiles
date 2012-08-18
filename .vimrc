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
set linespace=4					" Set line widths
set scrolloff=3					" Keep lines visible 
set linebreak					" Wrap only at word boundaries
set visualbell                  " Flash instead of beeping
set showmatch                   " Highlight matching braces
filetype plugin indent on       " Detect filetype and load indent file for specific filetype
if has("gui_running")           " GUI is running or is about to start
    set lines=40 columns=160    " Set gvim window size
    set background=dark
    colorscheme solarized		" Use solarized colorscheme
    " set guifont=Consolas:h11
    " set guifont=Inconsolata:h11
    set guioptions-=T           " No toolbar
    set guioptions-=m           " Disallows gui menubar
    set guioptions-=r           " No scrollbars
endif

"" Whitespace
" set expandtab                   " Set tab to expand to spaces
set tabstop=4					" Set tab width
set shiftwidth=4                " Set CTRL-T, > (add indent) & CTRL-D, < (remove indent) widths
set shiftround					" Round indents to multiples of shiftwidth
set autoindent                  " Enable autoindentation for new lines to match indent level of previous line
set smartindent                 " Automatically indent lines after opening braces
set cindent                     " Enable indenting for C-style source code (including C++ and Java)
set backspace=indent,eol,start  " Backspace through everything in insert mode

"" Searching
set hlsearch                    " Highlight search terms...
set incsearch                   " ...dynamically as they are typed
set ignorecase                  " Ignore case when searching...
set smartcase                   " ...except when at least one uppercase letter is included
nnoremap <CR> :nohlsearch<CR>
" Clear search buffer by pressing Return

"" Clipboard
set clipboard=unnamed           " Use system clipboard for yank and put
" set go+=a                     " Automatically copy visual selection to the clipboard

"" Mappings
let mapleader = ","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" Map <leader>ev to edit .vimrc
