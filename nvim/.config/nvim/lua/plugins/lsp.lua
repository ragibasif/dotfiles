return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		"junnplus/lsp-setup.nvim",
		opts = {},
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
		},
	},

	{
		"onsails/lspkind.nvim",
		config = function()
			require("lspkind").init()
		end,
	},

	{
		"mason-org/mason.nvim",
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
	},

	{

		"mason-org/mason-lspconfig.nvim",
		opts = {},
	},

	{
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
					"gD",
					"<cmd>lua vim.lsp.buf.declaration()<CR>",
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
				cmd = {
					"clangd",
					"--fallback-style=llvm",
				},
				root_markers = {
					{
						".clangd",
						".clang-tidy",
						".clang-format",
						"compile_commands.json",
						"compile_flags.txt",
						"configure.ac",
						".git",
					},
				},
			})

			-- Go
			lspconfig.gopls.setup({
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						gofumpt = true,
					},
				},
			})
			-- Lua
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						format = {
							enable = true,
							defaultConfig = {
								indent_style = "space",
								indent_size = "4",
							},
						},
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
				filetypes = { "sh", "bash" },
			})

			-- Python
			lspconfig.pylsp.setup({
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

			-- Yaml
			lspconfig.yamlls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
	},

	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},

		opts = { lsp_cfg = true }, -- use go.nvim will setup gopls
		config = function(lp, opts)
			require("go").setup(opts)

			local gopls_cfg = require("go.lsp").config()
			-- gopls_cfg.filetypes = { 'go', 'gomod'}, -- override settings
			vim.lsp.config.gopls = gopls_cfg
			vim.lsp.enable("gopls")
		end,
	},
}
