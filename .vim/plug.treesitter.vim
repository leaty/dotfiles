if has("nvim-0.5")
lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			node_decremental = "grm",
			scope_incremental = "grc",
		},
	},
	indent = {
		enable = true,
	},
}
EOF
endif
