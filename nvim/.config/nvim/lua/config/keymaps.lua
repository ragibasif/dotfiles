-- Key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- disable arrows
map("", "<up>", "<nop>", opts)
map("", "<down>", "<nop>", opts)
map("", "<left>", "<nop>", opts)
map("", "<right>", "<nop>", opts)

-- map jk to escape
map("i", "jk", "<ESC>", opts)
map("i", "Jk", "<ESC>", opts)
map("i", "JK", "<ESC>", opts)
map("i", "jK", "<ESC>", opts)

map("v", "jk", "<ESC>", opts)
map("v", "Jk", "<ESC>", opts)
map("v", "JK", "<ESC>", opts)
map("v", "jK", "<ESC>", opts)

map("c", "jk", "<ESC>", opts)
map("c", "Jk", "<ESC>", opts)
map("c", "JK", "<ESC>", opts)
map("c", "jK", "<ESC>", opts)
