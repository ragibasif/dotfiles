-- Key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Remap <esc> to jk mode key mappings
map("i", "jk", "<esc>",opts)
map("v", "jk", "<esc>",opts)

-- Visual mode key mappings
-- map("v", "<", "<gv", opts)                               -- Indent left and reselect
-- map("v", ">", ">gv", opts)                               -- Indent right and reselect

-- Command mode key mappings
-- map("c", "w!!", "w !sudo tee % > /dev/null", { noremap = true }) -- Save with sudo
