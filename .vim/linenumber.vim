" EndOfBuffer ~
hi NonText ctermfg=245

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
