hi StatusLine cterm=bold ctermbg=NONE ctermfg=NONE
hi StatusLineNC cterm=NONE ctermbg=NONE ctermfg=NONE
hi User1 cterm=bold ctermfg=226 "yellow
hi User2 cterm=bold ctermfg=203 "redpink
hi User3 cterm=bold ctermfg=251 "grey
hi User4 cterm=bold ctermfg=246 "darkgrey

set statusline=%1*%n%*\ »\ %{fnamemodify(v:this_session,':t')}\ »\ %2*%f%*
set statusline+=\ %{SpinnerText()}
set statusline+=%=
set statusline+=\ %2*%{FugitiveHead(6)}%*\ «
set statusline+=\ %3*%l,%c%*
set statusline+=\ %4*%p%%%*
