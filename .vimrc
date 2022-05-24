" pip install python-language-server

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'morhetz/gruvbox'
call plug#end()

set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set relativenumber
set hlsearch
set ruler

" Use mouse support
set mouse=a

" Treats long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Makes search starts as you type
set incsearch

" Highlight current line
set cursorline

" Turn on the WiLd menu
set wildmenu
set wildmode=list:longest,full

" Settings to show invisibles characters like atom
set list
set lcs=eol:¬,trail:·,tab:»·

highlight Comment ctermfg=green

set clipboard=unnamed

" Makes Space the leader key
let mapleader = "\<Space>"

" Quick save
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

let g:lsp_async_completion = 1
let g:asyncomplete_auto_popup = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

colorscheme gruvbox
filetype plugin indent on
syntax on

