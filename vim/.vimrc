set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax off
set background=dark
set spelllang=en_us

inoremap jk <esc>
inoremap Jk <esc>
inoremap JK <esc>
inoremap jK <esc>
vnoremap jk <esc>
vnoremap Jk <esc>
vnoremap JK <esc>
vnoremap jK <esc>
cnoremap jk <esc>
cnoremap Jk <esc>
cnoremap JK <esc>
cnoremap jK <esc>

set nobackup
set nowritebackup
set noswapfile

set nowrap

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set autoindent
set smartindent
set breakindent

set showmatch

set hlsearch
set incsearch
set ignorecase
set smartcase

set autoread
set backspace=indent,eol,start

set ft=tmux tw=0 nowrap
set t_Co=256
set termguicolors

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set smoothscroll

set hidden
set wildmenu
set scrolloff=10
set sidescrolloff=10
set noerrorbells visualbell t_vb=

if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif

if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif

set undodir=~/.vim/undo/
set undofile
