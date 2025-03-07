local keymap = function(mode, keys, func, opts)
	vim.keymap.set(mode, keys, func, opts)
end

keymap("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete buffer" })
keymap("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Buffer prev" })
keymap("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Buffer next" })
