set nocompatible

""""VUNDLE SETUP""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'wellle/targets.vim'
""""

set background=dark
colorscheme solarized

"j/k per line on screen
nmap j gj
nmap k gk

map <Left> :p<CR>
map <Right> :n<CR>

filetype on
filetype plugin on
filetype indent on

set autoindent
set hlsearch
set incsearch
set relativenumber
set showmatch
set smartcase
set wildmenu

set undofile
set undodir=~/.vim/undodir/

set scrolloff=3

set backupdir=~/.vim/backup/

set gdefault

set guioptions-=m
set guioptions-=T

cmap w!! %!sudo tee > /dev/null %

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set laststatus=2

iabbrev ipdb import ipdb; ipdb.set_trace()
