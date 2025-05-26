-- Dashboard
-- Used by the `header` section
local header = [[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                    ]]

local footer = [[
▀ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀
                                      n e o v i m   ]]

return {
	{ "wakatime/vim-wakatime", lazy = false },

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

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

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+", texthl = "GitSignsAdd" }, -- Sign for added lines
					change = { text = "~", texthl = "GitSignsChange" }, -- Sign for changed lines
					delete = { text = "", texthl = "GitSignsDelete" }, -- Sign for deleted lines
					topdelete = { text = "‾", texthl = "GitSignsDelete" }, -- Sign for top deleted lines
					changedelete = { text = "~", texthl = "GitSignsChange" }, -- Sign for changed and deleted lines
					untracked = { text = "┆", texthl = "GitSignsUntracked" }, -- Sign for untracked lines
				},
				signcolumn = true, -- Show the sign column
				numhl = false, -- Don't highlight line numbers
				linehl = false, -- Don't highlight the entire line
				word_diff = false, -- Don't highlight word differences
				watch_gitdir = {
					interval = 1000, -- Check for Git changes every second
					follow_files = true, -- Follow file renames
				},
				attach_to_untracked = true, -- Attach to untracked files
				current_line_blame = true, -- Show blame for the current line
				current_line_blame_opts = {
					virt_text = true, -- Show blame in virtual text
					virt_text_pos = "eol", -- Position of virtual text (end of line)
					delay = 1000, -- Delay before showing blame
					ignore_whitespace = false, -- Don't ignore whitespace changes
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>", -- Blame format
				sign_priority = 6, -- Priority of signs
				update_debounce = 100, -- Debounce time for updates
				status_formatter = nil, -- Use default status formatter
				max_file_length = 40000, -- Max file length to attach to
				preview_config = {
					border = "single", -- Border style for preview windows
					style = "minimal", -- Style of preview windows
					relative = "cursor", -- Position of preview windows
					row = 0, -- Row offset for preview windows
					col = 1, -- Column offset for preview windows
				},
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional: for icons
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto", -- Automatically choose a theme based on your colorscheme
					icons_enabled = true, -- Enable icons
					component_separators = { left = "", right = "" }, -- Separators between components
					section_separators = { left = "", right = "" }, -- Separators between sections
					disabled_filetypes = {}, -- Disable lualine for specific filetypes
				},
				sections = {
					lualine_a = { "mode" }, -- Leftmost section (mode)
					lualine_b = { "branch", "diff", "diagnostics" }, -- Git branch, diff, and LSP diagnostics
					lualine_c = { "filename" }, -- Current filename
					lualine_x = { "encoding", "fileformat", "filetype" }, -- Encoding, file format, and file type
					lualine_y = { "progress" }, -- Current position in the file (line:column)
					lualine_z = { "location" }, -- Current cursor location
				},
				inactive_sections = {
					lualine_a = {}, -- Inactive leftmost section
					lualine_b = {}, -- Inactive git and diagnostics section
					lualine_c = { "filename" }, -- Inactive filename section
					lualine_x = { "location" }, -- Inactive location section
					lualine_y = {}, -- Inactive progress section
					lualine_z = {}, -- Inactive rightmost section
				},
				tabline = {}, -- Configure tabline (optional)
				extensions = {}, -- Enable extensions (e.g., fugitive, nvim-tree)
			})
		end,
	},

	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.icons").setup({
				lazy = true,
				opts = {},
				init = function()
					package.preload["nvim-web-devicons"] = function()
						require("mini.icons").mock_nvim_web_devicons()
						return package.loaded["nvim-web-devicons"]
					end
				end,
			})
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			icons = { separator = ":" },
			spec = {
				mode = { "n", "v" },
				{ "<leader>c", group = "Code" },
				{ "<leader>d", group = "Debug" },
				{ "<leader>f", group = "File/find" },
				{ "<leader>g", group = "Git" },
				{ "<leader>gh", group = "Hunks" },
				{ "<leader>m", group = "Markdown" },
				{ "<leader>p", group = "Plugins" },
				{ "<leader>q", group = "Quit/session" },
				{ "<leader>s", group = "Search" },
				{ "<leader>u", group = "Ui" },
				{ "<leader>x", group = "Diagnostics/quickfix" },
				{ "z", group = "Folds/jumps/spelling" },
				{ "g", group = "Goto/actions" },
				{ "[", group = "Prev" },
				{ "]", group = "Next" },
				{
					"<leader>b",
					group = "Buffer",
					expand = function()
						return require("which-key.extras").expand.buf()
					end,
				},
				{
					"<leader>w",
					group = "Windows",
					proxy = "<c-w>",
					expand = function()
						return require("which-key.extras").expand.win()
					end,
				},
				{ "gx", desc = "Open with system app" },
			},
		},
		keys = {
			{
				"<leader>?",
				"<cmd>lua require('which-key').show({ global = false })<cr>",
				desc = "Buffer keymaps (which-key)",
			},
		},
	},

	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		init = function() end,
		opts = {
			dashboard = {
				width = 46,
				preset = {
					header = header,
					keys = {
                        -- stylua: ignore start
                        { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
                        { icon = " ", key = "n", desc = "New File", action = ":enew | startinsert" },
                        { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
                        { icon = " ", key = "c", desc = "Config", action = ":Telescope find_files " .. "cwd=" .. vim.fn.stdpath("config")},
                        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                        { icon = "󱌢 ", key = "m", desc = "Mason", action = ":Mason" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
						-- stylua: ignore end
					},
				},
				sections = {
					{ section = "header", gap = 0, padding = 0 },
					{ section = "keys", gap = 1, padding = 1 },
					{
						text = {
							{
								footer,
								hl = "SnacksDashboardHeader",
							},
						},
						gap = 0,
						padding = 1,
					},
					{ section = "startup", gap = 0, padding = 0 },
				},
			},
			styles = {
				notification = { border = "single" },
				notification_history = { border = "single" },
			},
			git = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = {
				enabled = true,
				icons = {
					error = "󰯸 ",
					warn = "󰰮 ",
					info = "󰰄 ",
					debug = "󰯵 ",
					trace = "󰰥 ",
				},
			},
			scroll = { enabled = false }, -- smooth scroll but its actuall really annoying to me so keep it disabled
			statuscolumn = {},
		},
		keys = {},
	},
}
