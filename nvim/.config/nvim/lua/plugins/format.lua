return {
	"stevearc/conform.nvim",
	dependencies = "mason-org/mason.nvim", -- dependency updates RTP
	event = "BufWritePre",
	lazy = true,
	cmd = "ConformInfo",
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			lua = { "stylua" },
			markdown = { "prettier", "prettierd", stop_after_first = true },
			go = { "gofmt", stop_after_first = true },
			html = { "prettier", "prettierd", stop_after_first = true },
			json = { "prettier", "prettierd", stop_after_first = true },
			javascript = { "prettier", "prettierd", stop_after_first = true },
			python = { "black", stop_after_first = true },
			yaml = { "prettier", "prettierd", stop_after_first = true },
			sh = { "shfmt" },
		},
		default_format_opts = {
			lsp_format = "fallback",
			timeout_ms = 3000,
			async = false, -- not recommended to change
			quiet = false, -- not recommended to change
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
	},
}
