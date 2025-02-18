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
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		tag = "3.30",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{ "3rd/image.nvim", opts = {} }
		},
		cmd = "Neotree",
		opts = {
			window = {
				position = "left",
				width = 30
			}
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle=true<cr>", desc = "Toggle file explorer" }
		}
	},
	{
		"RRethy/vim-illuminate",
		opts = {
			delay = 200,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" }
			}
		},
		config = function(_, opts)
			require("illuminate").configure(opts)
		end,
		keys = {
			{ "]]", "<cmd>lua require('illuminate').goto_next_reference()<cr>", desc = "Go to next reference" },
			{ "[[", "<cmd>lua require('illuminate').goto_prev_reference()<cr>", desc = "Go to prev reference" },
		}
	}
}
