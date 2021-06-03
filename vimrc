syntax on
set encoding=utf8
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set number
set relativenumber
set noerrorbells
set nohlsearch
set hidden
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'
call plug#end()

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_hls_cursor='orange'
let g:gruvbox_guisp_fallback = 'bg'
colorscheme gruvbox

" Maps
let mapleader=" "
 
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>x :close<CR>

nnoremap <leader>u :UndotreeToggle<CR> <C-w>h <C-w>k

nnoremap <leader>p "+p
nnoremap <leader>P "+P
inoremap <C-V> "+gp
vnoremap <leader>y "+y

nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>d :bdel<CR>

" Spell checking
set spelllang=en_ca
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd BufRead,BufNewFile *.txt setlocal spell
set complete+=kspell

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

" Vimtex stuff
if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif
let g:vimtex_view_method = 'mupdf'
