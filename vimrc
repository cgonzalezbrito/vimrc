" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.local/share/nvim/plugged')
Plug 'tyru/open-browser.vim'
Plug 'derekwyatt/vim-fswitch'
Plug 'morhetz/gruvbox'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'davidhalter/jedi-vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'lervag/vimtex'
Plug 'nvim-neotest/nvim-nio'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'puremourning/vimspector'
call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Remove all trailing whitespaces
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <F3> :NERDTreeToggle<cr>

let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>


" Mappings code goes here.
nnoremap <silent> <A-o> :FSHere<cr>
" Extra hotkeys to open header/source in the split
nnoremap <silent> <localleader>oh :FSSplitLeft<cr>
nnoremap <silent> <localleader>oj :FSSplitBelow<cr>
nnoremap <silent> <localleader>ok :FSSplitAbove<cr>
nnoremap <silent> <localleader>ol :FSSplitRight<cr>

noremap <c-left> gT
noremap <c-right> gt

" Debug mapping
nnoremap <silent> <Leader>D <Cmd>call vimspector#Launch()<CR>
nnoremap <silent> <F5> <Cmd>call vimspector#StepInto()<CR>
nnoremap <silent> <F6> <Cmd>call vimspector#StepOver()<CR>
nnoremap <silent> <F8> <Cmd>call vimspector#Continue()<CR>
nnoremap <silent> <F10> <Cmd>call vimspector#Reset()<CR>
nnoremap <silent> <F11> <Cmd>call vimspector#StepOut()()<CR>
nnoremap <silent> <Leader>b <Cmd>call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent> <Leader>cb <Cmd>call vimspector#ClearBreakpoints()<CR>
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

"let g:deoplete#enable_at_startup = 1

" This is new style
"call deoplete#custom#var('omni', 'input_patterns', {
"      \ 'tex': g:vimtex#re#deoplete
"      \})
" }}}

function! s:JbzCppMan()
  let old_isk = &iskeyword
  setl iskeyword+=:
  let str = expand("<cword>")
  let &l:iskeyword = old_isk
  execute 'Man ' . str
endfunction

command! JbzCppMan :call s:JbzCppMan()

au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>

" au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
" au BufEnter *.cc let b:fswitchdst = "h,hpp"
au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'


" STATUS LINE ------------------------------------------------------------ {{{

" Status bar code goes here.

" }}}

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


colorscheme gruvbox
set background=dark " use dark mode
" set background=light " uncomment to use light mode


let NERDTreeQuitOnOpen=1

let g:vimspector_install_gadgets = [ 'vscode-cpptools' ]

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-scriptease', {'type': 'opt'})

autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'evince'

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()
