if has("nvim-0.5")
lua <<EOF
require'nvim-treesitter.configs'.setup {
      -- ensure_installed = "maintained",
      highlight = {
	enable = true,
      },
}
EOF
endif
