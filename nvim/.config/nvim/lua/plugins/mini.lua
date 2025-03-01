return {
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
			-- require("mini.surround").setup()
		end,
	},
}
