return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        icons = { separator = ":" },
        spec = {
            mode = { "n", "v" },
            { "<leader>c", group = "Code" },
            { "<leader>d", group = "Debug" },
            { "<leader>f", group = "File/find" },
            { "<leader>g", group = "Git" },
            { "<leader>gh", group = "Hunks" },
            { "<leader>m", group = "Markdown" },
            { "<leader>p", group = "Plugins" },
            { "<leader>q", group = "Quit/session" },
            { "<leader>s", group = "Search" },
            { "<leader>u", group = "Ui" },
            { "<leader>x", group = "Diagnostics/quickfix" },
            { "z", group = "Folds/jumps/spelling" },
            { "g", group = "Goto/actions" },
            { "[", group = "Prev" },
            { "]", group = "Next" },
            {
                "<leader>b",
                group = "Buffer",
                expand = function()
                    return require("which-key.extras").expand.buf()
                end,
            },
            {
                "<leader>w",
                group = "Windows",
                proxy = "<c-w>",
                expand = function()
                    return require("which-key.extras").expand.win()
                end,
            },
            -- better descriptions
            { "gx", desc = "Open with system app" },
        },
    },
    -- stylua: ignore
    keys = {
        { "<leader>?", "<cmd>lua require('which-key').show({ global = false })<cr>", desc = "Buffer keymaps (which-key)" },
    },
}
