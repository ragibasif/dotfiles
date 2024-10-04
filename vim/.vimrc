"____    ____  __  .___  ___.
"\   \  /   / |  | |   \/   |
" \   \/   /  |  | |  \  /  |
"  \      /   |  | |  |\/|  |
"   \    /    |  | |  |  |  |
"    \__/     |__| |__|  |__|

" Basic settings
set nocompatible
filetype on
filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax on
set background=dark

" Show line numbers and relative line numbers
set number
set relativenumber

" Enable mouse usage in all modes
set mouse=a

set undofile
set nobackup
set nowritebackup
set noswapfile
set nowrap

" Set tabs and indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent

" Set search settings
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase

" Automatically read files that have changed outside of Vim
set autoread


set hidden

" Jump to the last known cursor position when reopening a file
if has("autocmd")
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" make gruvbox the colorscheme
autocmd vimenter * ++nested colorscheme gruvbox

" Set `jk` to Escape in Insert Mode and Visual Mode
inoremap jk <esc>
vnoremap jk <esc>

set ft=tmux tw=0 nowrap
set ft=kitty
set t_Co=256
set termguicolors


