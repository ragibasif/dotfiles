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
        require("lspconfig").lua_ls.setup({})
        require("lspconfig").neocmake.setup({})
        require("lspconfig").clangd.setup({})
        require("lspconfig").marksman.setup({})
    end,
}
