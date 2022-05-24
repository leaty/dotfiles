" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

	"Deoplete
	call dein#add('Shougo/deoplete.nvim')
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif
	call dein#add('deoplete-plugins/deoplete-jedi')

	"Ranger
	call dein#add('francoiscabrol/ranger.vim')
	if !has('nvim')
		call dein#add('rbgrouleff/bclose.vim')
	endif

	"call dein#add('flazz/vim-colorschemes')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('christoomey/vim-sort-motion')
	call dein#add('dominickng/fzf-session.vim')
	call dein#add('inkarkat/vim-ReplaceWithRegister')
	call dein#add('junegunn/fzf.vim')
	call dein#add('neomake/neomake')
	call dein#add('rust-lang/rust.vim')
	call dein#add('tpope/vim-commentary')
	call dein#add('tpope/vim-fugitive')
	call dein#add('tpope/vim-sleuth')
	call dein#add('machakann/vim-sandwich')
	call dein#add('AndrewRadev/sideways.vim')
	call dein#add('dense-analysis/ale')
	call dein#add('Konfekt/FastFold')
	call dein#add('vimwiki/vimwiki')
	call dein#add('tools-life/taskwiki')
	call dein#add('leaty/wal.vim', {'rev': 'feature/neovim-treesitter'})
	call dein#add('mattn/vim-xxdcursor')
	call dein#add('iamcco/markdown-preview.nvim',
		\{'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
		\'build': 'sh -c "cd app && yarn install"'})

	if has("nvim-0.5")
		call dein#add('nvim-treesitter/nvim-treesitter')
		call dein#add('nvim-treesitter/playground')
	endif
	
	call dein#end()
	call dein#save_state()
endif
