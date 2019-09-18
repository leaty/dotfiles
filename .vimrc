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
	"call dein#add('flazz/vim-colorschemes')
	"call dein#add('airblade/vim-gitgutter') broken
	call dein#add('tpope/vim-fugitive', {'on_cmd' : 'Gstatus'})
	call dein#add('junegunn/fzf.vim')
	call dein#add('dominickng/fzf-session.vim')
	
	call dein#end()
	call dein#save_state()
endif

"Remember last pos
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin indent off
syntax enable

" Indentation
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"Disable nvim bs
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
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

"Vertsplit
set fillchars+=vert:\ 

"Mouse
set mouse=a
set clipboard+=unnamed
set clipboard+=unnamedplus

"Cursor
au VimLeave * set guicursor=a:hor25-blinkon250
set guicursor=\
	\a:hor25-blinkon250,
	\v:block,
	\i:ver25-blinkon250

"Wrap
set nowrap

"FZF
set rtp+=~/.fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
let g:fzf_session_path = $HOME . '/.vim/session'
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_colors =
	\ { 'fg':      ['fg', 'Normal'],
	\ 'bg':      ['bg', 'Normal'],
	\ 'hl':      ['fg', 'Comment'],
	\ 'hl+':     ['fg', 'Statement'],
	\ 'info':    ['fg', 'PreProc'],
	\ 'border':  ['fg', 'Ignore'],
	\ 'prompt':  ['fg', 'Conditional'],
	\ 'pointer': ['fg', 'Exception'],
	\ 'marker':  ['fg', 'Keyword'],
	\ 'spinner': ['fg', 'Label'],
	\ 'header':  ['fg', 'Comment'] }

"Line numbers
set number relativenumber
set nuw=1
hi LineNr ctermfg=245
hi CursorLineNR ctermfg=white

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"Open buffer in new terminal
function SplitTerm(...)
	let file=get(a:, 1, '')
	if file != ''
		bd
	endif
	call jobstart(
		\'nohup urxvt -e bash --init-file <(echo "source ~/.bashrc;cd '.getcwd().';nvim '.file.';exit") > /dev/null 2>&1 &',
		\{'on_exit': 'OnExitSplitTerm'})
endfunction

"Keybinds

"bind move select/line
nnoremap <silent> <A-Down> :m .+1<CR>==
nnoremap <silent> <A-Up> :m .-2<CR>==
inoremap <silent> <A-Down> <Esc>:m .+1<CR>==gi
inoremap <silent> <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-Down> :m '>+1<CR>gv=gv
vnoremap <silent> <A-Up> :m '<-2<CR>gv=gv

"bind save
noremap <silent> <C-s> :w<CR>
"vnoremap <silent> <C-s> <ESC>:w<CR>
"inoremap <silent> <C-s> <ESC>:w<CR>

"bind close
noremap <silent> <C-w> :bd<CR>
noremap <silent> <C-q> :q<CR>

"bind fzf
noremap <silent> <C-p> :FZF .<cr>
noremap <silent> <S-tab> :Buffers .<cr>
noremap <silent> <C-f> :Rg .<cr>

"bind open new vim or current buffer in new terminal emulator
noremap <silent> tn<CR> :call SplitTerm()<cr>
noremap <silent> tb<CR> :call SplitTerm(expand('%'))<cr>

