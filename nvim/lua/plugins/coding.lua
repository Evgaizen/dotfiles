return {
	{ "jiangmiao/auto-pairs" },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
		},
		opts = function()
			local cmp = require('cmp')

			return {
				mappings = cmp.mapping.preset.insert(),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }
				}, {
					{ name = "buffer" }
				}, {
					{ name = "path" }
				})
			}
		end
	}
}
