set noexrc
set noex
set nosecure

" minimum width
set winwidth=100

" Put contents of unnamed register in OS X clipboard
set clipboard=unnamed

" map leader key to space
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" remap ESC to jk
inoremap jk <esc>

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

"make Y consistent with C and D
nnoremap Y y$
function! YRRunAfterMaps()
  nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
endfunction

"Clear current search highlight by hitting g + /
nmap <silent> <CR> :nohlsearch<CR>

"(v)im (r)eload
nmap <silent> <Leader>vr :so %<CR>

" remap : to ;
nnoremap ; :

" background
inoremap <C-Z> <Esc><C-Z>

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

" TODO: Allacrity may be intercepting the alt key codes :(
" Mappings to move lines
" alt+j/k to move up/down
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

" Remove arrow keys in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove arrow keys in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove arrow keys in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>
