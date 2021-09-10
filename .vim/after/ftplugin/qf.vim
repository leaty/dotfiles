hi QuickFixLine cterm=bold
hi QuickFix cterm=bold

setlocal statusline=%1*%n%*\ »\ %{fnamemodify(v:this_session,':t')}\ »\ %2*quickfix%*
setlocal statusline+=%=
setlocal statusline+=\ %2*%{fugitive#head(6)}%*\ «
setlocal statusline+=\ %3*%l,%c%*
setlocal statusline+=\ %4*%p%%%*

setlocal wrap
