return {
	{
		"folke/tokyonight.nvim", -- TokyoNight colorscheme
		lazy = false, -- Load immediately (not lazy-loaded)
		priority = 1000, -- High priority to ensure it loads first
		config = function()
			require("tokyonight").setup({
				style = "night", -- Available styles: storm, night, day
				transparent = false, -- Enable transparent background
			})
			-- vim.cmd("colorscheme tokyonight") -- Set as default colorscheme
		end,
	},

	{
		"ellisonleao/gruvbox.nvim", -- Gruvbox colorscheme
		lazy = true, -- Lazy-load this plugin
		config = function()
			require("gruvbox").setup({
				contrast = "hard", -- Available options: soft, medium, hard
			})
			-- vim.cmd("colorscheme gruvbox") -- Set as default colorscheme
		end,
	},

	{
		"Mofiqul/dracula.nvim", -- Dracula colorscheme
		lazy = true, -- Lazy-load this plugin
		config = function()
			require("dracula").setup({
				transparent_bg = false, -- Enable transparent background
			})
			-- vim.cmd("colorscheme dracula") -- Set as default colorscheme
		end,
	},

	{
		"zenbones-theme/zenbones.nvim",
		-- Optionally install Lush. Allows for more configuration or extending the colorscheme
		-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
		-- In Vim, compat mode is turned on as Lush only works in Neovim.
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
		-- you can set set configuration options here
		config = function()
			vim.g.zenbones_darken_comments = 45
			vim.cmd.colorscheme("zenbones")
		end,
	},
}
