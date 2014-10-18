syntax on

call pathogen#infect('bundle/{}')

if has("autocmd")
  "set runtimepath+=/usr/local/Cellar/go/1.1/misc/vim
  filetype plugin indent on
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

ab heart ❤

runtime macros/matchit.vim

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\t\|\(\s\+$\)/
