set nocompatible
set cursorline

set encoding=utf-8
set nomodeline

set undodir^=~/.vimtemp/undo
set backupdir^=~/.vimtemp/backup
set directory^=~/.vimtemp/temp
set nobackup
set noswapfile

set incsearch

set wildmenu

set autoread
set autowrite

set ttyfast
set mouse=a

syntax on

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

set colorcolumn=80

execute pathogen#infect()
syntax on
filetype plugin indent on

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" resize current buffer by +/- 5 
nnoremap - :resize -5<cr>
nnoremap + :resize +5<cr>
" " Think of mapping that doesn't conflict
" " nnoremap > :vertical resize -5<cr>
" " nnoremap < :vertical resize +5<cr>

" have Y behave analogously to D and C rather than to dd and cc which is
" " already done by yy
noremap Y y$

inoremap jk <Esc>


" 'unbind' K which opens manpages for word under cursor
map <S-k> <Nop>

nmap <c-s> :wa<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>

" Have search traversal always center the screen
nmap n nzz
nmap N Nzz

" fonts and other styling options
colorscheme base16-solarized-dark

" airline options
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16_solarized'
set laststatus=2

" vim-flake8 options
" run flake8 when writing python file
autocmd BufWritePost *.py call Flake8()

" vim-javascript options
let g:javascript_plugin_jsdoc = 1

" vim-jsx options
let g:jsx_ext_required = 0

" vim fzf
set rtp+=/usr/local/opt/fzf

" create/load session
map <F2> :mksession! ~/.vim_session <cr> " Quick write session with F2
map <F3> :source ~/.vim_session <cr>     " And load session with F3

