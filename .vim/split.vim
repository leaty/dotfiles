hi VertSplit cterm=NONE

"Open buffer in new terminal
function SplitTerm(...)
	let file=get(a:, 1, '')
	if file != ''
		bd
	endif
	call jobstart(
		\'nohup urxvt -e bash --init-file <(echo "source ~/.bashrc;cd '.getcwd().';nvim '.file.';exit") > /dev/null 2>&1 &')
endfunction
