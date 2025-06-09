set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on


"colorscheme default
"colorscheme off
"colorscheme zenwritten
"colorscheme zenbones
"colorscheme sunbather


set cursorline
set cursorcolumn
set cc=80


set background=dark
set number
set relativenumber

"*****************************************************************************
"" UNDO
"*****************************************************************************
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
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
set scrolloff=10
set noerrorbells visualbell t_vb=

"" Use modeline overrides
set modeline
set modelines=10

"*****************************************************************************
"" Whitespace
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" Show invisible characters
set list
set listchars=eol:¬,tab:»·,space:·


"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************

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

nnoremap <leader>l :set list!<CR>
nnoremap <leader>w :FixWhitespace<CR>


inoremap jk <esc>
inoremap Jk <esc>
inoremap JK <esc>
inoremap jK <esc>
vnoremap jk <esc>
vnoremap Jk <esc>
vnoremap JK <esc>
vnoremap jK <esc>

