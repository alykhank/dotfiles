" ==============================
" Vim configuration file
" Alykhan Kanji
" Homepage: http://alykhan.com
" ~/.vimrc
" ==============================

set nocompatible                " Don't force vi compatibility

"" Plugins
call pathogen#infect()          " Enable pathogen plugin

"" Syntax
syntax enable                   " Enable syntax highlighting
filetype plugin indent on       " Detect filetype and load indent file for specific filetype
set showmatch                   " Highlight matching braces

"" View
set encoding=utf-8              " Set encoding to UTF-8
set showcmd                     " Display incomplete commands
set number                      " Show line numbers
set ruler                       " Show the current row and column
set linespace=4                 " Set line widths
set scrolloff=3                 " Keep lines visible
" set visualbell                    " Flash instead of beeping

"" GUI
if has("gui_running")           " GUI is running or is about to start
    set lines=40 columns=160    " Set gvim window size
    set cursorline              " Highlight the current row
    set background=dark         " Use dark background
    colorscheme solarized       " Use 'Solarized' colorscheme
    " set guifont=Consolas:h11
    " set guifont=Inconsolata:h11
    set guifont=Menlo:h14       " Use Menlo 14pt
    set guioptions-=T           " No toolbar
    set guioptions-=m           " No GUI menubar
    " set guioptions-=r         " No scrollbars
endif

"" Wrapping
set linebreak                   " Wrap only at word boundaries
set showbreak=↪                 " Use character to indicate wrapped lines

"" Whitespace
set list                        " Show invisibles
set listchars=tab:\.\ ,trail:-  " Display tabs as '.   ' and trailing spaces as '-'
set tabstop=4                   " Set literal tab width and display
set softtabstop=4               " Set tab width for insertion and <BS>
set shiftwidth=4                " Set CTRL-T, > (add indent) & CTRL-D, < (remove indent) widths
set expandtab                   " Set tab to expand to spaces
set shiftround                  " Round indents to multiples of shiftwidth
set autoindent                  " Enable autoindentation for new lines to match indent level of previous line
" set smartindent               " Automatically indent lines after opening braces
" set cindent                   " Enable indenting for C-style source code (including C++ and Java)
set backspace=indent,eol,start  " Backspace through everything in insert mode

"" Folding
" set foldmethod=indent         " Enable code folding based on indentation
" set nofoldenable              " Disable default folding
" set viewoptions=folds         " Preserve folds across sessions

"" Searching
set hlsearch                    " Highlight search terms...
set incsearch                   " ...dynamically as they are typed
set ignorecase                  " Ignore case when searching...
set smartcase                   " ...except when at least one uppercase letter is included
nnoremap <CR> :nohlsearch<CR>
" Clear search buffer by pressing Return

"" Clipboard
set clipboard=unnamed           " Use system clipboard for yank and put in MacVim - terminal vim functionality deprecated in OS X Mountain Lion
" set go+=a                     " Automatically copy visual selection to the clipboard

"" Mappings
let mapleader = ","             " Map comma as leader key
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" Map <leader>ev to edit .vimrc
