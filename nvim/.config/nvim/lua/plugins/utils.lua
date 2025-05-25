return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"cpp",
				"c",
				"go",
				"rust",
				"haskell",
				"ocaml",
				"lua",
				"python",
				"javascript",
				"typescript",
				"html",
				"css",
				"json",
				"cmake",
				"make",
				"markdown",
				"bash",
				"asm",
				"nasm",
				"regex",
				"toml",
				"vim",
				"vimdoc",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
			},
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	},
}
