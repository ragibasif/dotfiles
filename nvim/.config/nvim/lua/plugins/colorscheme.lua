return {

	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.zenbones_darken_comments = 45
		end,
	},

	{
		"Koalhack/darcubox-nvim",
		opts = {},
		config = function()
			-- vim.cmd("colorscheme darcubox")
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = false,
			})
		end,
	},

	{ "ellisonleao/gruvbox.nvim", name = "gruvbox" },

	{ "catppuccin/nvim", name = "catppuccin" },

	{ "rose-pine/nvim", name = "rose-pine" },
}
