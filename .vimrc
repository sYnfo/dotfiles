set nocompatible

" Install vim-plug unless it's already installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/vim-grammarous', { 'for': 'text' }
Plug 'w0rp/ale', { 'for': 'python' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
call plug#end()

" Turn spellcheck on for text files
autocmd FileType text setlocal spell

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

" show whitespace
set list
set backspace=indent,eol,start
set showtabline=2
set autoindent
set hlsearch
set incsearch
set relativenumber
set showmatch
set smartcase
set wildmenu
syntax on
set winwidth=80

set undofile
set undodir=~/.vim/undodir/

set scrolloff=3

set backupdir=~/.vim/backup/

set gdefault

set guioptions-=m
set guioptions-=T

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set laststatus=2

" Highlight current line
set cursorline

" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off
set nobackup
set nowb
set noswapfile

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ Line:\ %l\ \ Column:\ %c


iabbrev ipdb import ipdb; ipdb.set_trace()

cmap w!! %!sudo tee > /dev/null %

" Allows you to easily replace the current word and all its occurrences.
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

nnoremap <CR> :nohlsearch<cr>
" Move around splits with <c-jkhl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Set the default CtrlP search mode to mixed, so that it searched in
" buffer, files and MRU cache at the same it
let g:ctrlp_cmd = 'CtrlPMixed'

" Use fd for ctrlp.
let g:ctrlp_user_command = 'fd --type f --color never "" %s'

" Disable caching, since fd is so fast anyway
let g:ctrlp_use_caching = 0

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
    \ if line("'\"") > 0 &&  line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

" Delete trailing white space on save, useful for some filetypes
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

autocmd BufWritePre *.go,*.py,*.sh :call CleanExtraSpaces()

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Always show the status line
set laststatus=2

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
