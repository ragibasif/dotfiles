-- formatters
return {
	"stevearc/conform.nvim",
	dependencies = "williamboman/mason.nvim", -- dependency updates RTP
	event = "BufWritePre",
	lazy = true,
	cmd = "ConformInfo",
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			lua = { "stylua" },
			markdown = { "mdformat" },
			css = { "prettier" },
			graphql = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			jsx = { "prettier" },
			javascript = { "prettier" },
			less = { "prettier" },
			scss = { "prettier" },
			typescript = { "prettier" },
			vue = { "prettier" },
			yaml = { "prettier" },
			sh = { "shfmt" },
		},
		default_format_opts = {
			lsp_format = "fallback",
			timeout_ms = 3000,
			async = false, -- not recommended to change
			quiet = false, -- not recommended to change
		},
		format_on_save = {
			timeout_ms = 500, -- Timeout for formatting
			lsp_fallback = true, -- Fallback to LSP formatting if no formatter is available
		},
	},
}
