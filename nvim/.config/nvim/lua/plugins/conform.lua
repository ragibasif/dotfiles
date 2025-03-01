-- formatters
return {
	"stevearc/conform.nvim",
	dependencies = "williamboman/mason.nvim", -- dependency updates RTP
	event = "BufWritePre",
	cmd = "ConformInfo",
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			cpp = { "clang_format" },
			lua = { "stylua" },
			markdown = { "prettier" },
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
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = function(bufnr)
			-- set during lsp config
			if vim.b[bufnr].autoformat then
				return { time_ms = 3000, lsp_format = "fallback" }
			end
		end,
	},
}
