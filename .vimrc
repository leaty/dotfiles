"Fix for vim, this is default for nvim
if &compatible | set nocompatible | endif

"Apply all abbreviations
"Disable intro message
"Disable file info
"Truncate file names
set shortmess=aIFt

"Set cmd height
"set cmdheight=2

"Indentation
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"Mouse
set mouse=a

"Clipboard
set clipboard+=unnamed
set clipboard+=unnamedplus

"Update time
set updatetime=100

"Vertsplit
"set fillchars+=vert:\ 

"Wrap
set nowrap

"Set hidden and confirm
set hidden
set confirm

"Remember last pos
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"Disable nvim bs
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
"hi Normal guibg=NONE ctermbg=NONE
"hi NonText guibg=NONE ctermbg=NONE
"hi CursorColumn cterm=NONE guibg=NONE

"Plugins
source ~/.vim/plugins.vim
source ~/.vim/plug.fzf.vim
source ~/.vim/plug.neomake.vim
source ~/.vim/plug.fugitive.vim
source ~/.vim/plug.sandwich.vim
source ~/.vim/plug.deoplete.vim
source ~/.vim/plug.ale.vim
source ~/.vim/plug.treesitter.vim

"Enable syntax
filetype plugin indent on
syntax enable

"Set colorscheme
colorscheme wal

"Includes
source ~/.vim/statusline.vim
source ~/.vim/linenumber.vim
source ~/.vim/cursor.vim
source ~/.vim/sign.vim
source ~/.vim/split.vim
source ~/.vim/binds.vim
