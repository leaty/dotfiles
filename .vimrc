if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('scrooloose/nerdtree')

  call dein#end()
  call dein#save_state()
endif

"Remember last pos
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin indent on
syntax enable

"Disable nvim bs
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=
"hi Normal guibg=NONE ctermbg=NONE
"hi NonText guibg=NONE ctermbg=NONE
hi StatusLine cterm=NONE
hi StatusLineNC cterm=NONE
hi VertSplit cterm=NONE
hi CursorLine cterm=NONE
"hi CursorColumn cterm=NONE guibg=NONE

"Statusline
"hi StatusLine ctermbg=magenta ctermfg=magenta
"hi StatusLineNC ctermbg=magenta ctermfg=magenta
hi statusline cterm=NONE ctermbg=NONE ctermfg=NONE
hi User1 ctermfg=226| "yellow
hi User2 ctermfg=203| "redpink
hi User3 ctermfg=251| "grey
hi User4 ctermfg=246| "darkgrey
set statusline=
"set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
"set statusline+=%#LineNr#
set statusline+=%1*%n%*\ »\ %2*%f%*
"set statusline+=\ %m
set statusline+=%=
"set statusline+=%#CursorColumn#
"set statusline+=\ %y
set statusline+=\ %3*%l,%c%*
set statusline+=\ %4*%p%%%*

"Line numbers
set number
set nuw=1
hi LineNr ctermfg=250

"Vertsplit
set fillchars+=vert:\ 
