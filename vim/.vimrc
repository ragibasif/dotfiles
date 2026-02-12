set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax off
set background=dark
colorscheme zenwritten
let mapleader = "\\"
let maplocalleader = "\\"

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
set spelllang=en_us
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set number
set relativenumber
set autoindent
set smartindent
set breakindent
set nrformats+=alpha
set nrformats+=octal
set nrformats+=hex
set nrformats+=bin
set nrformats+=blank
set showmode
set showcmd
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoread
set backspace=indent,eol,start
set t_Co=256
set termguicolors
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set ruler
set smoothscroll
set hidden
set wildmenu
set wildmode=list:longest
set scrolloff=10
set sidescrolloff=10
set noerrorbells visualbell t_vb=
set path+=**

if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
set undodir=~/.vim/undo/
set undofile

set foldenable
set foldmethod=manual
set foldnestmax=10
set foldlevelstart=10
set foldminlines=1
set foldcolumn=2

nnoremap <leader>d :r!date <CR>
map <leader>i gg=G``
autocmd BufWritePre * %s/\s\+$//e
