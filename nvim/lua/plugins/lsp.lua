local on_attach = function(client, bufnr)
	local keymap = function(mode, keys, func, opts)
		opts.buffer = bufnr
		vim.keymap.set(mode, keys, func, opts)
	end

	keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
	keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
	keymap("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation" })
	keymap("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
	keymap("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
						},
					},
				},
				ts_ls = {
					filetypes = {
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
				},
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			for name, conf in pairs(opts.servers) do
				lspconfig[name].setup({
					on_attach = function(client, bufnr)
						local _, err = pcall(on_attach, client, bufnr)

						if err then
							vim.notify("[on_attach] error" .. err, vim.log.levels.ERROR)
						else
							vim.notify(
								"[on_attach] " .. client.name .. " attached to buffer " .. bufnr,
								vim.log.levels.INFO
							)
						end
					end,
					settings = conf.settings,
					capabilities = capabilities,
				})
			end
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = true,
	},
}
