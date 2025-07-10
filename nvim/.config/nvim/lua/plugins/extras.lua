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

	-- Indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("ibl").setup({
				indent = { char = "¦" },
				scope = {
					enabled = true,
					show_start = false,
					show_end = false,
				},
			})
		end,
	},

	-- Highlight TODO-style comments
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local todos = require("todo-comments")
			todos.setup({
				keywords = {
					FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
					TODO = { icon = " ", color = "info" },
					HACK = { icon = "󰈸 ", color = "warning" },
					WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = " ", color = "info", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = " ", color = "info", alt = { "INFO" } },
					TEST = { icon = "󰙨 ", color = "warning", alt = { "TESTING", "PASSED", "FAILED" } },
				},
				highlight = {
					multiline = false,
					pattern = [[.*<(KEYWORDS)\s*]],
					keyword = "fg",
					after = "",
				},
				colors = {
					error = { "ErrorMsg" },
					warning = { "WarningMsg" },
					info = { "Todo", "Normal" },
					hint = { "Comment" },
				},
			})
		end,
	},

	-- Color column as a characters
	{
		"lukas-reineke/virt-column.nvim",
		opts = {},
		config = function()
			require("virt-column").setup({
				char = "¦",
				virtcolumn = "80",
			})
		end,
	},

	-- Better notifications
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = {
			timeout = 2000,
			stages = "static",
			render = "minimal",
		},
	},

	-- Git Gutter

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

	-- Status line

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
                        { icon = " ", key = "n", desc = "New File", action = ":new | startinsert" },
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

	-- Breadcrumbs
	{
		"Bekaboo/dropbar.nvim",
		event = "VeryLazy",
		config = function()
			require("dropbar").setup({
				icons = {
					ui = {
						bar = {
							separator = "  ",
						},
					},
					kinds = {
						symbols = {
							File = " ",
							Function = "󰊕 ",
							Method = "󰊕 ",
							Class = " ",
							Enum = " ",
							Struct = " ",
							Object = "󰬐 ", -- Rust's impl
						},
					},
				},
				bar = {
					enable = function(buf, win, _)
						if
							not vim.api.nvim_buf_is_valid(buf)
							or not vim.api.nvim_win_is_valid(win)
							or vim.fn.win_gettype(win) ~= ""
							or vim.wo[win].winbar ~= ""
							or vim.bo[buf].ft == "help"
						then
							return false
						end

						return true
					end,
					---@diagnostic disable-next-line: unused-local
					sources = function(buf, _)
						local sources = require("dropbar.sources")
						local bar = require("dropbar.bar")

						local state_source = {
							get_symbols = function(sym_buf, win, _)
								local icon_hl = "Title"
								local name_hl = "Normal"

								if vim.api.nvim_buf_get_option(sym_buf, "modified") then
									icon_hl = "WarningMsg"
								end

								if vim.api.nvim_buf_get_option(sym_buf, "readonly") then
									icon_hl = "Error"
									name_hl = "Error"
								end

								local cwd = vim.fn.getcwd()
								local project_name = vim.fn.fnamemodify(cwd, ":t")

								return {
									bar.dropbar_symbol_t:new(setmetatable({
										buf = sym_buf,
										win = win,
										icon = "󰏗 ",
										icon_hl = icon_hl,
										name = project_name,
										name_hl = name_hl,
									}, {})),
								}
							end,
						}

						local function simplify_impl_name(symbol)
							local name = symbol.name
							-- Check if the symbol name matches the "impl ... for ..." pattern
							if name:match("^impl%s+.+for%s+") then
								-- Extract Trait and Type using pattern matching
								local trait, type = name:match("^impl%s+(.+)%s+for%s+(.+)$")
								if trait and type then
									-- Simplify to "<Type>::<Trait>"
									symbol.name = string.format("%s::%s", type, trait)
								end
							elseif name:match("^impl%s+.+") then
								-- Extract Type using pattern matching
								local type = name:match("^impl%s+(.+)$")
								if type then
									-- Simplify to "<Type>"
									symbol.name = type
								end
							end

							return symbol
						end

						local lsp_source = {
							get_symbols = function(sym_buf, win, cursor)
								local symbols = sources.lsp.get_symbols(sym_buf, win, cursor)
								-- Apply the simplification to each symbol
								for i, symbol in ipairs(symbols) do
									symbols[i] = simplify_impl_name(symbol)
								end

								-- Remove symbols for lua
								if vim.bo[sym_buf].ft == "lua" then
									symbols = vim.tbl_filter(function(symbol)
										-- Objects and Packages
										-- It's statements and tables in reality
										return (symbol.icon ~= "󰬐 " and symbol.icon ~= "󰆦 ")
									end, symbols)
								end

								return symbols
							end,
						}

						return {
							state_source,
							sources.path,
							-- sources.lsp,
							lsp_source,
						}
					end,
				},
				sources = {
					path = {
						max_depth = 1,
					},
					lsp = {
						valid_symbols = {
							"File",
							"Module",
							"Namespace",
							"Package",
							"Class",
							"Method",
							"Property",
							"Field",
							"Constructor",
							"Enum",
							"Interface",
							"Function",
							"Constant",
							"String",
							"Number",
							"Boolean",
							"Array",
							"Object",
							"Keyword",
							"Null",
							"EnumMember",
							"Struct",
							"Event",
							"Operator",
							"TypeParameter",
						},
					},
				},
			})
		end,
	},

	-- Markdown rendering --

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
}
