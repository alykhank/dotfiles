" ==============================
" Vim configuration file
" Alykhan Kanji
" Homepage: http://alykhan.com
" ~/.vimrc
" ==============================

"" Basics
set nocompatible                " Be iMproved

"" Map Leaders
let mapleader = ","             " Map comma as leader key
" Map <leader>ev to edit .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" Map <leader>eg to edit .gvimrc
nmap <silent> <leader>eg :e $MYGVIMRC<CR>

"" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"" Plugins {{{
"" Core Improvements
" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'matchit.zip'
NeoBundle 'IndexedSearch'
NeoBundle 'Raimondi/delimitMate'

"" VCS
NeoBundle 'mhinz/vim-signify'

"" Statusline
set laststatus=2                " Always display status line
NeoBundle 'bling/vim-airline'

"" Colours
NeoBundle 'altercation/vim-colors-solarized'
set background=dark

"" Language Support
NeoBundle 'lepture/vim-velocity'

"" Autocomplete
NeoBundle 'Valloric/YouCompleteMe'

"" File Search
NeoBundle 'kien/ctrlp.vim'
set runtimepath^=~/.vim/bundle/ctrlp.vim

"" Unite
NeoBundle 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
let g:unite_prompt='»'
nnoremap <leader>f :Unite file<CR>
nnoremap <leader>r :Unite file_rec<CR>

"" Installation check and clean
NeoBundleCheck
silent NeoBundleClean!
" }}}

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
" set visualbell                  " Flash instead of beeping

"" Wrapping
set linebreak                   " Wrap only at word boundaries
set showbreak=↪                 " Use character to indicate wrapped lines
set colorcolumn=+1              " Highlight the column after `textwidth`
" Set column highlight colour to black
highlight ColorColumn ctermbg=black guibg=black

"" Whitespace
set list                        " Show invisibles, display tabs as '▸   ', trailing spaces as '•', and eol as '¬'
set listchars=tab:▸\ ,trail:•,eol:¬
set tabstop=4                   " Set literal tab width and display
set softtabstop=4               " Set tab width for insertion and <BS>
set shiftwidth=4                " Set CTRL-T, > (add indent) & CTRL-D, < (remove indent) widths
set expandtab                   " Ensure tabs are expanded spaces
set shiftround                  " Round indents to multiples of shiftwidth
set autoindent                  " Enable autoindentation for new lines to match indent level of previous line
set smartindent               " Automatically indent lines after opening braces
set cindent                   " Enable indenting for C-style source code (including C++ and Java)
set backspace=indent,eol,start  " Backspace through everything in insert mode

"" Searching
set hlsearch                    " Highlight search terms...
set incsearch                   " ...dynamically as they are typed
set ignorecase                  " Ignore case when searching...
set smartcase                   " ...except when at least one uppercase letter is included
" Clear search highlights by pressing return
nnoremap <silent> <CR> :nohlsearch<CR>

"" Clipboard
set clipboard=unnamed           " Use system clipboard for yank and put in MacVim - terminal vim functionality deprecated in OS X Mountain Lion
" set go+=a                     " Automatically copy visual selection to the clipboard

"" Mappings
" By default `j` and `k` both move in a file by lines delimited by `\n` which
" is not helpful when linewrapping is enabled. These mappings ensure that I
" move up and down by display lines and not just lines delimited by `\n`.
noremap j gj
noremap k gk
" In order to not lose the original functionality of the `j` and `k` keys I
" map their functionality to `gj` and `gk` respectively.
noremap gj j
noremap gk k
