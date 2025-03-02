-- return {
-- 	-- the colorscheme should be available when starting Neovim
-- 	"folke/tokyonight.nvim",
-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
-- 	priority = 1000, -- make sure to load this before all the other start plugins
-- 	config = function()
-- 		-- load the colorscheme here
-- 		vim.cmd([[colorscheme tokyonight]])
-- 	end,
-- 	-- colorscheme list
-- }

-- plugins/colorschemes.lua
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
		"navarasu/onedark.nvim", -- OneDark colorscheme
		lazy = true, -- Lazy-load this plugin
		config = function()
			require("onedark").setup({
				style = "dark", -- Available styles: dark, darker, cool, deep, warm, warmer, light
			})
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
		"sainnhe/sonokai", -- Sonokai colorscheme
		lazy = true, -- Lazy-load this plugin
		config = function()
			vim.g.sonokai_style = "andromeda" -- Available styles: default, atlantis, andromeda, shusia, maia, espresso
		end,
	},
	{
		"rebelot/kanagawa.nvim", -- Kanagawa colorscheme
		lazy = true, -- Lazy-load this plugin
		config = function()
			require("kanagawa").setup({
				theme = "wave", -- Available themes: wave, dragon, lotus
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
