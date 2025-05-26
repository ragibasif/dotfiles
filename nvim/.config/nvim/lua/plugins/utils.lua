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

	{ -- Linting
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				markdown = { "markdownlint" },
			}
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					if vim.bo.modifiable then
						lint.try_lint()
					end
				end,
			})
		end,
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
