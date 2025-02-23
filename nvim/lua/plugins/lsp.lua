local on_attach = function(client, bufnr)
	  local keymap = function(mode, keys, func, opts)
        opts.buffer = bufnr
        vim.keymap.set(mode, keys, func, opts)
    end

    keymap('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
    keymap('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
    keymap('n', 'gI', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
    keymap('n', 'gy', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
    keymap('n', 'gr', vim.lsp.buf.references, { desc = 'List references' })
		keymap('n', 'K', vim.lsp.buf.hover, { desc = 'Show documentation' })
end

return {
	{
		"neovim/nvim-lspconfig",
		dependecies = { "williamboman/mason.nvim" },
		ft = { 'lua' },
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							telemetry  = { enable = false }
						}
					}
				}
			}
		},
		config = function(_, opts)
			local lspconfig = require('lspconfig')

			for name, conf in pairs(opts.servers) do
				lspconfig[name].setup {
					on_attach = function(client, bufnr)
						local _, err = pcall(on_attach, client, bufnr)

						if err then
							vim.notify('[on_attach] error' .. err, vim.log.levels.ERROR)
						else
							vim.notify('[on_attach] ' .. client.name .. ' attached to buffer ' .. bufnr, vim.log.levels.INFO)
						end
					end,
					settings = conf.settings
				}
			end
		end
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = true
	}
}
