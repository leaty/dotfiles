hi QuickFix cterm=bold
hi QuickFixLine cterm=bold
hi QuickFixError cterm=bold ctermfg=NONE ctermbg=NONE

setlocal statusline=%1*%n%*\ »\ %{fnamemodify(v:this_session,':t')}\ »\ %2*quickfix%*
setlocal statusline+=%=
setlocal statusline+=\ %2*%{fugitive#head(6)}%*\ «
setlocal statusline+=\ %3*%l,%c%*
setlocal statusline+=\ %4*%p%%%*

setlocal wrap
