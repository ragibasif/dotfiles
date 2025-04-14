" Required:
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on

colorscheme quiet
"colorscheme retrobox
"colorscheme lunaperche
"colorscheme sorbet

set background=dark
set number
set relativenumber

"*****************************************************************************
"" UNDO
"*****************************************************************************
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif

set undodir=~/.vim/undo/
set undofile

set nobackup
set nowritebackup
set noswapfile
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
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

set hidden
set wildmenu
set scrolloff=8
set noerrorbells visualbell t_vb=

"" Use modeline overrides
set modeline
set modelines=10

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
"augroup vimrc-sync-fromstart
"  autocmd!
"  autocmd BufEnter * :syntax sync maxlines=200
"augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END


"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"*****************************************************************************
"" Mappings
"*****************************************************************************

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" inoremap jk <esc>
" inoremap Jk <esc>
" inoremap JK <esc>
" inoremap jK <esc>
" vnoremap jk <esc>
" vnoremap Jk <esc>
" vnoremap JK <esc>
" vnoremap jK <esc>

