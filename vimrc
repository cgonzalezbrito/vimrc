" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/.local/share/nvim/plugged')
Plug 'jiangmiao/auto-pairs'						" Automatic quote and bracket completion
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'morhetz/gruvbox'							" Appearance colorscheme plugin
Plug 'neomake/neomake'							" Code checker plugin
Plug 'puremourning/vimspector'						" GDB
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }		" Autocomplete
Plug 'tmhedberg/SimpylFold'						" Fold
Plug 'vim-airline/vim-airline'						" Status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-jedi'

" Latext test

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'lervag/vimtex'

call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

let mapleader = " "	" Set leader
let maplocalleader = ","

nnoremap <Leader>nt :NERDTreeFind<CR>

noremap <c-left> gT
noremap <c-right> gt

" Debug mapping --------------------------------------------------------- {{{

nnoremap <silent> <Leader>D <Cmd>call vimspector#Launch()<CR>
nnoremap <silent> <F5> <Cmd>call vimspector#StepInto()<CR>
nnoremap <silent> <F6> <Cmd>call vimspector#StepOver()<CR>
nnoremap <silent> <F8> <Cmd>call vimspector#Continue()<CR>
nnoremap <silent> <F10> <Cmd>call vimspector#Reset()<CR>
nnoremap <silent> <F11> <Cmd>call vimspector#StepOut()()<CR>
nnoremap <silent> <Leader>b <Cmd>call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent> <Leader>cb <Cmd>call vimspector#ClearBreakpoints()<CR>

""" }}}

" }}}

" APPEARANCE  ------------------------------------------------------------ {{{

" turn hybrid line numbers on
set number relativenumber

colorscheme gruvbox
set background=dark " use dark mode
" set background=light " uncomment to use light mode

" STATUS BAR APPEARANCE ------------------------------------------------- {{{

let g:airline_theme='simple'

" }}}

" }}}

" BEHAVIOR --------------------------------------------------------------- {{{

" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = "/usr/lib64/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"

let NERDTreeQuitOnOpen=1

" Code checker
function! MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elseif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif

" Python code checker
let g:neomake_python_enabled_makers = ['pylint']

" }}}
