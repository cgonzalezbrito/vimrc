set nocompatible
filetype plugin indent on

" turn hybrid line numbers on
set number relativenumber
set nu rnu
set mouse=a
set numberwidth=1
set clipboard=unnamed
set showcmd
set ruler
set encoding=utf-8
set showmatch
set expandtab
set shiftwidth=2 
set softtabstop=2
set termguicolors
set laststatus=2

syntax enable

call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'davidhalter/jedi-vim'
Plug 'tomlion/vim-solidity'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plut 'honza/vim-snippets'
call plug#end()

colorscheme gruvbox
set background=dark " use dark mode
" set background=light " uncomment to use light mode

let g:deoplete#enable_at_startup = 1

let NERDTreeQuitOnOpen=1

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})

call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

nnoremap <C-p> :<C-u>FZF<CR>

