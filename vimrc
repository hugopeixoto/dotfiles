" undo and swap file stuff
set directory=/tmp/
set undofile


" dunno
set showmatch


" interfacy stuff
set ruler
set relativenumber


" searching
set hlsearch
set incsearch
set wildmenu


" syntax and indentation
syntax on
filetype plugin indent on

if has("autocmd")
  autocmd BufWinEnter * match ExtraWhitespace /\(\s\+$\)/
  highlight ExtraWhitespace ctermbg=red guibg=red
endif

set synmaxcol=120
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set foldmethod=syntax
set foldlevel=1
set backspace=indent,eol,start


" funky shortcuts that I always forget about, because they don't work
let mapleader = ","
map <Leader>. :w<CR>:!ruby -Itest %<CR>
map <Leader>r :source $MYVIMRC<CR>
map <Leader>s :w<CR>

cnoremap %% <C-R>=expand('%:h').'/'<cr>


" default action. It would be nice to define this by filetype.
noremap <cr> :!time ruby -I.:lib:app/services:test/specs:test %<cr>
