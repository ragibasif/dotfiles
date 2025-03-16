return {
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
				-- lualine_x = { "encoding", "fileformat", "filetype" }, -- Encoding, file format, and file type
				lualine_x = { -- pomo.nvim
					function()
						local ok, pomo = pcall(require, "pomo")
						if not ok then
							return ""
						end

						local timer = pomo.get_first_to_finish()
						if timer == nil then
							return ""
						end

						return "󰄉 " .. tostring(timer)
					end,
					"encoding",
					"fileformat",
					"filetype",
				},
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
}
