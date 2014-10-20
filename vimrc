syntax on

call pathogen#infect('bundle/{}')

if has("autocmd")
  autocmd filetype plugin indent on
  autocmd BufWinEnter * match ExtraWhitespace /\(\s\+$\)/
  highlight ExtraWhitespace ctermbg=red guibg=red
endif

set directory=/tmp/
set hlsearch
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set undofile
set ruler
set showmatch
set relativenumber
set incsearch
set wildmenu
set smartindent

set foldmethod=syntax
set foldlevel=1
set synmaxcol=120
set backspace=indent,eol,start

" Wrapping mode on
nmap k gk
nmap j gj

let mapleader = ","
map <Leader>. :w<CR>:!ruby -Itest %<CR>
map <Leader>r :source $MYVIMRC<CR>
map <Leader>s :w<CR>

map <Leader>t :let g:CommandTAcceptSelectionCommand="e"<CR>:CommandT<CR>
map <Leader>vt :let g:CommandTAcceptSelectionCommand="vs"<CR>:CommandT<CR>

ab heart ❤

cnoremap %% <C-R>=expand('%:h').'/'<cr>
noremap <cr> :!time ruby -I.:lib:app/services:test/specs:test %<cr>
