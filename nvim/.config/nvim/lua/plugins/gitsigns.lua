return {
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
}
