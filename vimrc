" pathogen
execute pathogen#infect()


" undo and swap file stuff
set directory=~/.vim/tmp/swap//
set undofile
set undodir=~/.vim/tmp/undo//


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
runtime macros/matchit.vim
syntax on
filetype plugin indent on

if has("autocmd")
  autocmd BufRead,BufNewFile *.rs setf rust
  autocmd BufRead,BufNewFile *.ejs setf html
  autocmd BufRead,BufNewFile */.ssh/config.d/* setf sshconfig

  autocmd BufWinEnter * match ExtraWhitespace /\(.\{800\}\zs.\+\)\|\(^\t\+\)\|\(\s\+$\)/
  highlight ExtraWhitespace ctermbg=red guibg=red

  autocmd VimResized * exe "normal \<c-w>="
endif

set autoindent
set backspace=indent,eol,start
set cinoptions+=t0
set expandtab
set foldlevelstart=99
set foldmethod=syntax
set nojoinspaces
set shiftwidth=2
set synmaxcol=500
set tabstop=2

let g:netrw_hide=1
let g:netrw_list_hide='.*\.un\~$'
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


function! SelectaCommand(choice_command, vim_command)
  try
    let selection = system(a:choice_command . " | selecta")
  catch /Vim:Interrupt/
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction


function! RunTest(lang, filename)
  exec ":w"

  if (a:lang == 'ruby')
    exec "!time ruby -Itest " . a:filename
  elseif (a:lang == 'c++')
    exec "!make"
  endif
endfunction


function! NextFile(choice_command, filename, vim_command, delta)
  if a:delta > 0
    let grep_dir = "-A" . a:delta
    let next_cmd = "tail -n1"
  else
    let grep_dir = "-B" . -a:delta
    let next_cmd = "head -n1"
  endif

  let grep_cmd = "egrep " . grep_dir . " '^\(\./\)?" . a:filename . "$'"

  let selection = system(a:choice_command . "|" . grep_cmd . "|" . next_cmd)

  exec a:vim_command . " " . selection
endfunction


" funky shortcuts
let mapleader = ","
let projectFilesLister = "find . -type f -not -name '*.un~' \| egrep -wv 'node_modules|tmp'"

noremap <Leader>. :w<CR>:!ruby -Itest %<CR>
noremap <Leader>r :source $MYVIMRC<CR>
noremap <Leader>c :call FormatCode(&ft)<CR>
noremap <Leader>c :%s#\($\n\s*\)\+\%$##<CR>gg=G :w<CR>

noremap <Leader>n :call NextFile(projectFilesLister, expand("%"), ":e", 1)<CR>
noremap <Leader>p :call NextFile(projectFilesLister, expand("%"), ":e", -1)<CR>

noremap <Leader>v :call SelectaCommand(projectFilesLister, ":vs")<cr>
noremap <Leader>t :call SelectaCommand(projectFilesLister, ":tabnew")<cr>
noremap <Leader>s :call SelectaCommand(projectFilesLister, ":sp")<cr>
noremap <Leader>e :call SelectaCommand(projectFilesLister, ":e")<cr>

noremap <cr> :call RunTest(&ft, expand("%"))<cr>
noremap <Space> <C-w><C-w>
