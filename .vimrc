" ==============================
" Vim configuration file
" Alykhan Kanji
" Homepage: http://alykhan.com
" ~/.vimrc
" ==============================

" Basics {{{
set nocompatible                " Be iMproved
" }}}

" Map Leaders {{{
let mapleader = ","             " Map comma as leader key
" Map <leader>ev to edit .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" Map <leader>eg to edit .gvimrc
nmap <silent> <leader>eg :e $MYGVIMRC<CR>
" }}}

" Plugins {{{
" Vundle {{{
filetype off                    " required
" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" }}}

" Core Improvements {{{
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'vim-scripts/matchit.zip'
" }}}

" VCS {{{
Plugin 'airblade/vim-gitgutter'
" }}}

" Status Line {{{
set noshowmode                  " Hide default mode indicator
set laststatus=2                " Always display status line
Plugin 'bling/vim-airline'
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1
" }}}

" Language Support {{{
Plugin 'scrooloose/syntastic'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'majutsushi/tagbar'
nnoremap <silent> <leader>t :TagbarToggle<CR>
" }}}

" Autocomplete {{{
Plugin 'Valloric/YouCompleteMe'
" }}}

" All of your Plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required
" }}}

" Colorscheme {{{
set background=dark
highlight clear FoldColumn
highlight clear SignColumn
" }}}

" Syntax {{{
syntax enable                   " Enable syntax highlighting
set showmatch                   " Highlight matching braces
" }}}

" View {{{
set encoding=utf-8              " Set encoding to UTF-8
set showcmd                     " Display incomplete commands
set number                      " Show line numbers
set ruler                       " Show the current row and column
set linespace=4                 " Set line widths
set scrolloff=3                 " Scroll frame when close to top or bottom
set visualbell                  " Flash instead of beeping
" }}}

" Wrapping {{{
set linebreak                   " Wrap only at word boundaries
set showbreak=↪                 " Use character to indicate wrapped lines
" Highlight the column after `textwidth` and all after column 120 (max 256)
let &colorcolumn="+1,".join(range(120,375),",")
set formatoptions-=t            " Prevent automatic text wrapping
" Set colorcolumn highlight colour to black
highlight ColorColumn ctermbg=black
" }}}

" Whitespace {{{
set list                        " Show invisibles, display tabs as '▸   ', trailing spaces as '•', and eol as '¬'
set listchars=tab:▸\ ,trail:•,eol:¬
set tabstop=2                   " Set literal tab width and display
set softtabstop=2               " Set tab width for insertion and <BS>
set shiftwidth=2                " Set CTRL-T, > (add indent) & CTRL-D, < (remove indent) widths
set expandtab                   " Ensure tabs are expanded to spaces
set shiftround                  " Round indents to multiples of shiftwidth
set autoindent                  " Enable autoindentation for new lines to match indent level of previous line
set smartindent                 " Automatically indent lines after opening braces
set cindent                     " Enable indenting for C-style source code (including C++ and Java)
set backspace=indent,eol,start  " Backspace through everything in insert mode
" }}}

" Searching {{{
set hlsearch                    " Highlight search terms...
set incsearch                   " ...dynamically as they are typed
set ignorecase                  " Ignore case when searching...
set smartcase                   " ...except when at least one uppercase letter is included
" Clear search highlights by pressing return
nnoremap <silent> <CR> :nohlsearch<CR>
" }}}

" Folding {{{
set foldmethod=indent           " Enable code folding based on indentation
set foldcolumn=3                " Set width of column containing fold info
set foldlevelstart=20           " Load files with open folds
" Remap <Space> to toggle folds in normal mode only when they are present
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" }}}

" Clipboard {{{
set clipboard=unnamed           " Use system clipboard for yank and put
" }}}

" Splits {{{
" Sets the default splitting to be to the bottom and to the right.
set splitbelow
set splitright
" }}}

" Mappings {{{
" By default `j` and `k` both move in a file by lines delimited by `\n` which
" is not helpful when linewrapping is enabled. These mappings ensure that I
" move up and down by display lines and not just lines delimited by `\n`.
noremap j gj
noremap k gk
" In order to not lose the original functionality of the `j` and `k` keys I
" map their functionality to `gj` and `gk` respectively.
noremap gj j
noremap gk k
" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
" }}}

" vim:fdm=marker
