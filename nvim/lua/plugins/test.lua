return {
	{
		"nvim-neotest/neotest",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-jest",
		},
		config = function()
			local neotest = require("neotest")
			local jest = require("neotest-jest")

			neotest.setup({
				summary = {
					open = "botright vsplit | vertical resize 80",
				},
				adapters = {
					jest({
						jestCommand = "npm test --",
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
			})
		end,
	},
}
