-- Dashboard
-- Used by the `header` section
local header = [[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
                                                    ]]

local footer = [[
▀ ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀ ▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀
                                      n e o v i m   ]]

return {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        init = function()
        end,
        opts = {
            dashboard = {
                width = 46,
                preset = {
                    header = header,
                    keys = {
                        -- stylua: ignore start
                        { icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
                        { icon = " ", key = "n", desc = "New File", action = ":enew | startinsert" },
                        { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
                        { icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
                        { icon = " ", key = "c", desc = "Config", action = ":Telescope find_files " .. "cwd=" .. vim.fn.stdpath("config")},
                        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                        { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
                        { icon = "󱌢 ", key = "m", desc = "Mason", action = ":Mason" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                        -- stylua: ignore end
                    },
                },
                sections = {
                    { section = "header", gap = 0, padding = 0 },
                    { section = "keys", gap = 1, padding = 1 },
                    {
                        text = {
                            {
                                footer,
                                hl = "SnacksDashboardHeader",
                            },
                        },
                        gap = 0,
                        padding = 1,
                    },
                    { section = "startup", gap = 0, padding = 0 },
                },
            },
            styles = {
                notification = { border = "single" },
                notification_history = { border = "single" },
            },
            git = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = {
                enabled = true,
                icons = {
                    error = "󰯸 ",
                    warn = "󰰮 ",
                    info = "󰰄 ",
                    debug = "󰯵 ",
                    trace = "󰰥 ",
                },
            },
            scroll = { enabled = true },
            statuscolumn = {},
        },
        keys = {
        },
    }
