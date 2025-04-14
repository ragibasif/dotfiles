-- OPTIONS
-- Leader
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Basic settings
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.hidden = true -- Enable background buffers
vim.opt.wrap = false -- Disable line wrap
vim.opt.syntax = "on" -- Enable syntax highlighting

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.mouse = "" -- Disable mouse support (to enable: vim.opt.mouse = "a")
vim.opt.swapfile = false -- Disable swap file
vim.opt.backup = false -- Disable backup file
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo" -- Set undo directory
vim.opt.undofile = true -- Enable persistent undo
vim.opt.incsearch = true -- Incremental search
vim.opt.hlsearch = true -- Enable search highlight
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Enable smart case search
vim.opt.updatetime = 300 -- Faster completion
vim.opt.timeoutlen = 500 -- Time to wait for a mapped sequence to complete
vim.opt.signcolumn = "yes" -- Always show sign column
vim.opt.termguicolors = true -- True color support
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Shift width for indentation
vim.opt.tabstop = 4 -- Number of spaces for a tab
vim.opt.smartindent = true -- Smart indent
vim.opt.cursorline = true -- Highlight the current line
vim.opt.inccommand = "split" -- Preview substitutions live, as you type!
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.softtabstop = 4
vim.opt.numberwidth = 4
vim.opt.ruler = true
vim.opt.writebackup = false
vim.opt.cursorcolumn = true
vim.opt.colorcolumn = "80"
vim.opt.guicursor = "" -- Set insert mode cursor to block
vim.opt.background = "dark"

-- Advanced settings
vim.opt.splitbelow = true -- Split window below
vim.opt.splitright = true -- Split window to the right
vim.opt.scrolloff = 10 -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 10 -- Keep 8 columns left/right of cursor
vim.opt.wildmenu = true -- Enable command-line completion
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.completeopt = { "menuone", "noselect" } -- Better completion
vim.opt.list = true -- Show some invisible characters
vim.opt.listchars = { tab = "» ", trail = "·", extends = "→", precedes = "←", nbsp = "␣", eol = "¬" }
vim.opt.pumheight = 10 -- Limit completion items
vim.opt.showmode = true -- Don't show mode in command line
vim.opt.shortmess:append("c") -- Don't show completion messages
vim.opt.breakindent = true -- Enable break indent
-- vim.opt.conceallevel = 1
