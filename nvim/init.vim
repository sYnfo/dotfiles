" use vim settings, rather then vi settings (much better!).
" this must be first, because it changes other options as a side effect.
set nocompatible

" =============== character fixes ====================

scriptencoding utf-8
set encoding=utf-8

" ================ general config ====================

set backspace=indent,eol,start  "allow backspace in insert mode
set history=1000                "store lots of :cmdline history
set showcmd                     "show incomplete cmds down the bottom
set showmode                    "show current mode down the bottom
set gcr=a:blinkon0              "disable cursor blink
set noerrorbells                "no sounds on error
set novisualbell                "no blinking on error either
set autoread                    "reload files changed outside vim
set ruler                       "show ruler
set undolevels=1000             "undo levels
set laststatus=2                "fix status bar
set number

" this makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" highlight funky characters and whatnot
set list
set listchars=tab:▸\ ,trail:ـ,extends:➧,eol:¬

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.

if has('persistent_undo')
  "silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       " Don't wrap lines
set linebreak    " Wrap lines at convenient points

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" =============== mouse =====================
set mouse=n

" =============== python ====================

" let g:python_host_prog = $HOME . '/.pyenv/versions/py2neovim/bin/python'
" let g:python3_host_prog = $HOME . '/.pyenv/versions/py3neovim/bin/python'

" =============== vim-plug Initialization ===============

call plug#begin('~/.local/share/nvim/plugged')

for fpath in split(globpath('~/.config/nvim/layers', '**/packages.vim'), '\n')
  exe 'source' fpath
endfor

call plug#end()

for fpath in split(globpath('~/.config/nvim/layers', '**/config.vim'), '\n')
  exe 'source' fpath
endfor

" Load any Lua configs
for fpath in split(globpath('~/.config/nvim/layers', '**/config.lua'), '\n')
  exe 'luafile' fpath
endfor

" TODO: This should not be here!
" The mapping does not seem to register when in it's layer
noremap <Leader>fb :Buffers<CR>
noremap <Leader>fg :Rg<CR>

noremap <Leader>ff :call fzf#vim#files('', { 'source': g:FzfFilesSource(),
      \ 'options': [
      \   '--tiebreak=index', '--preview', g:fzf_preview_cmd
      \  ]})<CR>
