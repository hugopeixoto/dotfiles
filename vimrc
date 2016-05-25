" undo and swap file stuff
set directory=/tmp/
set undofile


" dunno
set showmatch
set modeline


" interfacy stuff
set ruler
set relativenumber
set tabpagemax=100


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

set autoindent
set backspace=indent,eol,start
set cinoptions+=t0
set expandtab
set foldmethod=syntax
set nojoinspaces
set shiftwidth=2
set synmaxcol=120
set tabstop=2
let g:sh_noisk=1

function! FormatCode(lang)
  normal m`
  if (a:lang == 'go')
    exec ":%!gofmt"
  elseif (a:lang == 'c++')
    exec ":%!clang-format -style=LLVM"
  else
    normal "gg=G``"
  endif
  normal ``
endfunction


" selecta autocomplete
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction


" test functions
function! RunTest(lang, filename)
  exec ":w"

  if (a:lang == 'ruby')
    exec "!time ruby -I.:lib:app/services:test/specs:test " . a:filename
  elseif (a:lang == 'c++')
    exec "!make"
  endif
endfunction


" funky shortcuts
let mapleader = ","
map <Leader>. :w<CR>:!ruby -Itest %<CR>
map <Leader>r :source $MYVIMRC<CR>
map <Leader>c :call FormatCode(&ft)<CR>

noremap <Leader>v :call SelectaCommand("find * -type f", "", ":vs")<cr>
noremap <Leader>t :call SelectaCommand("find * -type f", "", ":tabnew")<cr>

noremap <cr> :call RunTest(&ft, %)<cr>
