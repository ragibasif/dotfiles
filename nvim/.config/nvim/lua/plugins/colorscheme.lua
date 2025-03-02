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
			vim.cmd("colorscheme tokyonight") -- Set as default colorscheme
		end,
	},
	{
		"ellisonleao/gruvbox.nvim", -- Gruvbox colorscheme
		lazy = true, -- Lazy-load this plugin
		config = function()
			require("gruvbox").setup({
				contrast = "hard", -- Available options: soft, medium, hard
			})
		end,
	},
	{
		"Mofiqul/dracula.nvim", -- Dracula colorscheme
		lazy = true, -- Lazy-load this plugin
		config = function()
			require("dracula").setup({
				transparent_bg = false, -- Enable transparent background
			})
		end,
	},
}
