return {
	{
		"junnplus/lsp-setup.nvim",
		config = function()
			require("lsp-setup").setup({
				-- config
			})
		end,
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim", -- optional
			"williamboman/mason-lspconfig.nvim", -- optional
		},
	},
}
