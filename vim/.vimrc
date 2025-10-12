" Disable Vi compatibility mode - use Vim enhancements instead of strict Vi behavior
set nocompatible

" Enable file type detection
filetype on
" Enable loading plugin files for specific file types
filetype plugin on
" Enable loading indent files for automatic language-specific indentation
filetype indent on

" Disable syntax highlighting
syntax off
" Alternative: enable syntax highlighting (currently commented out)
"syntax on

" Set color scheme to work with dark terminal backgrounds
set background=dark
" Use the zenwritten color scheme
colorscheme zenwritten
" Alternative color scheme (currently commented out)
"colorscheme gruvbox

" Disable arrow keys and page navigation in normal mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <PageUp> <Nop>
nnoremap <PageDown> <Nop>

" Disable arrow keys and page navigation in insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>

" Disable arrow keys and page navigation in visual mode
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <PageUp> <Nop>
vnoremap <PageDown> <Nop>

" Map 'jk' to escape key in insert mode (all case variations)
inoremap jk <esc>
inoremap Jk <esc>
inoremap JK <esc>
inoremap jK <esc>

" Map 'jk' to escape key in visual mode (all case variations)
vnoremap jk <esc>
vnoremap Jk <esc>
vnoremap JK <esc>
vnoremap jK <esc>

" Map 'jk' to escape key in command-line mode (all case variations)
cnoremap jk <esc>
cnoremap Jk <esc>
cnoremap JK <esc>
cnoremap jK <esc>

" Disable backup files (~filename)
set nobackup
" Disable backup files while editing
set nowritebackup
" Disable swap files (.swp)
set noswapfile

" Disable line wrapping - long lines extend beyond screen
set nowrap

" Set spell check language to US English
set spelllang=en_us

" Set tab width to 4 spaces when displaying tabs
set tabstop=4
" Set indentation width to 4 spaces for >> and << commands
set shiftwidth=4
" Set number of spaces a tab counts for while editing
set softtabstop=4
" Convert tabs to spaces
set expandtab
" Insert/delete blanks according to 'shiftwidth', 'tabstop', or 'softtabstop'
set smarttab

" Show absolute line numbers
set number
" Show line numbers relative to cursor position
set relativenumber

" Copy indent from current line when starting new line
set autoindent
" Automatically insert indentation for programming languages
set smartindent
" Preserve indentation when wrapping lines
set breakindent

" Highlight matching brackets/parentheses when cursor is over them
set showmatch

" Enable incrementing/decrementing alphabetic characters with Ctrl-A/Ctrl-X
set nrformats+=alpha
" Enable octal number recognition for Ctrl-A/Ctrl-X
set nrformats+=octal
" Enable hexadecimal number recognition for Ctrl-A/Ctrl-X
set nrformats+=hex
" Enable binary number recognition for Ctrl-A/Ctrl-X
set nrformats+=bin
" Allow incrementing numbers with leading zeros
set nrformats+=blank

" Highlight all search matches
set hlsearch
" Show search matches as you type
set incsearch
" Ignore case in search patterns
set ignorecase
" Override ignorecase if search pattern contains uppercase letters
set smartcase

" Automatically reload files changed outside of Vim
set autoread

" (Dis)Allow backspace to delete indentation, line breaks, and past insertion point
"set backspace=indent,eol,start
set backspace=0

" Set filetype to tmux, disable text width limit, and disable wrapping
set ft=tmux tw=0 nowrap

" Enable 256 color support in terminal
set t_Co=256
" Enable 24-bit RGB color in terminal
set termguicolors

" Set character encoding used inside Vim
set encoding=utf-8
" Set character encoding for the current file
set fileencoding=utf-8
" List of encodings to try when opening files
set fileencodings=utf-8

" Indicate fast terminal connection for smoother redrawing
set ttyfast
" Enable smooth scrolling (Vim 9.0+)
set smoothscroll

" Allow switching buffers without saving changes
set hidden

" Enable command-line completion with enhanced menu
set wildmenu

" Keep 10 lines visible above/below cursor when scrolling
set scrolloff=10
" Keep 10 columns visible left/right of cursor when scrolling
set sidescrolloff=10

" Disable error bells and visual bell
set noerrorbells visualbell t_vb=

" Create .vim directory in home if it doesn't exist
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
" Create undo directory if it doesn't exist
if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "", 0700)
endif
" Set directory for undo files
set undodir=~/.vim/undo/
" Enable persistent undo across sessions
set undofile

" Allow recursive file searching with commands like :find and gf
set path+=**

" Enable folding (code collapsing)
set foldenable

" Set fold method to indent-based - folds created based on indentation levels
set foldmethod=indent
"Alternative fold methods you can try instead of indent:
"manual - Create folds manually with zf
"syntax - Folds based on syntax highlighting rules
"marker - Folds based on markers like {{{ and }}}

" Set maximum nesting of folds
set foldnestmax=10

" Start with folds open when opening a file (0=all open, higher numbers=more closed)
set foldlevelstart=10

" Set minimum number of lines for a fold to be created
set foldminlines=1

" Column width for fold indicators in the gutter (0=no column)
set foldcolumn=2

" fold keybindings
" zo - Open fold under cursor
" zc - Close fold under cursor
" zR - Open all folds in the file
" zM - Close all folds in the file
" zj - Move to next fold
" zk - Move to previous fold
