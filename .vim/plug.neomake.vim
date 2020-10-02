let g:neomake_open_list = 2
let g:neomake_rust_cargo_command = ['build']
let g:neomake_virtualtext_current_error = 0
let g:neomake_place_signs = 0
let g:neomake_highlight_columns = 0

"Neomake run program if success
function! Run() abort
	let context = g:neomake_hook_context
	if context.finished_jobs[0].exit_code == 0
		if &ft =~# '^\%(rust\)$'
			!cargo run
		endif
	endif
endfunction

augroup neomake_tests
	au User NeomakeJobFinished call NeomakeRun(g:neomake_hook_context)
augroup END

function NeomakeRun(context)
	if a:context.jobinfo.exit_code == 0
		!cargo run
	endif
endfunction

"Neomake spinner
let s:spinner_index = 0
let s:active_spinners = 0
"let s:spinner_states = ['|', '/', '--', '\', '|', '/', '--', '\']
let s:spinner_states = ['ｦ','ｧ','ｨ','ｩ','ｪ','ｫ','ｬ','ｭ','ｮ','ｯ','ｱ','ｲ','ｳ','ｴ','ｵ','ｶ','ｷ','ｸ','ｹ','ｺ','ｻ','ｼ','ｽ','ｾ','ｿ','ﾀ','ﾁ','ﾂ','ﾃ','ﾄ','ﾅ','ﾆ','ﾇ','ﾈ','ﾉ','ﾊ','ﾋ','ﾌ','ﾍ','ﾎ','ﾏ','ﾐ','ﾑ','ﾒ','ﾓ','ﾔ','ﾕ','ﾖ','ﾗ','ﾘ','ﾙ','ﾚ','ﾛ','ﾜ','ﾝ']
"let s:spinner_states = ['⠋','⠙','⠹','⠸','⠼','⠴','⠦','⠧','⠇','⠏']
"let s:spinner_states = ['⠁','⠉','⠙','⠚','⠒','⠂','⠂','⠒','⠲','⠴','⠤','⠄','⠄','⠤','⠴','⠲','⠒','⠂','⠂','⠒','⠚','⠙','⠉','⠁']
"let s:spinner_states = ['⠈','⠉','⠋','⠓','⠒','⠐','⠐','⠒','⠖','⠦','⠤','⠠','⠠','⠤','⠦','⠖','⠒','⠐','⠐','⠒','⠓','⠋','⠉','⠈']
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
