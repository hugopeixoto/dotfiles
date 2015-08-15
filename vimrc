" undo and swap file stuff
set directory=/tmp/
set undofile


" dunno
set showmatch

set modeline

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
set cinoptions+=t0
let g:sh_noisk=1


" selecta autocomplete
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction


" funky shortcuts that I always forget about, because they don't work
let mapleader = ","
map <Leader>. :w<CR>:!ruby -Itest %<CR>
map <Leader>r :source $MYVIMRC<CR>
map <Leader>s :w<CR>
map <Leader>i gg=G``
map <Leader>c :%!clang-format-3.5 -style=LLVM<CR>

cnoremap %% <C-R>=expand('%:h').'/'<cr>

noremap <Leader>v :call SelectaCommand("find * -type f", "", ":vs")<cr>
noremap <Leader>t :call SelectaCommand("find * -type f", "", ":tabnew")<cr>


" default action. It would be nice to define this by filetype.
noremap <cr> :!time ruby -I.:lib:app/services:test/specs:test %<cr>
