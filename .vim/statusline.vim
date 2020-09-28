
"Statusline
"hi StatusLine ctermbg=magenta ctermfg=magenta
"hi StatusLineNC ctermbg=magenta ctermfg=magenta
hi StatusLine cterm=NONE
hi StatusLineNC cterm=NONE
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
