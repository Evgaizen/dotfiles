return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
			{ "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
			{ "<leader>fs", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor" },
			{ "<leader>fl", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Grep in current buffer" }
		}
	}
}
