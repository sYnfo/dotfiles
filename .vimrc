set nocompatible

""""VUNDLE SETUP""""
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'ivanov/vim-ipython'
Bundle 'altercation/vim-colors-solarized'
""""

set background=dark
colorscheme solarized

"j/k per line on screen
nmap j gj
nmap k gk

filetype on
filetype plugin on
filetype indent on

set autoindent
set hlsearch
set incsearch
set relativenumber
set showmatch
set smartcase

set undofile
set undodir=/home/mstuchli/.vim/undodir/

set scrolloff=3

set backupdir=/home/mstuchli/.vim/backup/

set gdefault

set guioptions-=m
set guioptions-=T

cmap w!! %!sudo tee > /dev/null %

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

"autocmd BufReadPost *.spec "/%changelogmcgg"

function GitBlameCurrentLine()
      echo system('git blame -L'.line(".").','.line(".").' '.@%)
endfunction
