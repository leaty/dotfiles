"Set <leader>
let mapleader=','

"Keybinds

"bind clear highlight
nnoremap <silent> <ESC> :noh<CR>

"rebind * to stay on same result
nnoremap * *``

"bind { for auto ending }
inoremap {<CR> {<CR>}<ESC>O

"bind move select/line
nnoremap <silent> <A-j> :m .+1<CR>==
nnoremap <silent> <A-k> :m .-2<CR>==
"inoremap <silent> <A-j> <Esc>:m .+1<CR>==gi
"inoremap <silent> <A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv

"bind move argument left/right
nnoremap <silent> <A-h> :SidewaysLeft<CR>
nnoremap <silent> <A-l> :SidewaysRight<CR>

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

"bind neomake
noremap <silent> <C-b> :Neomake! cargo<CR>

"bind git
nmap <leader>gb :Git blame<cr>
nmap <leader>gs :Git<cr>
nmap <leader>gc :Git commit -v<cr>
nmap <leader>ga :Git add -p<cr>
nmap <leader>gm :Git commit --amend<cr>
nmap <leader>gp :Git pull<cr>
nmap <leader>gP :Git push<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gw :Gwrite<cr>
nmap <leader>gr :Gread<cr>

"bind open new vim or current buffer in new terminal emulator
nnoremap <silent> <leader>v :call SplitTerm()<CR>
nnoremap <silent> <leader>b :call SplitTerm(expand('%'))<CR>

"bind open new terminal
nnoremap <silent> <leader>t :call jobstart('nohup urxvtc -e sh -c ''bash --init-file <(echo "source ~/.bashrc;cd '.getcwd().'")'' > /dev/null 2>&1 &')<CR>

"bind split in same terminal
"nnoremap <silent> <leader>w <CR>

"Unmap arrow keys for navigation temporarily
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>


"Map closing tags
"inoremap {<CR> {<CR>}<Esc>ko
"inoremap [<CR> [<CR>]<Esc>ko
"inoremap (<CR> (<CR>)<Esc>ko

"inoremap {<space> {}<Esc>i
"inoremap [<space> []<Esc>i
"inoremap (<space> ()<Esc>i
"inoremap "<space> ""<Esc>i
"inoremap '<space> ''<Esc>i

"inoremap {{ {}<Esc>i
"inoremap [[ []<Esc>i
"inoremap (( ()<Esc>i
"inoremap << <><Esc>i
"inoremap "" ""<Esc>i
"inoremap '' ''<Esc>i
