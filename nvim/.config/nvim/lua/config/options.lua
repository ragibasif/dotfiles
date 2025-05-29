-- options.lua

--------------------------------------------------------------------------------
--                                  OPTIONS                                   --
--------------------------------------------------------------------------------

-- This file contains all the Neovim editor options and settings.
-- It's organized into logical groups for better maintainability.

local options = {
	-- Spell checking configuration
	-- TODO: fix
	-- spell = true,  -- Currently disabled spell checking
	spelllang = "en", -- Set spell check language to English

	-- TODO: Folds
	-- Fold-related settings (currently disabled)
	-- foldmethod = "",  -- Method for creating folds (manual, indent, expr, etc.)
	-- foldlevel = -1,   -- Close folds with level higher than this
	-- foldexpr= "",     -- Expression used when 'foldmethod' is 'expr'

	-- Line numbering configuration
	number = true, -- Show absolute line numbers
	relativenumber = true, -- Show relative line numbers
	numberwidth = 4, -- Width of line number column
	ruler = true, -- Show cursor position in status line

	hidden = true, -- Allow buffers to be hidden without saving

	confirm = true, -- Show dialog when operations would fail (like quitting with unsaved changes)

	-- Display and rendering options
	background = "dark", -- Use dark color scheme variants
	wrap = false, -- Disable line wrapping
	syntax = "on", -- Enable syntax highlighting
	scrolloff = 10, -- Minimum lines to keep above/below cursor
	sidescrolloff = 10, -- Minimum columns to keep left/right of cursor

	-- Mouse behavior
	mouse = "", -- Disable mouse support completely

	-- File handling options
	swapfile = false, -- Disable swap file creation
	backup = false, -- Disable backup file creation
	writebackup = false, -- Disable backup before overwriting file
	-- Undo file configuration
	undodir = vim.fn.stdpath("config") .. "/undo", -- Directory to store undo files
	undofile = true, -- Enable persistent undo

	-- Search options
	incsearch = true, -- Show matches while typing search pattern
	hlsearch = true, -- Highlight all search matches
	ignorecase = true, -- Case insensitive search
	smartcase = true, -- Case sensitive when search contains uppercase

	-- Timing options
	updatetime = 300, -- Time in ms before swap file is written
	timeoutlen = 500, -- Time in ms to wait for mapped sequence to complete

	-- UI elements
	signcolumn = "yes", -- Always show sign column (for git/diagnostics)
	termguicolors = true, -- Enable 24-bit RGB color in terminal

	-- Indentation and tab settings
	smarttab = true, -- <Tab> at start of line inserts 'shiftwidth' spaces
	expandtab = true, -- Convert tabs to spaces
	shiftwidth = 4, -- Number of spaces for each indentation
	tabstop = 4, -- Number of spaces a <Tab> counts for
	softtabstop = 4, -- Number of spaces a <Tab> counts for while editing

	-- Indentation behavior
	cindent = true, -- Enable C-style indenting
	smartindent = true, -- Do smart autoindenting
	autoindent = true, -- Copy indent from current line when starting new line
	breakindent = true, -- Wrapped lines continue visually indented

	-- Cursor and line highlighting
	cursorline = true, -- Highlight current line
	cursorcolumn = true, -- Highlight current column
	colorcolumn = "80", -- Highlight column at 80 characters
	guicursor = "", -- Disable special cursor shapes in GUI mode

	-- Window splitting behavior
	inccommand = "split", -- Show effects of command incrementally in split window
	splitbelow = true, -- New horizontal splits open below current
	splitright = true, -- New vertical splits open to the right of current

	autoread = true, -- Automatically reload files changed outside Vim

	-- Command-line completion
	wildmenu = true, -- Enhanced command-line completion
	wildmode = "longest:full,full", -- Completion mode
	-- completeopt = { "menuone", "noselect" },  -- Completion options (set later)
	pumheight = 10, -- Maximum number of items in popup menu

	-- Whitespace visualization
	list = true, -- Show invisible characters
	-- listchars = { tab = "» ", space = "·", trail = "·", extends = "→", precedes = "←", nbsp = "␣", eol = "¬" },

	-- UI elements customization
	fillchars = "eob: ,vert:¦", -- Characters used for empty lines and vertical splits

	-- Text concealment (mainly for Markdown)
	conceallevel = 2, -- Conceal certain syntax elements (like ** in Markdown)

	-- Status and command display
	showmode = true, -- Show current mode in command line
	showcmd = true, -- Show partial commands in status line
	laststatus = 0, -- Never show status line
	ttyfast = true, -- Indicates fast terminal connection for smoother redrawing
	smoothscroll = true, -- Smooth scrolling

	-- Gutter appearance
	statuscolumn = "%s%=%l  ", -- Custom line number column format
}

-- Apply all options to Neovim
for k, v in pairs(options) do
	vim.o[k] = v
end

-- Completion options
vim.opt.completeopt = { "menuone", "noselect" } -- Show menu even for one match, don't auto-select

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
