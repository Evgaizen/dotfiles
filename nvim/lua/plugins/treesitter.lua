return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		lazy = vim.fn.argc(-1) == 0,
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			ensure_installed = {
				"html",
				"javascript",
				"json",
				"jsdoc",
				"lua",
				"markdown",
				"tsx",
				"typescript",
				"yaml",
			},
		},
	},
}
