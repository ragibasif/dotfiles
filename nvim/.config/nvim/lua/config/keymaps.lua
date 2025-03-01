-- Key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("", "<up>", "<nop>", opts)
map("", "<down>", "<nop>", opts)
map("", "<left>", "<nop>", opts)
map("", "<right>", "<nop>", opts)
map("i", "jk", "<ESC>", opts)
map("i", "JK", "<ESC>", opts)
map("i", "jK", "<ESC>", opts)
map("v", "jk", "<ESC>", opts)
map("v", "JK", "<ESC>", opts)
map("v", "jK", "<ESC>", opts)
