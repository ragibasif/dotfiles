-- options.lua

--------------------------------------------------------------------------------
--                                  OPTIONS                                   --
--------------------------------------------------------------------------------

local options = {

	-- TODO: Folds
	-- foldmethod = "",
	-- foldlevel = -1,
	-- foldexpr= "",

	number = true,
	relativenumber = true,
	numberwidth = 4,
	ruler = true,

	hidden = true,

	confirm = true,

	background = "dark",
	wrap = false,
	syntax = "on",
	scrolloff = 10,
	sidescrolloff = 10,

	mouse = "",

	swapfile = false,
	backup = false,
	writebackup = false,
	undodir = vim.fn.stdpath("config") .. "/undo",
	undofile = true,

	incsearch = true,
	hlsearch = true,
	ignorecase = true,
	smartcase = true,

	updatetime = 300,
	timeoutlen = 500,

	signcolumn = "yes",
	termguicolors = true,

	smarttab = true,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = 4,

	cindent = true,
	smartindent = true,
	autoindent = true,
	breakindent = true,

	cursorline = true,
	cursorcolumn = true,
	colorcolumn = "80",
	guicursor = "",

	inccommand = "split",
	splitbelow = true,
	splitright = true,

	autoread = true,

	wildmenu = true,
	wildmode = "longest:full,full",
	-- completeopt = { "menuone", "noselect" },
	pumheight = 10,

	list = true,
	-- listchars = { tab = "» ", space = "·", trail = "·", extends = "→", precedes = "←", nbsp = "␣", eol = "¬" },

	conceallevel = 2,
	showmode = true,
	showcmd = true,
	laststatus = 0,
	ttyfast = true,
	smoothscroll = true,
}

for k, v in pairs(options) do
	vim.o[k] = v
end

vim.opt.listchars =
	{ tab = "» ", space = "·", trail = "·", extends = "→", precedes = "←", nbsp = "␣", eol = "¬" }

vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.shortmess:append("c")

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.diagnostic.config({
	signs = false,
})
