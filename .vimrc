set nocompatible
set cursorline

set encoding=utf-8
set fileencoding=utf-8
set nomodeline

set undodir^=~/.vimtemp/undo
set backupdir^=~/.vimtemp/backup
set directory^=~/.vimtemp/temp
set nobackup
set noswapfile
set backspace=indent,eol,start

set incsearch

set wildmenu
set wildignore+=*.pyc,*.dat,*.DS_Store

set autoread
set autowrite

set ttyfast
set mouse=a

set nocp
set scrolloff=3
set wrap
set nu
set expandtab
set tabstop=2
set shiftwidth=2

" case insensitive / changes to
" case sensitive with capital letter
set ignorecase
set smartcase

set completeopt=menu,menuone,preview,noselect,noinsert

set background=dark
set colorcolumn=100
highlight ColorColumn ctermbg=8
autocmd FileType python set colorcolumn=100

let mapleader = ","

" set shell to zsh
if executable('zsh')
  set shell=zsh
endif

filetype plugin indent on

" mappings for buffer movement
map <Leader>n :bn<cr>
map <Leader>p :bp<cr>
map <Leader>d :bd<cr>

" open a new tab and search for something
nmap <Leader>a :tab split<CR>:Ack ""<Left>

" search for the word under the cursor in a new tab
nmap <Leader>A :tab split<CR>:Ack <C-r><C-w><CR>

" mappings for copying to clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" navigate windows more easily
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" resize current buffer by +/- 5
nnoremap - :resize -5<cr>
nnoremap + :resize +5<cr>
" nnoremap > :vertical resize -5<cr>
" nnoremap < :vertical resize +5<cr>

" have Y behave analogously to D and C rather than to dd and cc which is
" " already done by yy
noremap Y y$

" auto resize panes on vim resize
autocmd VimResized * wincmd =

" 'unbind' K which opens manpages for word under cursor
map <S-k> <Nop>

nmap <c-s> :wa<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" Have search traversal always center the screen
nmap n nzz
nmap N Nzz

" turn on syntax highlighting
syntax on

" create/load session
map <F2> :mksession! ~/.vim_session <cr> " Quick write session with F2
map <F3> :source ~/.vim_session <cr>     " And load session with F3

" airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1

" Airline integration with ALE
let g:airline#extensions#ale#enabled = 1

set laststatus=2

" vim-javascript options
let g:javascript_plugin_jsdoc = 1

" vim-jsx options
let g:jsx_ext_required = 0

" vim fzf
set rtp+=/usr/local/opt/fzf

" ctrlp-vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" better whitespace
autocmd BufWritePre * StripWhitespace

map S :SortByWidth

:nmap ]a :ALENextWrap<CR>
:nmap [a :ALEPreviousWrap<CR>
:nmap ]A :ALELast
:nmap [A :ALEFirst

let g:ale_open_list = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_completion_tsserver_autoimport = 1
let g:ale_completion_enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {
  \ 'javascript': ['eslint', 'flow'],
  \ 'javascriptreact': ['eslint', 'flow'],
  \ 'javascript.jsx': ['eslint', 'flow'],
  \ 'typescript': ['eslint', 'tsserver'],
  \ 'typescript.tsx': ['eslint', 'tsserver']
  \ }

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'

Plug 'HerringtonDarkholme/yats.vim'
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'hashivim/vim-terraform'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'digitaltoad/vim-pug'

Plug 'mileszs/ack.vim'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
