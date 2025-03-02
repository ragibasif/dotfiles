return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile", "BufWritePre" },
	dependencies = { "williamboman/mason-lspconfig.nvim", "saghen/blink.cmp" },
	init = function()
		local icons = {
			error = "󰯹 ",
			warn = "󰰯 ",
			hint = "󰰂 ",
			info = "󰰅 ",
		}

		-- diagnostics
		local diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = {
				spacing = 4,
				source = "if_many",
				prefix = function(diagnostic)
					for d, icon in pairs(icons) do
						if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
							return icon
						end
					end
				end,
			},
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = icons.error,
					[vim.diagnostic.severity.WARN] = icons.warn,
					[vim.diagnostic.severity.HINT] = icons.hint,
					[vim.diagnostic.severity.INFO] = icons.info,
				},
			},
		}
		vim.diagnostic.config(vim.deepcopy(diagnostics))
	end,
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		-- Common on_attach function for LSP keybindings
		local on_attach = function(client, bufnr)
			-- Keybindings
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"gd",
				"<cmd>lua vim.lsp.buf.definition()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"gr",
				"<cmd>lua vim.lsp.buf.references()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"K",
				"<cmd>lua vim.lsp.buf.hover()<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_buf_set_keymap(
				bufnr,
				"n",
				"<leader>rn",
				"<cmd>lua vim.lsp.buf.rename()<CR>",
				{ noremap = true, silent = true }
			)
		end
		-- C/C++
		lspconfig.clangd.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Lua
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = { library = vim.api.nvim_get_runtime_file("", true) },
					telemetry = { enable = false },
				},
			},
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Bash
		lspconfig.bashls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "sh", "bash", "make" },
		})

		-- Python
		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- JavaScript/TypeScript
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- HTML
		lspconfig.html.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- CSS
		lspconfig.cssls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Markdown
		lspconfig.marksman.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
