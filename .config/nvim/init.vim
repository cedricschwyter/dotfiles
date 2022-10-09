" vim-plug 
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin()
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Raimondi/delimitMate'
    Plug 'ervandew/supertab'
    Plug 'joshdick/onedark.vim'

call plug#end()

" required
filetype plugin indent on

" basic setup
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

" fix backspace indent
set backspace=indent,eol,start

" tabs
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

let mapleader=','

set hidden

set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

"set cursorline
"set cursorcolumn

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

syntax on
set ruler
set number
set relativenumber

let no_buffers_menu=1
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE
hi Search ctermbg=LightYellow
hi Search ctermfg=Black
hi Visual ctermbg=LightYellow
hi Visual ctermfg=Black

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10
set mouse=a
