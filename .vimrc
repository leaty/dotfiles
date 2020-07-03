" Fix for vim, this is default for nvim
if &compatible | set nocompatible | endif

" Disable intro message
set shortmess=I

" Set <leader>
let mapleader=','

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

	"Deoplete
	call dein#add('Shougo/deoplete.nvim')
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif
	call dein#add('deoplete-plugins/deoplete-jedi')

	"Ranger
	call dein#add('francoiscabrol/ranger.vim')
	if !has('nvim')
		call dein#add('rbgrouleff/bclose.vim')
	endif

	"call dein#add('flazz/vim-colorschemes')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('cespare/vim-toml')
	call dein#add('christoomey/vim-sort-motion')
	call dein#add('dominickng/fzf-session.vim')
	call dein#add('inkarkat/vim-ReplaceWithRegister')
	call dein#add('junegunn/fzf.vim')
	call dein#add('neomake/neomake')
	call dein#add('rust-lang/rust.vim')
	call dein#add('tpope/vim-commentary')
	call dein#add('tpope/vim-fugitive')
	call dein#add('tpope/vim-repeat')
	call dein#add('tpope/vim-surround')
	
	call dein#end()
	call dein#save_state()
endif

"Remember last pos
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin indent off
syntax enable

"Indentation
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Shortmess
set shortmess+=O

"Neomake spinner
let s:spinner_index = 0
let s:active_spinners = 0
"let s:spinner_states = ['|', '/', '--', '\', '|', '/', '--', '\']
"let s:spinner_states = ['ｦ','ｧ','ｨ','ｩ','ｪ','ｫ','ｬ','ｭ','ｮ','ｯ','ｱ','ｲ','ｳ','ｴ','ｵ','ｶ','ｷ','ｸ','ｹ','ｺ','ｻ','ｼ','ｽ','ｾ','ｿ','ﾀ','ﾁ','ﾂ','ﾃ','ﾄ','ﾅ','ﾆ','ﾇ','ﾈ','ﾉ','ﾊ','ﾋ','ﾌ','ﾍ','ﾎ','ﾏ','ﾐ','ﾑ','ﾒ','ﾓ','ﾔ','ﾕ','ﾖ','ﾗ','ﾘ','ﾙ','ﾚ','ﾛ','ﾜ','ﾝ']
"let s:spinner_states = ['⠋','⠙','⠹','⠸','⠼','⠴','⠦','⠧','⠇','⠏']
"let s:spinner_states = ['⠁','⠉','⠙','⠚','⠒','⠂','⠂','⠒','⠲','⠴','⠤','⠄','⠄','⠤','⠴','⠲','⠒','⠂','⠂','⠒','⠚','⠙','⠉','⠁']
let s:spinner_states = ['⠈','⠉','⠋','⠓','⠒','⠐','⠐','⠒','⠖','⠦','⠤','⠠','⠠','⠤','⠦','⠖','⠒','⠐','⠐','⠒','⠓','⠋','⠉','⠈']
"let s:spinner_states = ['◴','◷','◶','◵','◴','◷','◶','◵','◴','◷','◶','◵','◴','◷','◶','◵']
"let s:spinner_states = ['┤', '┘', '┴', '└', '├', '┌', '┬', '┐']
"let s:spinner_states = ['←', '↖', '↑', '↗', '→', '↘', '↓', '↙']
"let s:spinner_states = ['←', '↑', '→', '↓']
"let s:spinner_states = ['d', 'q', 'p', 'b']
"let s:spinner_states = ['.', 'o', 'O', '°', 'O', 'o', '.']
"let s:spinner_states = ['■', '□', '▪', '▫', '▪', '□', '■']

function! StartSpinner()
    let b:show_spinner = 1
    let s:active_spinners += 1
    if s:active_spinners == 1
        let s:spinner_timer = timer_start(1000 / len(s:spinner_states), 'SpinSpinner', {'repeat': -1})
    endif
endfunction

function! StopSpinner()
    let b:show_spinner = 0
    let s:active_spinners -= 1
    if s:active_spinners == 0
        :call timer_stop(s:spinner_timer)
    endif
endfunction

function! SpinSpinner(timer)
    let s:spinner_index = float2nr(fmod(s:spinner_index + 1, len(s:spinner_states)))
    redraw
endfunction

function! SpinnerText()
    if get(b:, 'show_spinner', 0) == 0
        return " "
    endif

    return s:spinner_states[s:spinner_index]
endfunction

augroup neomake_hooks
    au!
    autocmd User NeomakeJobInit :call StartSpinner()
    "autocmd User NeomakeJobInit :echom "Build started"
    autocmd User NeomakeFinished call StopSpinner()
    autocmd User NeomakeFinished call Run()
    "autocmd User NeomakeFinished :echom "Build complete"
augroup END

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
set statusline+=%1*%n%*\ »\ %{fnamemodify(v:this_session,':t')}\ »\ %2*%f%*
"set statusline+=%1*%n%*\ \ %{fnamemodify(v:this_session,':t')}\ \ %2*%f%*
"set statusline+=\ %m
set statusline+=\ %{SpinnerText()}
set statusline+=%=
"set statusline+=%#CursorColumn#
"set statusline+=\ %y
set statusline+=\ %2*%{fugitive#head(6)}%*\ «
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

"Deoplete
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

"Neomake
let g:neomake_open_list = 2
let g:neomake_rust_cargo_command = ['build']

"Neomake run program if success
function! Run() abort
	let context = g:neomake_hook_context
	if context.finished_jobs[0].exit_code == 0
		if &ft =~# '^\%(rust\)$'
			!cargo run
		endif
	endif
endfunction

"GitGutter
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
set updatetime=100

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
		\'nohup urxvt -e bash --init-file <(echo "source ~/.bashrc;cd '.getcwd().';nvim '.file.';exit") > /dev/null 2>&1 &')
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

"bind neomake
noremap <silent> <C-b> :Neomake<CR>

"bind close
nnoremap <silent> <C-w> :bd<CR>
nnoremap <silent> <C-q> :q<CR>

"bind fzf
nnoremap <silent> <C-p> :FZF .<CR>
nnoremap <silent> <S-tab> :Buffers<CR>
nnoremap <silent> <C-f> :Rg .<CR>
nnoremap <silent> <leader>s :Sessions<CR>
nnoremap <leader>ns :Session<Space>

"bind deoplete
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

"bind git
nmap <leader>gb :Gblame<cr>
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit -v<cr>
nmap <leader>ga :Git add -p<cr>
nmap <leader>gm :Gcommit --amend<cr>
nmap <leader>gp :Gpush<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>gr :Gread<cr>

"bind open new vim or current buffer in new terminal emulator
nnoremap <silent> <leader>t :call SplitTerm()<CR>
nnoremap <silent> <leader>b :call SplitTerm(expand('%'))<CR>

"bind split in same terminal
"nnoremap <silent> <leader>w <CR>

"Neomake
let g:neomake_open_list = 2
"let g:neomake_rust_cargo_command = ['build']
noremap <silent> <C-b> :Neomake! cargo<CR>

augroup neomake_tests
	au User NeomakeJobFinished call NeomakeRun(g:neomake_hook_context)
augroup END

function NeomakeRun(context)
	if a:context.jobinfo.exit_code == 0
		!cargo run
	endif
endfunction
