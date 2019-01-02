set nocompatible

""""VUNDLE SETUP""""
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'wellle/targets.vim'
Plugin 'tpope/vim-surround'
Plugin 'janko-m/vim-test'
Plugin 'airblade/vim-gitgutter'
"Plugin 'w0rp/ale'
call vundle#end()
filetype plugin indent on
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
set winwidth=79

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

" Allows you to easily replace the current word and all its occurrences.
nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

nnoremap <CR> :nohlsearch<cr>
" Highlight current line
set cursorline
" Move around splits with <c-jkhl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100

" Syntastic status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = {
    \ "mode": "passive" }

nnoremap <Leader>s :SyntasticCheck<CR>


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

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.go,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

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

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

let test#strategy = "neovim"
let test#python#runner = 'nose'
nnoremap <Leader>t :w<CR> :TestFile<CR>
