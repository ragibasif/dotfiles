return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	cmd = "Mason",
	keys = { { "<leader>pm", "<cmd>Mason<cr>", desc = "Mason" } },
	opts = {
		ui = {
			keymaps = { apply_language_filter = "F" },
			icons = {
				package_installed = "● ",
				package_pending = "󰦗 ",
				package_uninstalled = "○ ",
			},
		},
	},
}
