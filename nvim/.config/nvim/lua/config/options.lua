-- options.lua

vim.opt.spell = true
vim.opt.spelllang = "en"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.ruler = true

vim.opt.hidden = true
vim.opt.confirm = true
vim.opt.background = "dark"
vim.opt.wrap = false

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.mouse = ""

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true

vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.cindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true

vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.colorcolumn = "80"
vim.opt.guicursor = ""

vim.opt.inccommand = "split"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.autoread = true

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.pumheight = 10

vim.opt.list = true
vim.opt.fillchars = "eob: ,vert:¦"

vim.opt.conceallevel = 2
vim.opt.showmatch = true
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.laststatus = 0
vim.opt.ttyfast = true
vim.opt.smoothscroll = true
vim.opt.statuscolumn = "%s%=%l  "

-- Only for Neovim 0.10+
if vim.fn.has("nvim-0.10") == 1 then
	vim.opt.winborder = "rounded"
end

vim.cmd("hi statusline guibg=NONE")

-- Completion options
vim.opt.completeopt = { "menuone", "noselect" } -- Show menu even for one match, don't auto-select

vim.opt.listchars = {
	tab = "» ",
	space = "·",
	trail = "·",
	extends = "→",
	precedes = "←",
	nbsp = "␣",
	eol = "¬",
}

-- Shorten certain messages to avoid clutter
vim.opt.shortmess:append("c") -- Don't give ins-completion-menu messages

-- Set up clipboard integration (scheduled to avoid potential race conditions)
vim.schedule(function()
	vim.o.clipboard = "unnamedplus" -- Use system clipboard for all operations
end)

-- Diagnostic (error/warning) display configuration
vim.diagnostic.config({
	signs = true, -- Show signs in the gutter for diagnostics
})
