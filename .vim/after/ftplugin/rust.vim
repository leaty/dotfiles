"Indentation
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

let b:ale_linters = ['analyzer']
let b:ale_completion_enabled = 1

let b:ale_fixers = ['rustfmt']
let b:ale_fix_on_save = 1
let b:ale_rust_rustfmt_options = '--config edition=2018,hard_tabs=true'

