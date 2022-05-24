"Indentation
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"Ale
let b:ale_linters = ['flake8']
let b:ale_fixers = ['autopep8']
let b:ale_python_flake8_options = '--ignore=W191,E101,E111,E128,W503'
let b:ale_fix_on_save = 1
